# Serverpod Sentinel → "DevOps Butler" Implementation Plan

> **Goal**: Transform Serverpod Sentinel from a monitoring dashboard into an AI-powered "DevOps Butler" to align with the hackathon theme "Flutter Butler".

---

## User Review Required

> [!IMPORTANT]
> This plan involves adding new backend endpoints, models, and UI screens. Please confirm the scope before implementation begins. No breaking changes to existing features.

---

## Proposed Changes

### Phase 1: Backend – Conversational AI Engine

This phase adds the core backend logic for a conversational assistant.

---

#### [NEW] `lib/src/protocol/butler/butler_conversation.spy.yaml`

Create a new Serverpod model to store conversation history.

```yaml
class: ButlerConversation
table: butler_conversations
fields:
  userId: int
  title: String
  createdAt: DateTime
  updatedAt: DateTime
```

---

#### [NEW] `lib/src/protocol/butler/butler_message.spy.yaml`

Create a model for individual chat messages.

```yaml
class: ButlerMessage
table: butler_messages
fields:
  conversationId: int, parent=butler_conversations
  role: String # 'user' | 'assistant'
  content: String
  metadata: String? # JSON for tool calls, etc.
  createdAt: DateTime
```

---

#### [NEW] `lib/src/endpoints/butler_endpoint.dart`

Create a new endpoint for the butler conversational interface.

**Methods:**

| Method | Signature | Description |
| :--- | :--- | :--- |
| `sendMessage` | `Future<ButlerMessage> sendMessage(Session s, int conversationId, String userMessage)` | Sends a user message, triggers AI, returns assistant response. |
| `startConversation` | `Future<ButlerConversation> startConversation(Session s)` | Creates a new conversation thread. |
| `getConversations` | `Future<List<ButlerConversation>> getConversations(Session s, {int? limit})` | Lists user's past conversations. |
| `getMessages` | `Future<List<ButlerMessage>> getMessages(Session s, int conversationId)` | Gets all messages in a conversation. |

**AI Integration Logic (inside `sendMessage`):**

1.  Fetch last N messages from `conversationId` for context.
2.  Build a prompt including:
    *   System context: "You are Sentinel, a DevOps Butler..."
    *   Tool definitions: `analyzeIncident`, `executePlaybook`, `getServiceStatus`.
    *   Conversation history.
    *   User's new message.
3.  Call LLM (OpenAI/Gemini via `AiService`).
4.  If LLM returns a "tool call", execute it (e.g., call `PlaybookEndpoint.execute`).
5.  Store and return the assistant's response.

---

#### [MODIFY] [ai_service.dart](file:///d:/Abdisa/projects/serverpod_sentinel/serverpod_sentinel_server/lib/src/business/ai/ai_service.dart)

Add a new generic `chat` method for multi-turn conversations.

**Add Method:**

```dart
/// Generic chat completion with tool support.
static Future<Map<String, dynamic>> chat({
  required Session session,
  required List<Map<String, String>> messages, // [{role: 'user', content: '...'}]
  List<Map<String, dynamic>>? tools, // OpenAI function definitions
}) async {
  // ... similar to analyzeIncident but with tool_choice: 'auto'
}
```

---

#### [NEW] `lib/src/business/ai/butler_tools.dart`

Define the "tools" the Butler can use. This is a schema the LLM understands.

```dart
class ButlerTools {
  static List<Map<String, dynamic>> getToolDefinitions() {
    return [
      {
        'type': 'function',
        'function': {
          'name': 'get_service_status',
          'description': 'Get the current status and health of a monitored service.',
          'parameters': {
            'type': 'object',
            'properties': {
              'service_name': {'type': 'string', 'description': 'Name of the service'},
            },
            'required': ['service_name'],
          },
        },
      },
      {
        'type': 'function',
        'function': {
          'name': 'execute_playbook',
          'description': 'Run an automated remediation playbook.',
          'parameters': {
            'type': 'object',
            'properties': {
              'playbook_name': {'type': 'string'},
              'incident_id': {'type': 'integer'},
            },
            'required': ['playbook_name'],
          },
        },
      },
      {
        'type': 'function',
        'function': {
          'name': 'get_daily_summary',
          'description': 'Get a summary of incidents and alerts from the last 24 hours.',
          'parameters': {'type': 'object', 'properties': {}},
        },
      },
    ];
  }

  /// Executes a tool call and returns the result string.
  static Future<String> executeTool(Session session, String toolName, Map<String, dynamic> args) async {
    switch (toolName) {
      case 'get_service_status':
        // Call ServiceEndpoint.get or list
        return '{"status": "operational", "cpu": 45, "memory": 60}';
      case 'execute_playbook':
        // Call PlaybookEndpoint.execute
        return '{"status": "success", "message": "Playbook executed."}';
      case 'get_daily_summary':
        // Aggregate data from Incident, Alert tables
        return '{"incidents": 2, "alerts": 5, "status": "All resolved"}';
      default:
        return '{"error": "Unknown tool"}';
    }
  }
}
```

