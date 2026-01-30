import 'dart:convert';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_sentinel_server/src/generated/protocol.dart';
import 'package:serverpod_sentinel_server/src/business/ai/ai_service.dart';
import 'package:serverpod_sentinel_server/src/business/ai/butler_tools.dart';
import 'package:serverpod_sentinel_server/src/business/security/security_checks.dart';

/// Butler Endpoint - Conversational AI for DevOps
///
/// Provides a chat interface for interacting with Sentinel as a "DevOps Butler".
class ButlerEndpoint extends Endpoint {
  static const String _systemPrompt = '''
You are Sentinel, a friendly and professional DevOps Butler. You help developers and SREs manage their infrastructure with care and expertise.

Your personality:
- Professional yet warm, like a trusted colleague
- Proactive: offer suggestions when you see potential issues
- Clear: explain technical concepts simply when needed
- Efficient: be concise but thorough

You have access to tools to check service status, list incidents, execute playbooks, and get daily summaries. Use them when the user asks about their systems.

When greeting the user, be brief and helpful. Don't be overly formal.
''';

  /// Starts a new conversation thread.
  Future<ButlerConversation> startConversation(Session session) async {
    final userId = await SecurityChecks.requireAuthentication(session);

    final conversation = ButlerConversation(
      userId: userId,
      title: 'New Conversation',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    return await ButlerConversation.db.insertRow(session, conversation);
  }

  /// Gets all conversations for the current user.
  Future<List<ButlerConversation>> getConversations(
    Session session, {
    int? limit,
  }) async {
    final userId = await SecurityChecks.requireAuthentication(session);

    return await ButlerConversation.db.find(
      session,
      where: (t) => t.userId.equals(userId),
      orderBy: (t) => t.updatedAt,
      orderDescending: true,
      limit: limit ?? 20,
    );
  }

  /// Gets all messages in a conversation.
  Future<List<ButlerMessage>> getMessages(
    Session session,
    int conversationId,
  ) async {
    await SecurityChecks.requireAuthentication(session);
    // TODO: Verify user owns the conversation

    return await ButlerMessage.db.find(
      session,
      where: (t) => t.conversationId.equals(conversationId),
      orderBy: (t) => t.createdAt,
    );
  }

  /// Sends a message and gets an AI response.
  Future<ButlerMessage> sendMessage(
    Session session,
    int conversationId,
    String userMessage,
  ) async {
    await SecurityChecks.requireAuthentication(session);

    // 1. Store user message
    final userMsg = ButlerMessage(
      conversationId: conversationId,
      role: 'user',
      content: userMessage,
      createdAt: DateTime.now(),
    );
    await ButlerMessage.db.insertRow(session, userMsg);

    // 2. Fetch conversation history (last 10 messages for context)
    final history = await ButlerMessage.db.find(
      session,
      where: (t) => t.conversationId.equals(conversationId),
      orderBy: (t) => t.createdAt,
      orderDescending: true,
      limit: 10,
    );

    // 3. Build messages array for LLM
    final messages = <Map<String, dynamic>>[
      {'role': 'system', 'content': _systemPrompt},
      // Add history in chronological order
      ...history.reversed.map(
        (m) => {
          'role': m.role,
          'content': m.content,
        },
      ),
    ];

    // 4. Call AI with tools
    final response = await AiService.chat(
      session: session,
      messages: messages,
      tools: ButlerTools.getToolDefinitions(),
    );

    String assistantContent;

    // 5. Handle tool calls if any
    if (response['type'] == 'tool_call' && response['tool_calls'] != null) {
      final toolCalls = response['tool_calls'] as List<dynamic>;
      final toolResults = <Map<String, dynamic>>[];

      for (final toolCall in toolCalls) {
        final function = toolCall['function'];
        final toolName = function['name'] as String;
        final argsJson = function['arguments'] as String;
        final args = jsonDecode(argsJson) as Map<String, dynamic>;

        final result = await ButlerTools.executeTool(session, toolName, args);
        toolResults.add({
          'tool_call_id': toolCall['id'],
          'role': 'tool',
          'content': result,
        });
      }

      // 6. Send tool results back to LLM for final response
      final followUpMessages = [
        ...messages,
        {
          'role': 'assistant',
          'content': response['content'],
          'tool_calls': toolCalls,
        },
        ...toolResults,
      ];

      final finalResponse = await AiService.chat(
        session: session,
        messages: followUpMessages,
      );

      assistantContent =
          finalResponse['content'] ??
          'I apologize, I encountered an issue processing that request.';
    } else if (response['error'] != null) {
      assistantContent =
          'I apologize, but I\'m having trouble connecting to my thinking engine right now. Error: ${response['error']}';
    } else {
      assistantContent =
          response['content'] ??
          'I\'m here to help. What would you like to know about your systems?';
    }

    // 7. Store and return assistant message
    final assistantMsg = ButlerMessage(
      conversationId: conversationId,
      role: 'assistant',
      content: assistantContent,
      metadata: response['tool_calls'] != null
          ? jsonEncode(response['tool_calls'])
          : null,
      createdAt: DateTime.now(),
    );
    final savedMsg = await ButlerMessage.db.insertRow(session, assistantMsg);

    // 8. Update conversation title if it's the first message
    final conversation = await ButlerConversation.db.findById(
      session,
      conversationId,
    );
    if (conversation != null && conversation.title == 'New Conversation') {
      // Use first few words of user message as title
      final title = userMessage.length > 50
          ? '${userMessage.substring(0, 47)}...'
          : userMessage;
      conversation.title = title;
      conversation.updatedAt = DateTime.now();
      await ButlerConversation.db.updateRow(session, conversation);
    }

    return savedMsg;
  }

  /// Quick greeting for the Butler (no conversation needed).
  Future<String> greet(Session session) async {
    await SecurityChecks.requireAuthentication(session);

    // Get a quick summary
    final since = DateTime.now().subtract(const Duration(hours: 24));
    final incidents = await Incident.db.find(
      session,
      where: (t) => t.createdAt > since,
    );

    final activeIncidents = incidents
        .where(
          (i) =>
              i.status == IncidentStatus.OPEN ||
              i.status == IncidentStatus.ACKNOWLEDGED,
        )
        .length;

    if (activeIncidents > 0) {
      return 'Good to see you. I\'m keeping an eye on $activeIncidents active incident${activeIncidents > 1 ? 's' : ''}. Would you like a summary?';
    } else {
      return 'All systems are running smoothly. ${incidents.length} incident${incidents.length != 1 ? 's' : ''} in the last 24 hours, all resolved. How can I help you today?';
    }
  }
}
