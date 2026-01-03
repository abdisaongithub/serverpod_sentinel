import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/services.dart';
import '../../theme/app_theme.dart';
import '../../routes.dart';

class InstallAgentScreen extends StatefulWidget {
  const InstallAgentScreen({super.key});

  @override
  State<InstallAgentScreen> createState() => _InstallAgentScreenState();
}

class _InstallAgentScreenState extends State<InstallAgentScreen> {
  String _selectedTab = 'Docker';

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
                          horizontal: isDesktop ? 32 : 24,
                          vertical: 40,
                        ),
                        child: Center(
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 1000),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Install the Agent',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  'Copy the command below and run it on your host machine to securely connect it to the DevOps platform.',
                                  style: TextStyle(
                                    color: Color(0xFF92A4C9),
                                    fontSize: 17,
                                    height: 1.5,
                                  ),
                                ),
                                const SizedBox(height: 32),
                                _CommandCard(
                                  selectedTab: _selectedTab,
                                  onTabChanged: (tab) =>
                                      setState(() => _selectedTab = tab),
                                ),
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
      width: 288,
      decoration: BoxDecoration(
        color: const Color(0xFF151A23),
        border: const Border(right: BorderSide(color: Color(0x0DFFFFFF))),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 20,
            offset: const Offset(4, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 64,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Color(0x0DFFFFFF))),
            ),
            child: Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF3B82F6), AppTheme.primary],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: AppTheme.primary.withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.dashboard,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
                const SizedBox(width: 12),
                const Text(
                  'OpsPlatform',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'ONBOARDING',
                    style: TextStyle(
                      color: Color(0xFF64748B),
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 24),
                  _SidebarStep(
                    title: 'Create Environment',
                    subtitle: 'Completed',
                    isCompleted: true,
                    showLine: true,
                    lineCompleted: true,
                  ),
                  _SidebarStep(
                    title: 'Register Service',
                    subtitle: 'Completed',
                    isCompleted: true,
                    showLine: true,
                    lineCompleted: true,
                  ),
                  _SidebarStep(
                    title: 'Install Agent',
                    subtitle: 'In Progress',
                    isActive: true,
                    stepNumber: '3',
                    showLine: true,
                  ),
                  const _SidebarStep(
                    title: 'Verify Setup',
                    subtitle: 'Pending',
                    stepNumber: '4',
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Color(0x33000000),
              border: Border(top: BorderSide(color: Color(0x0DFFFFFF))),
            ),
            child: Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: const Color(0xFF334155),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: const Icon(
                    Icons.person_outline,
                    color: Color(0xFF94A3B8),
                    size: 18,
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'DevOps Team',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'admin@platform.io',
                      style: TextStyle(color: Color(0xFF64748B), fontSize: 12),
                    ),
                  ],
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
  final String? stepNumber;
  final bool showLine;
  final bool lineCompleted;

  const _SidebarStep({
    required this.title,
    required this.subtitle,
    this.isCompleted = false,
    this.isActive = false,
    this.stepNumber,
    this.showLine = false,
    this.lineCompleted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isCompleted
                      ? Colors.green
                      : (isActive ? AppTheme.primary : const Color(0x0DFFFFFF)),
                  border: (!isCompleted && !isActive)
                      ? Border.all(color: const Color(0xFF334155), width: 2)
                      : null,
                  boxShadow: isActive
                      ? [
                          BoxShadow(
                            color: AppTheme.primary.withOpacity(0.25),
                            blurRadius: 12,
                          ),
                        ]
                      : (isCompleted
                            ? [
                                BoxShadow(
                                  color: Colors.green.withOpacity(0.2),
                                  blurRadius: 8,
                                ),
                              ]
                            : null),
                ),
                child: Center(
                  child: isCompleted
                      ? const Icon(Icons.check, color: Colors.white, size: 20)
                      : isActive
                      ? Text(
                          stepNumber ?? '',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        )
                      : Text(
                          stepNumber ?? '',
                          style: const TextStyle(
                            color: Color(0xFF64748B),
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                ),
              ),
              if (showLine)
                Container(
                  width: 2,
                  height: 32,
                  color: lineCompleted
                      ? Colors.green.withOpacity(0.5)
                      : const Color(0x0DFFFFFF),
                ),
            ],
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
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: isCompleted
                        ? Colors.green
                        : (isActive
                              ? AppTheme.primary.withOpacity(0.8)
                              : const Color(0xFF64748B)),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
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

class _Header extends StatelessWidget {
  final bool isDesktop;
  const _Header({required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 32),
      decoration: BoxDecoration(
        color: AppTheme.background.withOpacity(0.8),
        border: const Border(bottom: BorderSide(color: Colors.transparent)),
      ),
      child: Row(
        children: [
          TextButton.icon(
            onPressed: () => context.pop(),
            icon: const Icon(Icons.arrow_back, size: 20),
            label: const Text('Back to Dashboard'),
            style: TextButton.styleFrom(
              foregroundColor: const Color(0xFF94A3B8),
            ),
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(
              Icons.help_outline,
              size: 20,
              color: Color(0xFF94A3B8),
            ),
            onPressed: () {},
          ),
          Container(
            width: 1,
            height: 16,
            color: const Color(0xFF334155),
            margin: const EdgeInsets.symmetric(horizontal: 8),
          ),
          Stack(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.notifications_none,
                  size: 20,
                  color: Color(0xFF94A3B8),
                ),
                onPressed: () {},
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppTheme.background, width: 1.5),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CommandCard extends StatelessWidget {
  final String selectedTab;
  final Function(String) onTabChanged;

  const _CommandCard({required this.selectedTab, required this.onTabChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1E2229),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0x0DFFFFFF)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
            decoration: BoxDecoration(
              color: const Color(0xFF151A23).withOpacity(0.5),
              border: const Border(
                bottom: BorderSide(color: Color(0x0DFFFFFF)),
              ),
            ),
            child: Row(
              children: [
                _TabButton(
                  label: 'Docker',
                  icon: Icons.inventory_2_outlined,
                  selected: selectedTab == 'Docker',
                  onTap: () => onTabChanged('Docker'),
                ),
                const SizedBox(width: 32),
                _TabButton(
                  label: 'Kubernetes',
                  icon: Icons.grid_view,
                  selected: selectedTab == 'Kubernetes',
                  onTap: () => onTabChanged('Kubernetes'),
                ),
                const SizedBox(width: 32),
                _TabButton(
                  label: 'Linux',
                  icon: Icons.terminal,
                  selected: selectedTab == 'Linux',
                  onTap: () => onTabChanged('Linux'),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: [
                _TerminalBlock(),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.info_outline,
                          size: 18,
                          color: Color(0xFF64748B),
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Need elevated privileges? ',
                          style: TextStyle(
                            color: Color(0xFF64748B),
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          'View documentation',
                          style: TextStyle(
                            color: AppTheme.primary,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.ios_share, size: 18),
                      label: const Text('Share Instructions'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xFFCBD5E1),
                        side: const BorderSide(color: Color(0x0DFFFFFF)),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            decoration: BoxDecoration(
              color: const Color(0xFF151A23).withOpacity(0.3),
              border: const Border(top: BorderSide(color: Color(0x0DFFFFFF))),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: AppTheme.primary.withOpacity(0.2),
                    ),
                  ),
                  child: Row(
                    children: [
                      _PulsingDot(),
                      const SizedBox(width: 10),
                      const Text(
                        'Listening for agent connection...',
                        style: TextStyle(
                          color: AppTheme.primary,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Trouble connecting?',
                        style: TextStyle(
                          color: Color(0xFF94A3B8),
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: () => context.go(AppRoutes.defineRules),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.primary,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 14,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 8,
                        shadowColor: AppTheme.primary.withOpacity(0.2),
                      ),
                      child: Row(
                        children: const [
                          Text(
                            'Verify Installation',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.arrow_forward, size: 18),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TabButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  const _TabButton({
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 22,
                  color: selected ? AppTheme.primary : const Color(0xFF94A3B8),
                ),
                const SizedBox(width: 10),
                Text(
                  label,
                  style: TextStyle(
                    color: selected
                        ? AppTheme.primary
                        : const Color(0xFF94A3B8),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 3,
            width: 80,
            decoration: BoxDecoration(
              color: selected ? AppTheme.primary : Colors.transparent,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(3),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TerminalBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF0D1117),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF1E293B)),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: const BoxDecoration(
              color: Color(0xFF161B22),
              border: Border(bottom: BorderSide(color: Color(0x0DFFFFFF))),
            ),
            child: Row(
              children: [
                _Dot(color: const Color(0xFFFF5F57)),
                const SizedBox(width: 8),
                _Dot(color: const Color(0xFFFEBC2E)),
                const SizedBox(width: 8),
                _Dot(color: const Color(0xFF28C840)),
                const Spacer(),
                Row(
                  children: const [
                    Icon(
                      Icons.lock_outline,
                      size: 14,
                      color: Color(0xFF64748B),
                    ),
                    SizedBox(width: 4),
                    Text(
                      'bash — 80x24',
                      style: TextStyle(
                        color: Color(0xFF64748B),
                        fontSize: 11,
                        fontFamily: 'monospace',
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                const SizedBox(width: 48),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Text(
                      'root@server',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 12,
                        fontFamily: 'monospace',
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      '~',
                      style: TextStyle(
                        color: Color(0xFF60A5FA),
                        fontSize: 12,
                        fontFamily: 'monospace',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 14,
                      fontFamily: 'monospace',
                      height: 2,
                    ),
                    children: [
                      const TextSpan(
                        text: '\$ ',
                        style: TextStyle(color: Color(0xFF64748B)),
                      ),
                      const TextSpan(
                        text: 'curl',
                        style: TextStyle(
                          color: Color(0xFFA855F7),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const TextSpan(
                        text: ' -sL https://ops-platform.io/install.sh | ',
                        style: TextStyle(color: Color(0xFFCBD5E1)),
                      ),
                      const TextSpan(
                        text: 'sudo',
                        style: TextStyle(
                          color: Color(0xFFFACC15),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const TextSpan(
                        text: ' bash -s -- \\\n   --token=',
                        style: TextStyle(color: Color(0xFFCBD5E1)),
                      ),
                      WidgetSpan(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                              color: Colors.green.withOpacity(0.2),
                            ),
                          ),
                          child: const Text(
                            '834jdf983h21kjsd987sfd...',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 14,
                              fontFamily: 'monospace',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 24.0, bottom: 16),
              child: TextButton.icon(
                onPressed: () {
                  Clipboard.setData(
                    const ClipboardData(
                      text:
                          'curl -sL https://ops-platform.io/install.sh | sudo bash -s -- --token=834jdf983h21kjsd987sfd...',
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Copied to clipboard')),
                  );
                },
                icon: const Icon(Icons.content_copy, size: 16),
                label: const Text('Copy Command'),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.white.withOpacity(0.05),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(color: Color(0x1AFFFFFF)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final Color color;
  const _Dot({required this.color});

  @override
  Widget build(BuildContext context) => Container(
    width: 12,
    height: 12,
    decoration: BoxDecoration(color: color, shape: BoxShape.circle),
  );
}

class _PulsingDot extends StatefulWidget {
  @override
  State<_PulsingDot> createState() => _PulsingDotState();
}

class _PulsingDotState extends State<_PulsingDot>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 10,
      height: 10,
      child: Stack(
        children: [
          FadeTransition(
            opacity: Tween<double>(begin: 0.75, end: 0.0).animate(
              CurvedAnimation(parent: _controller, curve: Curves.easeOut),
            ),
            child: ScaleTransition(
              scale: Tween<double>(begin: 1.0, end: 2.5).animate(
                CurvedAnimation(parent: _controller, curve: Curves.easeOut),
              ),
              child: Container(
                decoration: const BoxDecoration(
                  color: AppTheme.primary,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: AppTheme.primary,
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }
}
