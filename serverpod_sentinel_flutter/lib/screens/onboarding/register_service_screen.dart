import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serverpod_sentinel_client/serverpod_sentinel_client.dart';
import '../../theme/app_theme.dart';
import '../../routes.dart';
import '../../providers/services_provider.dart';

class RegisterServiceScreen extends ConsumerStatefulWidget {
  const RegisterServiceScreen({super.key});

  @override
  ConsumerState<RegisterServiceScreen> createState() =>
      _RegisterServiceScreenState();
}

class _RegisterServiceScreenState extends ConsumerState<RegisterServiceScreen> {
  final _nameController = TextEditingController();
  String _selectedServiceType = 'Web Service';
  bool _envVarsExpanded = false;
  bool _isRegistering = false;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _registerService() async {
    final name = _nameController.text.trim();
    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a service name')),
      );
      return;
    }

    setState(() => _isRegistering = true);

    try {
      final service = Service(
        name: name,
        description: 'A ${_selectedServiceType.toLowerCase()} registered via onboarding.',
        tier: _mapTypeToTier(_selectedServiceType),
        status: ServiceStatus.DEGRADED, // Initial status pending agent
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        ownerId: 1, // Default owner for onboarding
        tags: [
          'type:${_selectedServiceType.toLowerCase().replaceAll(' ', '-')}',
          'env:production',
          'region:us-east-1',
        ],
      );

      final created = await ref.read(serviceMutationProvider.notifier).create(service);

      if (created != null && mounted) {
        context.go(AppRoutes.installAgent, extra: {'serviceId': created.id});
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error registering service: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isRegistering = false);
    }
  }

  ServiceTier _mapTypeToTier(String type) {
    switch (type) {
      case 'Web Service': return ServiceTier.TIER_1;
      case 'Worker': return ServiceTier.TIER_2;
      case 'Cron Job': return ServiceTier.TIER_3;
      default: return ServiceTier.TIER_2;
    }
  }

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
                    Expanded(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.symmetric(
                          horizontal: isDesktop ? 48 : 24,
                          vertical: isDesktop ? 64 : 40,
                        ),
                        child: Center(
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 1000),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _IntroSection(isDesktop: isDesktop),
                                const SizedBox(height: 32),
                                _FormCard(
                                  nameController: _nameController,
                                  selectedServiceType: _selectedServiceType,
                                  onServiceTypeChanged: (type) => setState(
                                    () => _selectedServiceType = type,
                                  ),
                                  envVarsExpanded: _envVarsExpanded,
                                  onEnvVarsToggle: () => setState(
                                    () => _envVarsExpanded = !_envVarsExpanded,
                                  ),
                                ),
                                const SizedBox(height: 48),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    _BottomBar(
                      isDesktop: isDesktop,
                      onRegister: _registerService,
                      isLoading: _isRegistering,
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
        color: Color(0xFF151B29),
        border: Border(right: BorderSide(color: Color(0xFF1E293B))),
      ),
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppTheme.primary,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: AppTheme.primary.withOpacity(0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.terminal,
                    color: Colors.white,
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
            const SizedBox(height: 40),
            const Text(
              'ONBOARDING PROGRESS',
              style: TextStyle(
                color: Color(0xFF64748B),
                fontSize: 11,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 24),
            _ProgressItem(
              title: 'Create environment',
              subtitle: 'Completed',
              isCompleted: true,
            ),
            const SizedBox(height: 24),
            _ProgressItem(
              title: 'Register service',
              subtitle: 'In progress',
              isActive: true,
            ),
            const SizedBox(height: 24),
            const _ProgressItem(
              title: 'Configure deploy',
              subtitle: 'Pending',
              stepNumber: '3',
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.only(top: 32),
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: Color(0xFF1E293B))),
              ),
              child: TextButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.help_outline,
                  size: 18,
                  color: Color(0xFF94A3B8),
                ),
                label: const Text(
                  'Documentation & Help',
                  style: TextStyle(color: Color(0xFF94A3B8), fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProgressItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isCompleted;
  final bool isActive;
  final String? stepNumber;

  const _ProgressItem({
    required this.title,
    required this.subtitle,
    this.isCompleted = false,
    this.isActive = false,
    this.stepNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isCompleted ? Colors.green : Colors.transparent,
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
                      color: Colors.green.withOpacity(0.2),
                      blurRadius: 8,
                    ),
                  ]
                : (isActive
                      ? [
                          BoxShadow(
                            color: AppTheme.primary.withOpacity(0.1),
                            blurRadius: 10,
                          ),
                        ]
                      : null),
          ),
          child: Center(
            child: isCompleted
                ? const Icon(Icons.check, color: Colors.white, size: 20)
                : isActive
                ? Container(
                    width: 14,
                    height: 14,
                    decoration: const BoxDecoration(
                      color: AppTheme.primary,
                      shape: BoxShape.circle,
                    ),
                  )
                : Text(
                    stepNumber ?? '',
                    style: const TextStyle(
                      color: Color(0xFF94A3B8),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
          ),
        ),
        const SizedBox(width: 16),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: isActive ? AppTheme.primary : Colors.white,
                  fontSize: isActive ? 16 : 14,
                  fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
                ),
              ),
              const SizedBox(height: 2),
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

