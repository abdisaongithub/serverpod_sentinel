import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../theme/app_theme.dart';
import '../../routes.dart';
import '../../widgets/app_sidebar.dart';

class ConfigureRuleScreen extends StatefulWidget {
  const ConfigureRuleScreen({super.key});

  @override
  State<ConfigureRuleScreen> createState() => _ConfigureRuleScreenState();
}

class _ConfigureRuleScreenState extends State<ConfigureRuleScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= AppTheme.tabletBreakpoint;

        return Scaffold(
          backgroundColor: const Color(0xFF0F111A),
          drawer: !isDesktop
              ? const Drawer(
                  child: AppSidebar(activeRoute: AppRoutes.configureRule),
                )
              : null,
          body: Column(
            children: [
              const _Header(),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: isDesktop ? 40 : 16,
                    vertical: 32,
                  ),
                  child: Center(
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 1100),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const _RuleGeneralInfo(),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 32),
                            child: Divider(color: Color(0xFF2E3646)),
                          ),
                          const _ConditionsSection(),
                          const SizedBox(height: 32),
                          const _ActionsSection(),
                          const SizedBox(height: 64),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    final isDesktop =
        MediaQuery.of(context).size.width >= AppTheme.tabletBreakpoint;

    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: const BoxDecoration(
        color: Color(0xFF161B24),
        border: Border(bottom: BorderSide(color: Color(0xFF2E3646))),
      ),
      child: Row(
        children: [
          if (!isDesktop)
            IconButton(
              icon: const Icon(LucideIcons.menu, color: Color(0xFF94A3B8)),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          Row(
            children: [
              const Text(
                'Rules',
                style: TextStyle(color: Color(0xFF94A3B8), fontSize: 13),
              ),
              const Icon(
                LucideIcons.chevronRight,
                size: 14,
                color: Color(0xFF94A3B8),
              ),
              const Text(
                'Configure Rule',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const Spacer(),
          TextButton(
            onPressed: () => context.pop(),
            child: const Text(
              'Cancel',
              style: TextStyle(
                color: Color(0xFF94A3B8),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(width: 12),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(LucideIcons.save, size: 16),
            label: const Text('Save Rule'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.primary,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 0,
            ),
          ),
        ],
      ),
    );
  }
}

class _RuleGeneralInfo extends StatelessWidget {
  const _RuleGeneralInfo();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Rule Name
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'RULE NAME',
                    style: TextStyle(
                      color: Color(0xFF94A3B8),
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF1A1E29),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFF2E3646)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 4,
                    ),
                    child: TextField(
                      controller: TextEditingController(
                        text: 'Prod CPU Spike Detection',
                      ),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'e.g. High Latency Alert',
                        hintStyle: TextStyle(color: Color(0xFF4B5563)),
                        suffixIcon: Icon(
                          LucideIcons.edit2,
                          size: 16,
                          color: Color(0xFF94A3B8),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Descriptive name for the incident detection rule.',
                    style: TextStyle(color: Color(0xFF94A3B8), fontSize: 12),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 24),
            // Scope
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'SCOPE',
                    style: TextStyle(
                      color: Color(0xFF94A3B8),
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    constraints: const BoxConstraints(minHeight: 56),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1A1E29),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFF2E3646)),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        _tagButton(
                          label: 'Production-US-East',
                          icon: LucideIcons.hardDrive,
                          onDelete: () {},
                        ),
                        _addTagButton(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Tags or environments this rule applies to.',
                    style: TextStyle(color: Color(0xFF94A3B8), fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _tagButton({
    required String label,
    required IconData icon,
    required VoidCallback onDelete,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: AppTheme.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppTheme.primary.withOpacity(0.2)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: AppTheme.primary),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(
              color: AppTheme.primary,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 4),
          GestureDetector(
            onTap: onDelete,
            child: Icon(
              LucideIcons.x,
              size: 14,
              color: AppTheme.primary.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }

  Widget _addTagButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xFF475569),
          style: BorderStyle.solid,
        ),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(LucideIcons.plus, size: 14, color: Color(0xFF94A3B8)),
          SizedBox(width: 4),
          Text(
            'Add Tag',
            style: TextStyle(
              color: Color(0xFF94A3B8),
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _ConditionsSection extends StatefulWidget {
  const _ConditionsSection({super.key});

  @override
  State<_ConditionsSection> createState() => _ConditionsSectionState();
}

class _ConditionsSectionState extends State<_ConditionsSection> {
  double _duration = 5;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Text(
                  'Conditions',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 12),
                _allMatchBadge(),
              ],
            ),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(LucideIcons.code, size: 14),
              label: const Text('Switch to Advanced Mode'),
              style: TextButton.styleFrom(
                foregroundColor: AppTheme.primary,
                textStyle: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: const Color(0xFF1A1E29),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFF2E3646)),
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: _conditionCard(
                      metric: 'CPU Utilization',
                      icon: LucideIcons.mousePointer2,
                      iconColor: Colors.blue,
                      operator: '>',
                      value: '85',
                      unit: '%',
                    ),
                  ),
                  _andConnector(),
                  Expanded(
                    child: _conditionCard(
                      metric: 'Memory Free',
                      icon: LucideIcons.hardDrive,
                      iconColor: Colors.purple,
                      operator: '<',
                      value: '200',
                      unit: 'MB',
                    ),
                  ),
                  const SizedBox(width: 16),
                  _addConditionButton(),
                ],
              ),
              const SizedBox(height: 32),
              const Divider(color: Color(0xFF2E3646)),
              const SizedBox(height: 24),
              _durationSlider(),
            ],
          ),
        ),
      ],
    );
  }

  static Widget _allMatchBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: AppTheme.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: AppTheme.primary.withOpacity(0.2)),
      ),
      child: const Text(
        'ALL CONDITIONS MATCH',
        style: TextStyle(
          color: AppTheme.primary,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _conditionCard({
    required String metric,
    required IconData icon,
    required Color iconColor,
    required String operator,
    required String value,
    required String unit,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF0F111A).withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF2E3646)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, size: 16, color: iconColor),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Metric',
                    style: TextStyle(
                      color: Color(0xFF94A3B8),
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    metric,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              const Icon(
                LucideIcons.moreHorizontal,
                size: 16,
                color: Color(0xFF94A3B8),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              // Operator Dropdown
              Expanded(
                child: Container(
                  height: 36,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1A1E29),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xFF2E3646)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        operator,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Icon(
                        LucideIcons.chevronsUpDown,
                        size: 14,
                        color: Color(0xFF94A3B8),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 8),
              // Value Input
              Expanded(
                flex: 2,
                child: Container(
                  height: 36,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1A1E29),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xFF2E3646)),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          value,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        unit,
                        style: const TextStyle(
                          color: Color(0xFF94A3B8),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _andConnector() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: const Color(0xFF232936),
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: const Color(0xFF2E3646)),
        ),
        child: const Text(
          'AND',
          style: TextStyle(
            color: Color(0xFF94A3B8),
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _addConditionButton() {
    return Container(
      width: 56,
      height: 96,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFF2E3646),
          style: BorderStyle.solid,
        ),
      ),
      child: const Center(
        child: Icon(LucideIcons.plus, color: Color(0xFF94A3B8)),
      ),
    );
  }

  Widget _durationSlider() {
    return Row(
      children: [
        const Icon(LucideIcons.clock, size: 20, color: Color(0xFF94A3B8)),
        const SizedBox(width: 12),
        const Text(
          'Sustained for:',
          style: TextStyle(
            color: Color(0xFF94A3B8),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 24),
        Expanded(
          child: Container(
            height: 48,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: const Color(0xFF0F111A).withOpacity(0.3),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Expanded(
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: AppTheme.primary,
                      inactiveTrackColor: const Color(0xFF2E3646),
                      thumbColor: AppTheme.primary,
                      overlayColor: AppTheme.primary.withOpacity(0.1),
                      trackHeight: 4,
                      thumbShape: const RoundSliderThumbShape(
                        enabledThumbRadius: 8,
                      ),
                    ),
                    child: Slider(
                      value: _duration,
                      min: 1,
                      max: 60,
                      divisions: 59,
                      onChanged: (val) => setState(() => _duration = val),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1A1E29),
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: const Color(0xFF2E3646)),
                  ),
                  child: Text(
                    '${_duration.toInt()} min',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _ActionsSection extends StatelessWidget {
  const _ActionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Actions',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 24),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Severity
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: const Color(0xFF1A1E29),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFF2E3646)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.orange.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            LucideIcons.alertTriangle,
                            size: 18,
                            color: Colors.orange,
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          'Trigger Severity',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Set the severity level for the incident when conditions are met.',
                      style: TextStyle(color: Color(0xFF94A3B8), fontSize: 13),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(
                          child: _severityCard('Critical', Colors.red, false),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _severityCard('Warning', Colors.orange, true),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _severityCard('Info', Colors.blue, false),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 24),
            // Notifications
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: const Color(0xFF1A1E29),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFF2E3646)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            LucideIcons.bell,
                            size: 18,
                            color: Colors.green,
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          'Notify',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Manage Integrations',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Select teams or channels to be notified.',
                      style: TextStyle(color: Color(0xFF94A3B8), fontSize: 13),
                    ),
                    const SizedBox(height: 24),
                    _recipientTile(
                      name: 'SRE Team',
                      subtitle: 'Email & PagerDuty',
                      initial: 'S',
                      initialBg: AppTheme.primary.withOpacity(0.2),
                      initialText: AppTheme.primary,
                    ),
                    const SizedBox(height: 12),
                    _recipientTile(
                      name: '#alerts-prod',
                      subtitle: 'Slack Channel',
                      initial: '#',
                      initialBg: const Color(0xFF2E3646),
                      initialText: const Color(0xFF94A3B8),
                    ),
                    const SizedBox(height: 12),
                    _addRecipientButton(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _severityCard(String label, Color color, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: isSelected
            ? color.withOpacity(0.1)
            : const Color(0xFF0F111A).withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSelected ? color.withOpacity(0.5) : const Color(0xFF2E3646),
          width: isSelected ? 2 : 1,
        ),
      ),
      child: Column(
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? color : const Color(0xFF94A3B8),
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  Widget _recipientTile({
    required String name,
    required String subtitle,
    required String initial,
    required Color initialBg,
    required Color initialText,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF0F111A).withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF2E3646)),
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(color: initialBg, shape: BoxShape.circle),
            child: Center(
              child: Text(
                initial,
                style: TextStyle(
                  color: initialText,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Color(0xFF94A3B8),
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            LucideIcons.minusCircle,
            size: 16,
            color: Color(0xFF4B5563),
          ),
        ],
      ),
    );
  }

  Widget _addRecipientButton() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFF2E3646),
          style: BorderStyle.solid,
        ),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(LucideIcons.plus, size: 16, color: Color(0xFF94A3B8)),
          SizedBox(width: 8),
          Text(
            'Add Recipient',
            style: TextStyle(
              color: Color(0xFF94A3B8),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
