import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../theme/app_theme.dart';
import '../../routes.dart';

class CreateEnvScreen extends StatefulWidget {
  const CreateEnvScreen({super.key});

  @override
  State<CreateEnvScreen> createState() => _CreateEnvScreenState();
}

class _CreateEnvScreenState extends State<CreateEnvScreen> {
  String _selectedEnvType = 'Production';
  String _selectedRegion = 'us-east-1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isDesktop = constraints.maxWidth >= AppTheme.tabletBreakpoint;

          return Row(
            children: [
              if (isDesktop) const _OnboardingSidebar(),
              Expanded(
                child: Column(
                  children: [
                    _Header(isDesktop: isDesktop),
                    Expanded(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.symmetric(
                          horizontal: isDesktop ? 48 : 24,
                          vertical: isDesktop ? 64 : 32,
                        ),
                        child: Center(
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 900),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _IntroSection(isDesktop: isDesktop),
                                const SizedBox(height: 40),
                                _FormCard(
                                  selectedEnvType: _selectedEnvType,
                                  onEnvTypeChanged: (type) =>
                                      setState(() => _selectedEnvType = type),
                                  selectedRegion: _selectedRegion,
                                  onRegionChanged: (region) =>
                                      setState(() => _selectedRegion = region!),
                                ),
                                const SizedBox(height: 32),
                                const _LegalFooter(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
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
  const _OnboardingSidebar();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      decoration: const BoxDecoration(
        color: Color(0xFF0D121C),
        border: Border(right: BorderSide(color: Color(0xFF1E293B))),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppTheme.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.grid_view,
                    color: AppTheme.primary,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                const Text(
                  'DevOps Platform',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const Divider(color: Color(0xFF1E293B), height: 1),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'ONBOARDING PROGRESS',
                    style: TextStyle(
                      color: Color(0xFF64748B),
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 24),
                  _ProgressItem(
                    title: 'Create Account',
                    subtitle: 'Completed 2 mins ago',
                    isCompleted: true,
                  ),
                  const SizedBox(height: 32),
                  _ProgressItem(
                    title: 'Create Environment',
                    subtitle: 'In progress',
                    isActive: true,
                  ),
                  const SizedBox(height: 32),
                  const _ProgressItem(
                    title: 'Connect Cloud',
                    subtitle: 'Next step',
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: TextButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.help_outline,
                size: 18,
                color: Color(0xFF94A3B8),
              ),
              label: const Text(
                'Help & Documentation',
                style: TextStyle(color: Color(0xFF94A3B8), fontSize: 13),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProgressItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isCompleted;
  final bool isActive;

  const _ProgressItem({
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
        Column(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isCompleted ? AppTheme.primary : Colors.transparent,
                border: isCompleted
                    ? null
                    : Border.all(
                        color: isActive
                            ? AppTheme.primary
                            : const Color(0xFF334155),
                        width: 2,
                      ),
                boxShadow: isCompleted
                    ? [
                        BoxShadow(
                          color: AppTheme.primary.withOpacity(0.2),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ]
                    : null,
              ),
              child: Center(
                child: isCompleted
                    ? const Icon(Icons.check, color: Colors.white, size: 18)
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
          ],
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: isActive
                    ? AppTheme.primary
                    : (isCompleted ? Colors.white : const Color(0xFF94A3B8)),
                fontSize: 14,
                fontWeight: isActive ? FontWeight.bold : FontWeight.w600,
              ),
            ),
            Text(
              subtitle,
              style: const TextStyle(color: Color(0xFF64748B), fontSize: 12),
            ),
          ],
        ),
      ],
    );
  }
}

class _Header extends StatelessWidget {
  final bool isDesktop;
  const _Header({required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: const Color(0xFF101622).withOpacity(0.8),
        border: const Border(bottom: BorderSide(color: Color(0xFF1E293B))),
      ),
      child: Row(
        children: [
          if (!isDesktop)
            IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () {},
            ),
          if (isDesktop) ...[
            const Text(
              'Onboarding',
              style: TextStyle(color: Color(0xFF94A3B8), fontSize: 14),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(
                Icons.chevron_right,
                color: Color(0xFF64748B),
                size: 16,
              ),
            ),
            const Text(
              'Environment Setup',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
          const Spacer(),
          TextButton(
            onPressed: () {},
            child: const Text(
              'Save as Draft',
              style: TextStyle(color: Color(0xFF94A3B8), fontSize: 14),
            ),
          ),
          const SizedBox(width: 16),
          Container(width: 1, height: 24, color: const Color(0xFF334155)),
          const SizedBox(width: 16),
          Container(
            width: 36,
            height: 36,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Color(0xFF60A5FA), AppTheme.primary],
              ),
            ),
            child: const Center(
              child: Text(
                'JD',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _IntroSection extends StatelessWidget {
  final bool isDesktop;
  const _IntroSection({required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: isDesktop
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        Text(
          'Set up your first Environment',
          textAlign: isDesktop ? TextAlign.left : TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'An environment groups your services and resources. Most teams start by defining their primary deployment targets like \'Staging\' or \'Production\'.',
          textAlign: isDesktop ? TextAlign.left : TextAlign.center,
          style: const TextStyle(
            color: Color(0xFF92A4C9),
            fontSize: 17,
            height: 1.6,
          ),
        ),
      ],
    );
  }
}

class _FormCard extends StatelessWidget {
  final String selectedEnvType;
  final Function(String) onEnvTypeChanged;
  final String selectedRegion;
  final Function(String?) onRegionChanged;

  const _FormCard({
    required this.selectedEnvType,
    required this.onEnvTypeChanged,
    required this.selectedRegion,
    required this.onRegionChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF192233),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF334155).withOpacity(0.5)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 40,
            offset: const Offset(0, 20),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Environment Name',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'e.g. Production Cluster A',
                    suffixIcon: const Icon(
                      Icons.edit,
                      color: Color(0xFF64748B),
                      size: 20,
                    ),
                    filled: true,
                    fillColor: const Color(0xFF101622),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'This name will be used to identify resources in your dashboard.',
                  style: TextStyle(color: Color(0xFF64748B), fontSize: 13),
                ),
                const SizedBox(height: 32),
                LayoutBuilder(
                  builder: (context, constraints) {
                    final isSmall = constraints.maxWidth < 600;
                    return isSmall
                        ? Column(
                            children: [
                              _EnvTypeSelector(
                                selected: selectedEnvType,
                                onChanged: onEnvTypeChanged,
                              ),
                              const SizedBox(height: 32),
                              _RegionSelector(
                                selected: selectedRegion,
                                onChanged: onRegionChanged,
                              ),
                            ],
                          )
                        : Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: _EnvTypeSelector(
                                  selected: selectedEnvType,
                                  onChanged: onEnvTypeChanged,
                                ),
                              ),
                              const SizedBox(width: 32),
                              Expanded(
                                child: _RegionSelector(
                                  selected: selectedRegion,
                                  onChanged: onRegionChanged,
                                ),
                              ),
                            ],
                          );
                  },
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
            decoration: const BoxDecoration(
              color: Color(0xFF131B29),
              border: Border(top: BorderSide(color: Color(0xFF334155))),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_back, size: 18),
                  label: const Text('Import existing environment instead'),
                  style: TextButton.styleFrom(
                    foregroundColor: Color(0xFF92A4C9),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.go(AppRoutes.registerService);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primary,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Row(
                    children: const [
                      Text(
                        'Create Environment',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward, size: 18),
                    ],
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

class _EnvTypeSelector extends StatelessWidget {
  final String selected;
  final Function(String) onChanged;

  const _EnvTypeSelector({required this.selected, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Environment Type',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: const Color(0xFF101622),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFF334155)),
          ),
          child: Row(
            children: [
              _SegmentBtn(
                label: 'Development',
                active: selected == 'Development',
                onTap: () => onChanged('Development'),
              ),
              _SegmentBtn(
                label: 'Staging',
                active: selected == 'Staging',
                onTap: () => onChanged('Staging'),
              ),
              _SegmentBtn(
                label: 'Production',
                active: selected == 'Production',
                onTap: () => onChanged('Production'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SegmentBtn extends StatelessWidget {
  final String label;
  final bool active;
  final VoidCallback onTap;

  const _SegmentBtn({
    required this.label,
    required this.active,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: active ? const Color(0xFF324467) : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: active
                ? Border.all(color: Colors.white.withOpacity(0.1))
                : null,
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: active ? Colors.white : const Color(0xFF92A4C9),
              fontSize: 12,
              fontWeight: active ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}

class _RegionSelector extends StatelessWidget {
  final String selected;
  final Function(String?) onChanged;

  const _RegionSelector({required this.selected, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Region',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: const Color(0xFF101622),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFF324467)),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selected,
              isExpanded: true,
              dropdownColor: const Color(0xFF192233),
              icon: const Icon(Icons.expand_more, color: Color(0xFF64748B)),
              items: const [
                DropdownMenuItem(
                  value: 'us-east-1',
                  child: _RegionItem(label: 'US East (N. Virginia)'),
                ),
                DropdownMenuItem(
                  value: 'us-west-1',
                  child: _RegionItem(label: 'US West (Oregon)'),
                ),
                DropdownMenuItem(
                  value: 'eu-central-1',
                  child: _RegionItem(label: 'EU (Frankfurt)'),
                ),
                DropdownMenuItem(
                  value: 'ap-southeast-1',
                  child: _RegionItem(label: 'Asia Pacific (Singapore)'),
                ),
              ],
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}

class _RegionItem extends StatelessWidget {
  final String label;
  const _RegionItem({required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.public, color: Color(0xFF92A4C9), size: 18),
        const SizedBox(width: 12),
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 14)),
      ],
    );
  }
}

class _LegalFooter extends StatelessWidget {
  const _LegalFooter();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: const TextStyle(color: Color(0xFF64748B), fontSize: 11),
            children: [
              const TextSpan(
                text: 'By creating an environment, you agree to our ',
              ),
              TextSpan(
                text: 'Terms of Service',
                style: const TextStyle(decoration: TextDecoration.underline),
                onEnter: (_) {},
              ),
              const TextSpan(text: ' and '),
              TextSpan(
                text: 'Privacy Policy',
                style: const TextStyle(decoration: TextDecoration.underline),
                onEnter: (_) {},
              ),
              const TextSpan(text: '.'),
            ],
          ),
        ),
      ),
    );
  }
}