---

#### [MODIFY] [streaming_endpoint.dart](file:///d:/Abdisa/projects/serverpod_sentinel/serverpod_sentinel_server/lib/src/endpoints/streaming_endpoint.dart)

Add a new subscription type for Butler chat streaming (optional, for streaming responses).

**Changes:**
1.  Add `BUTLER_CHAT` to `StreamSubscriptionType` enum in protocol.
2.  Handle `BUTLER_CHAT` in `_handleSubscription` to join a user-specific channel.

---

### Phase 2: Frontend – Chat UI

This phase creates the Flutter UI for the conversational butler.

---

#### [NEW] `lib/screens/butler/butler_chat_screen.dart`

The main chat interface.

**Widget Structure:**

```
Scaffold
├── AppBar (Title: "Ask Sentinel")
├── Body: Column
│   ├── Expanded: ListView.builder (messages)
│   │   └── _ChatBubble(message: ButlerMessage)
│   └── _ChatInputBar(onSend: (text) => ...)
└── FAB (optional: Voice Input)
```

**State Management (Riverpod):**

*   `butlerConversationsProvider`: `FutureProvider` fetching `ButlerEndpoint.getConversations`.
*   `butlerMessagesProvider(int conversationId)`: `FutureProvider.family` fetching messages.
*   `sendMessageProvider`: `StateNotifierProvider` handling send logic and optimistic updates.

---

#### [NEW] `lib/providers/butler_provider.dart`

```dart
final butlerConversationsProvider = FutureProvider<List<ButlerConversation>>((ref) async {
  final client = ref.watch(clientProvider);
  return client.butler.getConversations();
});

final butlerMessagesProvider = FutureProvider.family<List<ButlerMessage>, int>((ref, conversationId) async {
  final client = ref.watch(clientProvider);
  return client.butler.getMessages(conversationId);
});
```

---

#### [NEW] `lib/widgets/chat_bubble.dart`

A reusable chat bubble widget.

```dart
class ChatBubble extends StatelessWidget {
  final ButlerMessage message;
  // ... styling based on message.role (user vs assistant)
}
```

---

#### [MODIFY] [router.dart](file:///d:/Abdisa/projects/serverpod_sentinel/serverpod_sentinel_flutter/lib/router.dart)

Add route for the new butler screen.

```dart
GoRoute(
  path: '/butler',
  name: 'butler',
  builder: (context, state) => const ButlerChatScreen(),
),
```

---

#### [MODIFY] [sentinel_sidebar.dart](file:///d:/Abdisa/projects/serverpod_sentinel/serverpod_sentinel_flutter/lib/widgets/sentinel_sidebar.dart)

Add a navigation item for "Ask Sentinel".

```dart
_SidebarItem(
  icon: Icons.chat_bubble_outline_rounded,
  label: 'Ask Sentinel',
  route: '/butler',
  isActive: currentRoute == '/butler',
),
```

---

### Phase 3: "Morning Briefing" Feature

---

#### [NEW] `lib/src/endpoints/briefing_endpoint.dart`

**Methods:**

| Method | Signature | Description |
| :--- | :--- | :--- |
| `getDailyBriefing` | `Future<DailyBriefing> getDailyBriefing(Session s)` | Aggregates last 24h data and summarizes via LLM. |

**Logic:**
1.  Query `Incident` table for last 24h.
2.  Query `Alert` table.
3.  Query `AuditLog` for automated actions.
4.  Send summary to LLM with prompt: "Summarize this for a busy developer in 3 sentences."
5.  Return structured `DailyBriefing` DTO.

---

#### [NEW] `lib/src/protocol/dtos/daily_briefing.spy.yaml`

