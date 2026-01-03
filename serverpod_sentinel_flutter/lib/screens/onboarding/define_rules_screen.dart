import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../theme/app_theme.dart';
import '../../routes.dart';

class DefineRulesScreen extends StatefulWidget {
  const DefineRulesScreen({super.key});

  @override
  State<DefineRulesScreen> createState() => _DefineRulesScreenState();
}

class _DefineRulesScreenState extends State<DefineRulesScreen> {
  String _selectedTemplate = 'Auto-Assign Reviewers';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isDesktop = constraints.maxWidth >= AppTheme.tabletBreakpoint;

          return Row(
            children: [
              if (isDesktop) _OnboardingSidebar(onBack: () => context.pop()),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.symmetric(
                          horizontal: isDesktop ? 48 : 24,
                          vertical: isDesktop ? 48 : 32,
                        ),
                        child: Center(
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 1000),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Let's automate your first workflow",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: -0.5,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                const Text(
                                  'Choose a starter rule to help your team save time immediately. You can fully customize these rules or disable them later.',
                                  style: TextStyle(
                                    color: Color(0xFF94A3B8),
                                    fontSize: 17,
                                    height: 1.5,
                                  ),
                                ),
                                const SizedBox(height: 32),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Popular Templates',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    if (isDesktop)
                                      TextButton(
                                        onPressed: () {},
                                        child: const Text(
                                          'View all templates',
                                          style: TextStyle(
                                            color: AppTheme.primary,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                                const SizedBox(height: 24),
                                _TemplateGrid(
                                  selectedTemplate: _selectedTemplate,
                                  onTemplateChanged: (template) => setState(
                                    () => _selectedTemplate = template,
                                  ),
                                  isDesktop: isDesktop,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    _StickyFooter(isDesktop: isDesktop),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _OnboardingSidebar extends StatelessWidget {
  final VoidCallback onBack;
  const _OnboardingSidebar({required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      decoration: const BoxDecoration(
        color: Color(0xFF1E293B),
        border: Border(right: BorderSide(color: Color(0xFF334155))),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              children: [
                InkWell(
                  onTap: onBack,
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                const Text(
                  'Onboarding',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  _SidebarStep(
                    title: 'Connect Repository',
                    subtitle: 'GitHub connected',
                    isCompleted: true,
                  ),
                  const SizedBox(height: 24),
                  _SidebarStep(
                    title: 'Invite Team Members',
                    subtitle: '3 members invited',
                    isCompleted: true,
                  ),
                  const SizedBox(height: 24),
                  const _SidebarStep(
                    title: 'Define First Rule',
                    subtitle: 'Select a template to start automating.',
                    isActive: true,
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: Color(0xFF334155))),
            ),
            child: Row(
              children: [
                const Text(
                  'Need help? ',
                  style: TextStyle(color: Color(0xFF94A3B8), fontSize: 12),
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: const Text(
                    'Read the docs',
                    style: TextStyle(color: AppTheme.primary, fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SidebarStep extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isCompleted;
  final bool isActive;

  const _SidebarStep({
    required this.title,
    required this.subtitle,
    this.isCompleted = false,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isCompleted ? AppTheme.primary : Colors.transparent,
            border: isCompleted
                ? null
                : Border.all(
                    color: isActive
                        ? AppTheme.primary
                        : const Color(0xFF475569),
                    width: 2,
                  ),
          ),
          child: Center(
            child: isCompleted
                ? const Icon(Icons.check, color: Colors.white, size: 14)
                : isActive
                ? Container(
                    width: 10,
                    height: 10,
                    decoration: const BoxDecoration(
                      color: AppTheme.primary,
                      shape: BoxShape.circle,
                    ),
                  )
                : null,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: isActive ? Colors.white : const Color(0xFF94A3B8),
                  fontSize: isActive ? 16 : 14,
                  fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(color: Color(0xFF64748B), fontSize: 12),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _TemplateGrid extends StatelessWidget {
  final String selectedTemplate;
  final Function(String) onTemplateChanged;
  final bool isDesktop;

  const _TemplateGrid({
    required this.selectedTemplate,
    required this.onTemplateChanged,
    required this.isDesktop,
  });

  @override
  Widget build(BuildContext context) {
    final templates = [
      _TemplateData(
        title: 'Auto-Assign Reviewers',
        description:
            'Round-robin assignment for new PRs to distribute workload evenly among team members.',
        icon: Icons.group_add,
        iconBgColor: const Color(0xFF3B82F6),
        tag: 'Code Review',
        tagColor: const Color(0xFF3B82F6),
      ),
      _TemplateData(
        title: 'Block Deploys on Failure',
        description:
            'Automatically stop production deploys if critical tests fail or error rates spike.',
        icon: Icons.block,
        iconBgColor: const Color(0xFFEF4444),
        tag: 'Safety',
        tagColor: const Color(0xFFEF4444),
      ),
      _TemplateData(
        title: 'Slack Notifications',
        description:
            'Post to #dev-ops channel immediately when incidents occur or deploys succeed.',
        icon: Icons.notifications_active,
        iconBgColor: const Color(0xFFF59E0B),
        tag: 'Communication',
        tagColor: const Color(0xFFF59E0B),
      ),
      _TemplateData(
        title: 'Stale Branch Cleanup',
        description:
            'Delete merged branches older than 7 days to keep your repository clean and performant.',
        icon: Icons.cleaning_services,
        iconBgColor: const Color(0xFF10B981),
        tag: 'Maintenance',
        tagColor: const Color(0xFF10B981),
      ),
    ];

    if (isDesktop) {
      return Wrap(
        spacing: 24,
        runSpacing: 24,
        children: templates
            .map(
              (t) => SizedBox(
                width: (1000 - 24) / 2,
                child: _TemplateCard(
                  data: t,
                  selected: selectedTemplate == t.title,
                  onTap: () => onTemplateChanged(t.title),
                ),
              ),
            )
            .toList(),
      );
    } else {
      return Column(
        children: templates
            .map(
              (t) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: _TemplateCard(
                  data: t,
                  selected: selectedTemplate == t.title,
                  onTap: () => onTemplateChanged(t.title),
                ),
              ),
            )
            .toList(),
      );
    }
  }
}

class _TemplateData {
  final String title;
  final String description;
  final IconData icon;
  final Color iconBgColor;
  final String tag;
  final Color tagColor;

  _TemplateData({
    required this.title,
    required this.description,
    required this.icon,
    required this.iconBgColor,
    required this.tag,
    required this.tagColor,
  });
}

class _TemplateCard extends StatelessWidget {
  final _TemplateData data;
  final bool selected;
  final VoidCallback onTap;

  const _TemplateCard({
    required this.data,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: selected
              ? AppTheme.primary.withOpacity(0.1)
              : const Color(0xFF1E293B),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selected ? AppTheme.primary : const Color(0xFF334155),
            width: selected ? 2 : 1,
          ),
          boxShadow: selected
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: data.iconBgColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(data.icon, color: data.iconBgColor, size: 28),
                ),
                const SizedBox(height: 16),
                Text(
                  data.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  data.description,
                  style: const TextStyle(
                    color: Color(0xFF94A3B8),
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: data.tagColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: data.tagColor.withOpacity(0.3)),
                  ),
                  child: Text(
                    data.tag,
                    style: TextStyle(
                      color: data.tagColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            if (selected)
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: const BoxDecoration(
                    color: AppTheme.primary,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(color: Colors.black26, blurRadius: 4),
                    ],
                  ),
                  child: const Icon(Icons.check, color: Colors.white, size: 16),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _StickyFooter extends StatelessWidget {
  final bool isDesktop;
  const _StickyFooter({required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      decoration: BoxDecoration(
        color: AppTheme.background.withOpacity(0.95),
        border: const Border(top: BorderSide(color: Color(0xFF334155))),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () => context.go(AppRoutes.dashboard),
                child: const Text(
                  'Skip for now',
                  style: TextStyle(
                    color: Color(0xFF64748B),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Row(
                children: [
                  if (isDesktop)
                    const Padding(
                      padding: EdgeInsets.only(right: 16),
                      child: Text(
                        'Step 3 of 3',
                        style: TextStyle(
                          color: Color(0xFF64748B),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ElevatedButton(
                    onPressed: () => context.go(AppRoutes.dashboard),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primary,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 8,
                      shadowColor: AppTheme.primary.withOpacity(0.2),
                    ),
                    child: Row(
                      children: const [
                        Text(
                          'Enable Rule & Finish',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.arrow_forward, size: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
