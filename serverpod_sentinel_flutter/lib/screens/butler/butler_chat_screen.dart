import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serverpod_sentinel_client/serverpod_sentinel_client.dart';
import '../../theme/app_theme.dart';
import '../../providers/butler_provider.dart';
import '../../widgets/chat_bubble.dart';
import '../../widgets/sentinel_card.dart';

class ButlerChatScreen extends ConsumerStatefulWidget {
  const ButlerChatScreen({super.key});

  @override
  ConsumerState<ButlerChatScreen> createState() => _ButlerChatScreenState();
}

class _ButlerChatScreenState extends ConsumerState<ButlerChatScreen> {
  final _messageController = TextEditingController();
  final _scrollController = ScrollController();
  ButlerConversation? _activeConversation;
  bool _isSending = false;

  @override
  void initState() {
    super.initState();
    _initializeConversation();
  }

  Future<void> _initializeConversation() async {
    final controller = ref.read(butlerChatControllerProvider.notifier);
    final conversation = await controller.startConversation();
    if (mounted && conversation != null) {
      setState(() {
        _activeConversation = conversation;
      });
    }
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _sendMessage() async {
    final message = _messageController.text.trim();
    if (message.isEmpty || _activeConversation == null || _isSending) return;

    setState(() {
      _isSending = true;
    });
    _messageController.clear();

    final controller = ref.read(butlerChatControllerProvider.notifier);
    await controller.sendMessage(_activeConversation!.id!, message);

    if (mounted) {
      setState(() {
        _isSending = false;
      });
      _scrollToBottom();
    }
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final greetingAsync = ref.watch(butlerGreetingProvider);

    return Scaffold(
      backgroundColor: AppTheme.darkBackground,
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppTheme.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.psychology_rounded,
                color: AppTheme.primary,
                size: 24,
              ),
            ),
            const SizedBox(width: 12),
            const Text(
              'Ask Sentinel',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () async {
              setState(() {
                _activeConversation = null;
              });
              await _initializeConversation();
            },
            icon: const Icon(
              Icons.add_comment_rounded,
              color: AppTheme.darkTextMuted,
            ),
            tooltip: 'New Conversation',
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Column(
        children: [
          // Welcome Card
          if (_activeConversation == null ||
              ref
                  .watch(butlerMessagesProvider(_activeConversation!.id!))
                  .when(
                    data: (messages) => messages.isEmpty,
                    loading: () => true,
                    error: (_, __) => true,
                  ))
            Padding(
              padding: const EdgeInsets.all(24),
              child: SentinelCard(
                color: AppTheme.primary.withOpacity(0.1),
                child: Column(
                  children: [
                    const Icon(
                      Icons.waving_hand_rounded,
                      size: 48,
                      color: AppTheme.primary,
                    ),
                    const SizedBox(height: 16),
                    greetingAsync.when(
                      data: (greeting) => Text(
                        greeting,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      loading: () => const Text('Connecting to Sentinel...'),
                      error: (_, __) =>
                          const Text('Hello! How can I help you today?'),
                    ),
                    const SizedBox(height: 24),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        _SuggestionChip(
                          label: 'Show active incidents',
                          onTap: () =>
                              _quickSend('Show me all active incidents'),
                        ),
                        _SuggestionChip(
                          label: 'Service status',
                          onTap: () =>
                              _quickSend('What\'s the status of my services?'),
                        ),
                        _SuggestionChip(
                          label: 'Daily summary',
                          onTap: () => _quickSend(
                            'Give me a summary of the last 24 hours',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

          // Messages List
          Expanded(
            child: _activeConversation == null
                ? const Center(child: CircularProgressIndicator())
                : ref
                      .watch(butlerMessagesProvider(_activeConversation!.id!))
                      .when(
                        data: (messages) {
                          if (messages.isEmpty && !_isSending) {
                            return const SizedBox();
                          }
                          return ListView.builder(
                            controller: _scrollController,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 16,
                            ),
                            itemCount: messages.length + (_isSending ? 1 : 0),
                            itemBuilder: (context, index) {
                              if (_isSending && index == messages.length) {
                                return const ThinkingBubble();
                              }
                              return ChatBubble(
                                message: messages[index],
                                showTimestamp: true,
                              );
                            },
                          );
                        },
                        loading: () =>
                            const Center(child: CircularProgressIndicator()),
                        error: (error, _) => Center(
                          child: Text('Error loading messages: $error'),
                        ),
                      ),
          ),

          // Input Bar
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppTheme.darkSurface,
              border: Border(
                top: BorderSide(color: AppTheme.darkSurfaceVariant, width: 1),
              ),
            ),
            child: SafeArea(
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: InputDecoration(
                        hintText: 'Ask Sentinel anything...',
                        hintStyle: TextStyle(color: AppTheme.darkTextMuted),
                        filled: true,
                        fillColor: AppTheme.darkBackground,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                      ),
                      onSubmitted: (_) => _sendMessage(),
                      enabled: !_isSending,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    decoration: BoxDecoration(
                      color: AppTheme.primary,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: IconButton(
                      onPressed: _isSending ? null : _sendMessage,
                      icon: _isSending
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation(
                                  Colors.white,
                                ),
                              ),
                            )
                          : const Icon(Icons.send_rounded, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _quickSend(String message) {
    _messageController.text = message;
    _sendMessage();
  }
}

class _SuggestionChip extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _SuggestionChip({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppTheme.darkSurfaceVariant,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            label,
            style: const TextStyle(fontSize: 13, color: AppTheme.darkText),
          ),
        ),
      ),
    );
  }
}
