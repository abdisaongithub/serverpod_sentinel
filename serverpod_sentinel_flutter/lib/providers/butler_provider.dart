import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serverpod_sentinel_client/serverpod_sentinel_client.dart';
import 'client_provider.dart';

/// Fetch all conversations for the current user.
final butlerConversationsProvider = FutureProvider<List<ButlerConversation>>((
  ref,
) async {
  try {
    final client = ref.watch(clientProvider);
    return await client.butler.getConversations();
  } catch (e) {
    print('Error fetching butler conversations: $e');
    rethrow;
  }
});

/// Fetch messages for a specific conversation.
final butlerMessagesProvider = FutureProvider.family<List<ButlerMessage>, int>((
  ref,
  conversationId,
) async {
  try {
    final client = ref.watch(clientProvider);
    return await client.butler.getMessages(conversationId);
  } catch (e) {
    print('Error fetching butler messages: $e');
    rethrow;
  }
});

/// Fetch the daily briefing.
final dailyBriefingProvider = FutureProvider<DailyBriefing>((ref) async {
  try {
    final client = ref.watch(clientProvider);
    return await client.briefing.getDailyBriefing();
  } catch (e) {
    print('Error fetching daily briefing: $e');
    rethrow;
  }
});

/// Butler greeting.
final butlerGreetingProvider = FutureProvider<String>((ref) async {
  try {
    final client = ref.watch(clientProvider);
    return await client.butler.greet();
  } catch (e) {
    print('Error fetching butler greeting: $e');
    return 'Hello! How can I assist you today?';
  }
});

/// State for the current active conversation.
final activeConversationProvider = StateProvider<ButlerConversation?>(
  (ref) => null,
);

/// Butler chat controller for sending messages.
class ButlerChatController extends StateNotifier<AsyncValue<ButlerMessage?>> {
  final Client _client;
  final Ref _ref;

  ButlerChatController(this._client, this._ref)
    : super(const AsyncValue.data(null));

  /// Start a new conversation.
  Future<ButlerConversation?> startConversation() async {
    try {
      final conversation = await _client.butler.startConversation();
      _ref.read(activeConversationProvider.notifier).state = conversation;
      return conversation;
    } catch (e) {
      print('Error starting conversation: $e');
      return null;
    }
  }

  /// Send a message and get the AI response.
  Future<ButlerMessage?> sendMessage(int conversationId, String message) async {
    state = const AsyncValue.loading();
    try {
      final response = await _client.butler.sendMessage(
        conversationId,
        message,
      );
      state = AsyncValue.data(response);
      // Invalidate the messages provider to refresh the list
      _ref.invalidate(butlerMessagesProvider(conversationId));
      return response;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return null;
    }
  }
}

final butlerChatControllerProvider =
    StateNotifierProvider<ButlerChatController, AsyncValue<ButlerMessage?>>((
      ref,
    ) {
      final client = ref.watch(clientProvider);
      return ButlerChatController(client, ref);
    });
