import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../theme/app_theme.dart';
import '../../routes.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isDesktop = constraints.maxWidth >= AppTheme.tabletBreakpoint;

          return Stack(
            children: [
              Row(
                children: [
                  if (isDesktop) const _Sidebar(),
                  const Expanded(child: _MainContent()),
                ],
              ),
              if (!isDesktop) const _MobileHeader(),
            ],
          );
        },
      ),
    );
  }
}

class _Sidebar extends StatelessWidget {
  const _Sidebar();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      decoration: const BoxDecoration(
        color: Color(0xFF0F151F), // sidebar-dark
        border: Border(right: BorderSide(color: Color(0xFF1E293B))),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppTheme.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppTheme.primary.withOpacity(0.1),
                    ),
                  ),
                  child: const Icon(
                    Icons.token,
                    color: AppTheme.primary,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 12),
                const Text(
                  'OpsPilot',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ONBOARDING CHECKLIST',
                  style: TextStyle(
                    color: AppTheme.textDim,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppTheme.primary,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              children: [
                _SidebarStep(
                  number: '1',
                  title: 'Create Environment',
                  subtitle: 'Set up workspace boundaries',
                  isActive: true,
                ),
                _SidebarStep(
                  number: '2',
                  title: 'Register Service',
                  subtitle: 'Connect first repository',
                ),
                _SidebarStep(
                  number: '3',
                  title: 'Install Agent',
                  subtitle: 'Deploy the listener',
                ),
                _SidebarStep(
                  number: '4',
                  title: 'Define First Rule',
                  subtitle: 'Automate response',
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: Color(0xFF1E293B))),
            ),
            child: Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [Color(0xFF60A5FA), Color(0xFF6366F1)],
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'JD',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'John Doe',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'DevOps Engineer',
                      style: TextStyle(color: AppTheme.textDim, fontSize: 11),
                    ),
                  ],
                ),
                const Spacer(),
                const Icon(
                  Icons.expand_more,
                  color: AppTheme.textDim,
                  size: 18,
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
  final String number;
  final String title;
  final String subtitle;
  final bool isActive;

  const _SidebarStep({
    required this.number,
    required this.title,
    required this.subtitle,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32.0),
      child: Opacity(
        opacity: isActive ? 1.0 : 0.6,
        child: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isActive ? AppTheme.primary : Colors.transparent,
                border: isActive
                    ? null
                    : Border.all(color: const Color(0xFF334155)),
                boxShadow: isActive
                    ? [
                        BoxShadow(
                          color: AppTheme.primary.withOpacity(0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ]
                    : null,
              ),
              child: Center(
                child: Text(
                  number,
                  style: TextStyle(
                    color: isActive ? Colors.white : AppTheme.textDim,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(color: AppTheme.textMuted, fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MobileHeader extends StatelessWidget {
  const _MobileHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: AppTheme.background.withOpacity(0.8),
        border: const Border(bottom: BorderSide(color: Color(0xFF1E293B))),
      ),
      child: Row(
        children: [
          const Icon(Icons.token, color: AppTheme.primary, size: 24),
          const SizedBox(width: 8),
          const Text(
            'OpsPilot',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          const Icon(Icons.menu, color: AppTheme.textMuted),
        ],
      ),
    );
  }
}

class _MainContent extends StatelessWidget {
  const _MainContent();

  @override
  Widget build(BuildContext context) {
    final isDesktop =
        MediaQuery.of(context).size.width >= AppTheme.tabletBreakpoint;

    return Stack(
      children: [
        Positioned(
          top: -100,
          right: -100,
          child: Container(
            width: 800,
            height: 600,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppTheme.primary.withOpacity(0.05),
            ),
          ),
        ),

        Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              top: isDesktop ? 48 : 100,
              bottom: 48,
              left: 24,
              right: 24,
            ),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Column(
                children: [
                  if (isDesktop)
                    Row(
                      children: [
                        const Expanded(flex: 5, child: _HeroSection()),
                        const SizedBox(width: 48),
                        const Expanded(flex: 4, child: _DashboardMockup()),
                      ],
                    )
                  else
                    Column(
                      children: const [
                        _HeroSection(),
                        SizedBox(height: 64),
                        _MobileSteps(),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _HeroSection extends StatelessWidget {
  const _HeroSection();

  @override
  Widget build(BuildContext context) {
    final isDesktop =
        MediaQuery.of(context).size.width >= AppTheme.tabletBreakpoint;

    return Column(
      crossAxisAlignment: isDesktop
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: const Color(0xFF1E3A8A).withOpacity(0.2),
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: const Color(0xFF1E3A8A).withOpacity(0.5)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                'QUICK START GUIDE',
                style: TextStyle(
                  color: AppTheme.primary,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        RichText(
          textAlign: isDesktop ? TextAlign.left : TextAlign.center,
          text: TextSpan(
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              height: 1.1,
            ),
            children: [
              const TextSpan(text: 'Welcome to your new\n'),
              WidgetSpan(
                child: ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [
                      AppTheme.primary,
                      Color(0xFF6366F1),
                      Color(0xFFA855F7),
                    ],
                  ).createShader(bounds),
                  child: Text(
                    'Command Center',
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          'You\'re just a few steps away from full visibility. Streamline your infrastructure, automate workflows, and deploy with confidence using our guided setup.',
          textAlign: TextAlign.center,
          style: TextStyle(color: Color(0xFFCBD5E1), fontSize: 18, height: 1.6),
        ),
        const SizedBox(height: 40),
        Row(
          mainAxisAlignment: isDesktop
              ? MainAxisAlignment.start
              : MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                context.go(AppRoutes.createEnv);
              },
              child: Row(
                children: const [
                  Text('Initialize Setup'),
                  SizedBox(width: 8),
                  Icon(Icons.arrow_forward, size: 20),
                ],
              ),
            ),
            const SizedBox(width: 16),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFF334155)),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 18,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Skip Tour',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        if (isDesktop) ...[
          const SizedBox(height: 64),
          Row(
            children: [
              _HeroStat(value: '4', label: 'steps', subLabel: 'To automation'),
              const SizedBox(width: 32),
              Container(width: 1, height: 40, color: const Color(0xFF1E293B)),
              const SizedBox(width: 32),
              _HeroStat(value: '2', label: 'mins', subLabel: 'Estimated time'),
            ],
          ),
        ],
      ],
    );
  }
}

class _HeroStat extends StatelessWidget {
  final String value;
  final String label;
  final String subLabel;

  const _HeroStat({
    required this.value,
    required this.label,
    required this.subLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 4),
            Text(
              label,
              style: const TextStyle(color: AppTheme.textDim, fontSize: 13),
            ),
          ],
        ),
        Text(
          subLabel,
          style: const TextStyle(color: Color(0xFF64748B), fontSize: 11),
        ),
      ],
    );
  }
}

class _DashboardMockup extends StatelessWidget {
  const _DashboardMockup();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFF1E293B)),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primary.withOpacity(0.1),
            blurRadius: 100,
            spreadRadius: 20,
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: AspectRatio(
        aspectRatio: 16 / 10,
        child: Container(
          color: const Color(0xFF0F172A),
          child: Stack(
            children: [
              Positioned.fill(
                child: Opacity(
                  opacity: 0.2,
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://lh3.googleusercontent.com/aida-public/AB6AXuD8p4abpC6zidepk_cDEBsqsow4zj65Pp7lvRoNvFsTKdRPzU7zOExQ2s7bk0leo_6NGHWSefUbwAgFxUtNoC3A33sXvDpRupng5OjHkR6HyGYL7iTCspGBz9gUKkhOkdIlcPZJJJdcJk1rxdW_sQuSFplJchxlCSSeUCM8oE6r3yxcrURmxiHXUSGV1asQ2NZw0jnx24FcWlu5Ui9Dh94HSerlYGcwdWHxp8tpvoYd-UtN5Z0S3-n8ayUYB2lM_HwoyFlxgD3U5k0',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 32,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Color(0xFF1E293B)),
                    ),
                  ),
                  child: Row(
                    children: [
                      _Dot(color: Colors.red.withOpacity(0.5)),
                      const SizedBox(width: 8),
                      _Dot(color: Colors.yellow.withOpacity(0.5)),
                      const SizedBox(width: 8),
                      _Dot(color: Colors.green.withOpacity(0.5)),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.05),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Container(
                          width: 100,
                          height: 60,
                          decoration: BoxDecoration(
                            color: AppTheme.primary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: AppTheme.primary.withOpacity(0.2),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 24,
                right: 24,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E293B),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xFF334155)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.check_circle, color: Colors.green, size: 16),
                      SizedBox(width: 8),
                      Text(
                        'System Online',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final Color color;
  const _Dot({required this.color});
  @override
  Widget build(BuildContext context) => Container(
    width: 10,
    height: 10,
    decoration: BoxDecoration(color: color, shape: BoxShape.circle),
  );
}

class _MobileSteps extends StatelessWidget {
  const _MobileSteps();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'YOUR SETUP PATH',
          style: TextStyle(
            color: AppTheme.textDim,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        _MobileStepItem(
          number: '1',
          title: 'Create Environment',
          isActive: true,
        ),
        const SizedBox(height: 12),
        const _MobileStepItem(number: '2', title: 'Register Service'),
        const SizedBox(height: 12),
        const _MobileStepItem(number: '3', title: 'Install Agent'),
        const SizedBox(height: 12),
        const _MobileStepItem(number: '4', title: 'Define First Rule'),
      ],
    );
  }
}

class _MobileStepItem extends StatelessWidget {
  final String number;
  final String title;
  final bool isActive;

  const _MobileStepItem({
    required this.number,
    required this.title,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isActive ? 1.0 : 0.4,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isActive ? Colors.white.withOpacity(0.05) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isActive ? const Color(0xFF1E293B) : Colors.transparent,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isActive ? AppTheme.primary : Colors.transparent,
                border: isActive ? null : Border.all(color: AppTheme.textDim),
              ),
              child: Center(
                child: Text(
                  number,
                  style: TextStyle(
                    color: isActive ? Colors.white : AppTheme.textDim,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