class _IntroSection extends StatelessWidget {
  final bool isDesktop;
  const _IntroSection({required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Register your first service',
          style: TextStyle(
            color: Colors.white,
            fontSize: isDesktop ? 32 : 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          "Let's define what you're running. We'll automatically detect buildpacks based on your repo language and configure the best defaults for you.",
          style: TextStyle(color: Color(0xFF94A3B8), fontSize: 17, height: 1.6),
        ),
      ],
    );
  }
}

class _FormCard extends StatelessWidget {
  final TextEditingController nameController;
  final String selectedServiceType;
  final Function(String) onServiceTypeChanged;
  final bool envVarsExpanded;
  final VoidCallback onEnvVarsToggle;

  const _FormCard({
    required this.nameController,
    required this.selectedServiceType,
    required this.onServiceTypeChanged,
    required this.envVarsExpanded,
    required this.onEnvVarsToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF151B29),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF1E293B)),
      ),
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSection(
            label: 'Service Name',
            description:
                'This name will be used as the unique ID for your service within the cluster.',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: nameController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    hintText: 'e.g., my-backend-api',
                    filled: true,
                    fillColor: Color(0xFF0D121C),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: const [
                    Icon(
                      Icons.info_outline,
                      size: 14,
                      color: Color(0xFF64748B),
                    ),
                    SizedBox(width: 4),
                    Text(
                      'Must be lowercase, alphanumeric, and URL friendly.',
                      style: TextStyle(color: Color(0xFF64748B), fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(color: Color(0xFF1E293B), height: 60),
          const Text(
            'Service Type',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Select the workload type that best describes your application.',
            style: TextStyle(color: Color(0xFF94A3B8), fontSize: 14),
          ),
          const SizedBox(height: 20),
          LayoutBuilder(
            builder: (context, constraints) {
              final isSmall = constraints.maxWidth < 700;
              return isSmall
                  ? Column(
                      children: [
                        _ServiceTypeCard(
                          type: 'Web Service',
                          icon: Icons.language,
                          iconBgColor: const Color(0xFF3B82F6),
                          description:
                              'Long-running process exposed via HTTP. Ideal for APIs and frontends.',
                          selected: selectedServiceType == 'Web Service',
                          onTap: () => onServiceTypeChanged('Web Service'),
                        ),
                        const SizedBox(height: 16),
                        _ServiceTypeCard(
                          type: 'Worker',
                          icon: Icons.settings_applications,
                          iconBgColor: const Color(0xFF8B5CF6),
                          description:
                              'Background process, queue consumers, and messaging tasks.',
                          selected: selectedServiceType == 'Worker',
                          onTap: () => onServiceTypeChanged('Worker'),
                        ),
                        const SizedBox(height: 16),
                        _ServiceTypeCard(
                          type: 'Cron Job',
                          icon: Icons.schedule,
                          iconBgColor: const Color(0xFFF97316),
                          description:
                              'Scheduled tasks running at specific times or intervals.',
                          selected: selectedServiceType == 'Cron Job',
                          onTap: () => onServiceTypeChanged('Cron Job'),
                        ),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: _ServiceTypeCard(
                            type: 'Web Service',
                            icon: Icons.language,
                            iconBgColor: const Color(0xFF3B82F6),
                            description:
                                'Long-running process exposed via HTTP. Ideal for APIs and frontends.',
                            selected: selectedServiceType == 'Web Service',
                            onTap: () => onServiceTypeChanged('Web Service'),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: _ServiceTypeCard(
                            type: 'Worker',
                            icon: Icons.settings_applications,
                            iconBgColor: const Color(0xFF8B5CF6),
                            description:
                                'Background process, queue consumers, and messaging tasks.',
                            selected: selectedServiceType == 'Worker',
                            onTap: () => onServiceTypeChanged('Worker'),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: _ServiceTypeCard(
                            type: 'Cron Job',
                            icon: Icons.schedule,
                            iconBgColor: const Color(0xFFF97316),
                            description:
                                'Scheduled tasks running at specific times or intervals.',
                            selected: selectedServiceType == 'Cron Job',
                            onTap: () => onServiceTypeChanged('Cron Job'),
                          ),
                        ),
                      ],
                    );
            },
          ),
          const Divider(color: Color(0xFF1E293B), height: 60),
          _buildSection(
            label: 'Source Repository',
            description:
                'Connect the git repository containing your source code.',
            child: _GitHubConnectButton(),
          ),
          const SizedBox(height: 24),
          _EnvVarsSection(
            isExpanded: envVarsExpanded,
            onToggle: onEnvVarsToggle,
          ),
        ],
      ),
    );
  }

  Widget _buildSection({
    required String label,
    required String description,
    required Widget child,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isSmall = constraints.maxWidth < 700;
        return isSmall
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: const TextStyle(
                      color: Color(0xFF94A3B8),
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 16),
                  child,
                ],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          label,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          description,
                          style: const TextStyle(
                            color: Color(0xFF94A3B8),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 40),
                  Expanded(flex: 8, child: child),
                ],
              );
      },
    );
  }
}