```yaml
class: DailyBriefing
fields:
  summary: String
  incidentCount: int
  alertCount: int
  automatedActionsCount: int
  topIssue: String?
  generatedAt: DateTime
```

---

#### [MODIFY] [ai_insights_screen.dart](file:///d:/Abdisa/projects/serverpod_sentinel/serverpod_sentinel_flutter/lib/screens/intelligence/ai_insights_screen.dart) or Dashboard

Display the briefing as a hero card at the top of the dashboard.

---

## Verification Plan

### Automated Tests

All tests should be run from the `serverpod_sentinel_server` directory.

| Test | Command | Description |
| :--- | :--- | :--- |
| Existing Unit Tests | `dart test test/unit/` | Run existing unit tests to check for regressions. |
| Existing Integration Tests | `dart test test/integration/` | Run existing integration tests. |
| **[NEW]** Butler Endpoint Test | `dart test test/integration/butler_endpoint_test.dart` | Test `startConversation`, `sendMessage`, `getMessages`. |
| **[NEW]** Briefing Endpoint Test | `dart test test/integration/briefing_endpoint_test.dart` | Test `getDailyBriefing` returns valid data. |
| Static Analysis | `dart analyze` | Run Dart analyzer on server code. |
| Flutter Analysis | `flutter analyze` (in `serverpod_sentinel_flutter`) | Run analyzer on Flutter code. |

**New Test File Template (`test/integration/butler_endpoint_test.dart`):**

```dart
import 'package:test/test.dart';
// ... imports

void main() {
  withServerpod('ButlerEndpoint', (sessionBuilder, endpoints) {
    test('Can start a conversation', () async {
      final session = sessionBuilder.build();
      final endpoint = ButlerEndpoint();
      final conversation = await endpoint.startConversation(session);
      expect(conversation.id, isNotNull);
      await session.close();
    });

    test('Can send a message and get a response', () async {
      final session = sessionBuilder.build();
      final endpoint = ButlerEndpoint();
      final conversation = await endpoint.startConversation(session);
      // Mock AI response or use a test API key
      final response = await endpoint.sendMessage(session, conversation.id!, 'Hello');
      expect(response.role, 'assistant');
      expect(response.content, isNotEmpty);
      await session.close();
    });
  });
}
```

### Manual Verification

1.  **Run Server**: `cd serverpod_sentinel_server && dart bin/main.dart --apply-migrations`
2.  **Run Flutter App**: `cd serverpod_sentinel_flutter && flutter run -d chrome`
3.  **Navigate to "Ask Sentinel"** in sidebar.
4.  **Send a message** like "What's the status of my services?".
5.  **Verify** assistant responds with relevant information.
6.  **Open Dashboard** and verify "Morning Briefing" card appears.

---

## File Summary

| Action | Path |
| :--- | :--- |
| NEW | `serverpod_sentinel_server/lib/src/protocol/butler/butler_conversation.spy.yaml` |
| NEW | `serverpod_sentinel_server/lib/src/protocol/butler/butler_message.spy.yaml` |
| NEW | `serverpod_sentinel_server/lib/src/endpoints/butler_endpoint.dart` |
| NEW | `serverpod_sentinel_server/lib/src/business/ai/butler_tools.dart` |
| MODIFY | `serverpod_sentinel_server/lib/src/business/ai/ai_service.dart` |
| MODIFY | `serverpod_sentinel_server/lib/src/endpoints/streaming_endpoint.dart` |
| NEW | `serverpod_sentinel_server/lib/src/protocol/dtos/daily_briefing.spy.yaml` |
| NEW | `serverpod_sentinel_server/lib/src/endpoints/briefing_endpoint.dart` |
| NEW | `serverpod_sentinel_flutter/lib/screens/butler/butler_chat_screen.dart` |
| NEW | `serverpod_sentinel_flutter/lib/providers/butler_provider.dart` |
| NEW | `serverpod_sentinel_flutter/lib/widgets/chat_bubble.dart` |
| MODIFY | `serverpod_sentinel_flutter/lib/router.dart` |
| MODIFY | `serverpod_sentinel_flutter/lib/widgets/sentinel_sidebar.dart` |
| NEW | `serverpod_sentinel_server/test/integration/butler_endpoint_test.dart` |
| NEW | `serverpod_sentinel_server/test/integration/briefing_endpoint_test.dart` |
