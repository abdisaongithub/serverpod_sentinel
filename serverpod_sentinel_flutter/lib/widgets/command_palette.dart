import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_theme.dart';
import '../theme/sentinel_motion.dart';

/// Scoped provider for the search query.
final commandPaletteQueryProvider = StateProvider<String>((ref) => '');

class CommandPalette extends ConsumerWidget {
  const CommandPalette({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final query = ref.watch(commandPaletteQueryProvider);

    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: 600,
          margin: const EdgeInsets.only(top: 100),
          decoration: BoxDecoration(
            color: AppTheme.darkSurface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppTheme.darkBorder, width: 1),
            boxShadow: AppTheme.shadowHigh,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _SearchInput(),
              const Divider(height: 1),
              _SearchResults(query: query),
              _PaletteFooter(),
            ],
          ),
        ),
      ),
    );
  }
}

class _SearchInput extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          const Icon(Icons.search_rounded, color: AppTheme.primary),
          const SizedBox(width: 16),
          Expanded(
            child: TextField(
              autofocus: true,
              style: const TextStyle(fontSize: 18),
              decoration: const InputDecoration(
                hintText: 'Search for services, incidents, commands...',
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                fillColor: Colors.transparent,
              ),
              onChanged: (val) => ref.read(commandPaletteQueryProvider.notifier).state = val,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: AppTheme.darkSurfaceVariant,
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Text('ESC', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}

class _SearchResults extends StatelessWidget {
  final String query;
  const _SearchResults({required this.query});

  @override
  Widget build(BuildContext context) {
    if (query.isEmpty) {
      return _RecentItems();
    }

    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 400),
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(vertical: 8),
        children: [
          _ResultSection(title: 'Navigation'),
          _ResultItem(icon: Icons.dashboard_rounded, label: 'Go to Dashboard', shortcut: 'G D', onTap: () => context.go('/')),
          _ResultItem(icon: Icons.notifications_active_rounded, label: 'View Incidents', shortcut: 'G I', onTap: () => context.go('/incidents')),
          _ResultSection(title: 'Services'),
          _ResultItem(icon: Icons.layers_rounded, label: 'Sentinel Backend API', detail: 'Operational • us-east-1'),
          _ResultItem(icon: Icons.layers_rounded, label: 'Auth Service', detail: 'Degraded • eu-west-1'),
        ],
      ),
    );
  }
}

class _RecentItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        children: [
          Icon(Icons.search_rounded, size: 48, color: AppTheme.darkTextDim.withOpacity(0.2)),
          const SizedBox(height: 16),
          const Text('Search for anything across Sentinel', style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 4),
          Text('Try searching for a service name or "new incident"', style: TextStyle(color: AppTheme.darkTextDim, fontSize: 12)),
        ],
      ),
    );
  }
}

class _ResultSection extends StatelessWidget {
  final String title;
  const _ResultSection({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        title.toUpperCase(),
        style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppTheme.darkTextDim, letterSpacing: 1),
      ),
    );
  }
}

class _ResultItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String? detail;
  final String? shortcut;
  final VoidCallback? onTap;

  const _ResultItem({required this.icon, required this.label, this.detail, this.shortcut, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Icon(icon, size: 20, color: AppTheme.darkTextMuted),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
                  if (detail != null) Text(detail!, style: TextStyle(fontSize: 12, color: AppTheme.darkTextDim)),
                ],
              ),
            ),
            if (shortcut != null)
              Text(shortcut!, style: TextStyle(fontSize: 10, color: AppTheme.darkTextDim, fontFamily: 'monospace')),
          ],
        ),
      ),
    );
  }
}

class _PaletteFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppTheme.darkSurfaceVariant.withOpacity(0.3),
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(16)),
      ),
      child: Row(
        children: [
          _FooterKey(label: '↑↓', action: 'Navigate'),
          const SizedBox(width: 16),
          _FooterKey(label: 'Enter', action: 'Select'),
          const Spacer(),
          Text('Sentinel Spotlight v1.0', style: TextStyle(fontSize: 10, color: AppTheme.darkTextDim)),
        ],
      ),
    );
  }
}

class _FooterKey extends StatelessWidget {
  final String label;
  final String action;
  const _FooterKey({required this.label, required this.action});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          decoration: BoxDecoration(
            color: AppTheme.darkSurfaceHighlight,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(label, style: const TextStyle(fontSize: 9, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(width: 6),
        Text(action, style: TextStyle(fontSize: 10, color: AppTheme.darkTextDim)),
      ],
    );
  }
}