class _ServiceTypeCard extends StatelessWidget {
  final String type;
  final IconData icon;
  final Color iconBgColor;
  final String description;
  final bool selected;
  final VoidCallback onTap;

  const _ServiceTypeCard({
    required this.type,
    required this.icon,
    required this.iconBgColor,
    required this.description,
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
              ? AppTheme.primary.withOpacity(0.05)
              : const Color(0xFF0D121C),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selected ? AppTheme.primary : const Color(0xFF334155),
            width: 2,
          ),
          boxShadow: selected
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 10,
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
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: iconBgColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(icon, color: iconBgColor, size: 24),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      type,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  description,
                  style: const TextStyle(
                    color: Color(0xFF94A3B8),
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
              ],
            ),
            if (selected)
              const Positioned(
                top: 0,
                right: 0,
                child: Icon(
                  Icons.check_circle,
                  color: AppTheme.primary,
                  size: 24,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _GitHubConnectButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF0D121C),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFF334155)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: const Color(0xFF334155)),
            ),
            child: const Icon(Icons.code, color: Color(0xFF94A3B8), size: 20),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Connect to GitHub...',
                style: TextStyle(
                  color: Color(0xFFCBD5E1),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'Or other git providers',
                style: TextStyle(color: Color(0xFF64748B), fontSize: 12),
              ),
            ],
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppTheme.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Row(
              children: const [
                Text(
                  'Select Repo',
                  style: TextStyle(
                    color: AppTheme.primary,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 4),
                Icon(Icons.arrow_forward, color: AppTheme.primary, size: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _EnvVarsSection extends StatelessWidget {
  final bool isExpanded;
  final VoidCallback onToggle;

  const _EnvVarsSection({required this.isExpanded, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: isExpanded ? Border.all(color: const Color(0xFF1E293B)) : null,
        color: isExpanded ? const Color(0xFF0D121C) : Colors.transparent,
      ),
      child: Column(
        children: [
          InkWell(
            onTap: onToggle,
            child: Padding(
              padding: EdgeInsets.all(isExpanded ? 16.0 : 8.0),
              child: Row(
                children: [
                  const Icon(Icons.tune, color: Color(0xFF94A3B8), size: 20),
                  const SizedBox(width: 8),
                  const Text(
                    'Environment Variables (Optional)',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    isExpanded ? Icons.expand_less : Icons.expand_more,
                    color: isExpanded
                        ? AppTheme.primary
                        : const Color(0xFF94A3B8),
                  ),
                ],
              ),
            ),
          ),
          if (isExpanded)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                          decoration: InputDecoration(
                            hintText: 'KEY',
                            filled: true,
                            fillColor: const Color(0xFF151B29),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 10,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                color: Color(0xFF334155),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextField(
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                          decoration: InputDecoration(
                            hintText: 'VALUE',
                            filled: true,
                            fillColor: const Color(0xFF151B29),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 10,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                color: Color(0xFF334155),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.add, size: 16),
                      label: const Text('Add another'),
                      style: TextButton.styleFrom(
                        foregroundColor: AppTheme.primary,
                      ),
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

class _BottomBar extends StatelessWidget {
  final bool isDesktop;
  final VoidCallback onRegister;
  final bool isLoading;

  const _BottomBar({
    required this.isDesktop,
    required this.onRegister,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF151B29),
        border: const Border(top: BorderSide(color: Color(0xFF1E293B))),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlinedButton.icon(
                onPressed: isLoading ? null : () => context.pop(),
                icon: const Icon(Icons.arrow_back, size: 20),
                label: const Text('Back'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFFCBD5E1),
                  side: const BorderSide(color: Color(0xFF334155)),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              Row(
                children: [
                  if (isDesktop)
                    const Padding(
                      padding: EdgeInsets.only(right: 16),
                      child: Text(
                        'Step 2 of 3',
                        style: TextStyle(
                          color: Color(0xFF64748B),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ElevatedButton(
                    onPressed: isLoading ? null : onRegister,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primary,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 4,
                      shadowColor: AppTheme.primary.withOpacity(0.25),
                    ),
                    child: isLoading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : Row(
                            children: const [
                              Text(
                                'Register & Continue',
                                style: TextStyle(fontWeight: FontWeight.bold),
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
