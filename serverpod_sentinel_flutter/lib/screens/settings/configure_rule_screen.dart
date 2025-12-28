import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_text_field.dart';

class ConfigureRuleScreen extends StatefulWidget {
  const ConfigureRuleScreen({super.key});

  @override
  State<ConfigureRuleScreen> createState() => _ConfigureRuleScreenState();
}

class _ConfigureRuleScreenState extends State<ConfigureRuleScreen> {
  double _duration = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Configure Rule',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(LucideIcons.arrowLeft),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Save',
              style: TextStyle(
                color: AppTheme.primary,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'RULE NAME',
              style: TextStyle(
                color: AppTheme.textMuted,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const CustomTextField(
              hint: 'e.g. Prod CPU Spike Detection',
              label: 'Prod CPU Spike Detection',
              // label: '===== not set =====',
            ),
            const SizedBox(height: 24),

            const Text(
              'Scope',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: AppTheme.surface,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppTheme.surfaceHighlight),
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          LucideIcons.layoutGrid,
                          size: 16,
                          color: AppTheme.primary,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Production-US-East',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Icon(
                          LucideIcons.chevronDown,
                          size: 16,
                          color: AppTheme.textMuted,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.surface,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppTheme.surfaceHighlight),
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        LucideIcons.plus,
                        size: 16,
                        color: AppTheme.textMuted,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Add Tag',
                        style: TextStyle(color: AppTheme.textMuted),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Conditions',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    'ALL MATCH',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                      color: AppTheme.primary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Condition 1
            _buildConditionCard(
              index: 0,
              metric: 'CPU Utilization',
              operator: '>',
              threshold: '85',
              unit: '%',
              icon: LucideIcons.cpu,
            ),

            // Connector
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  border: Border.all(color: AppTheme.textMuted),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  'AND',
                  style: TextStyle(
                    fontSize: 10,
                    color: AppTheme.textMuted,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // Condition 2
            _buildConditionCard(
              index: 1,
              metric: 'Memory Free',
              operator: '<',
              threshold: '200',
              unit: 'MB',
              icon: LucideIcons.hardDrive,
              color: Colors.purple,
            ),

            const SizedBox(height: 16),

            // Duration Slider
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppTheme.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppTheme.surfaceHighlight),
              ),
              child: Row(
                children: [
                  const Icon(LucideIcons.clock, color: AppTheme.textMuted),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Sustained for',
                          style: TextStyle(
                            color: AppTheme.textMuted,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          '${_duration.toInt()} minutes',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: AppTheme.primary,
                        inactiveTrackColor: AppTheme.surfaceHighlight,
                        thumbColor: AppTheme.primary,
                        overlayColor: AppTheme.primary.withOpacity(0.2),
                      ),
                      child: Slider(
                        value: _duration,
                        min: 1,
                        max: 60,
                        onChanged: (v) => setState(() => _duration = v),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),
            Center(
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(LucideIcons.plusCircle),
                label: const Text('Add Condition'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppTheme.textMuted,
                  side: const BorderSide(
                    // style: BorderStyle.dashed, : TODO: find a way to make this work
                    style: BorderStyle.solid,
                    color: AppTheme.textMuted,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 32),
            const Text(
              'Action',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppTheme.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppTheme.surfaceHighlight),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'THEN TRIGGER SEVERITY',
                    style: TextStyle(
                      color: AppTheme.textMuted,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      _buildSeverityBtn('Critical', false),
                      const SizedBox(width: 8),
                      _buildSeverityBtn('Warning', true, color: Colors.orange),
                      const SizedBox(width: 8),
                      _buildSeverityBtn('Info', false),
                    ],
                  ),
                  const SizedBox(height: 24),

                  const Text(
                    'AND NOTIFY',
                    style: TextStyle(
                      color: AppTheme.textMuted,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Chip(
                        label: const Text(
                          'SRE Team',
                          style: TextStyle(color: AppTheme.primary),
                        ),
                        avatar: const CircleAvatar(
                          backgroundColor: AppTheme.primary,
                          child: Text(
                            '\$',
                            style: TextStyle(fontSize: 10, color: Colors.white),
                          ),
                        ),
                        backgroundColor: AppTheme.primary.withOpacity(0.1),
                        deleteIcon: const Icon(
                          LucideIcons.x,
                          size: 14,
                          color: AppTheme.primary,
                        ),
                        onDeleted: () {},
                        side: BorderSide.none,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Chip(
                        label: const Text('Slack'),
                        avatar: const Icon(
                          LucideIcons.hash,
                          size: 14,
                          color: AppTheme.textMuted,
                        ),
                        backgroundColor: Colors.black,
                        side: BorderSide.none,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppTheme.textMuted),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          LucideIcons.plus,
                          size: 16,
                          color: AppTheme.textMuted,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildConditionCard({
    required int index,
    required String metric,
    required String operator,
    required String threshold,
    required String unit,
    required IconData icon,
    Color color = AppTheme.primary,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 24.0, right: 8),
          child: Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppTheme.surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppTheme.surfaceHighlight),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'IF',
                      style: TextStyle(
                        color: AppTheme.textMuted,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Icon(
                      LucideIcons.moreHorizontal,
                      size: 16,
                      color: AppTheme.textMuted,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppTheme.background,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: color.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Icon(icon, size: 16, color: color),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        metric,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      const Icon(
                        LucideIcons.edit2,
                        size: 14,
                        color: AppTheme.textMuted,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: AppTheme.background,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              operator,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Icon(
                              LucideIcons.chevronsUpDown,
                              size: 14,
                              color: AppTheme.textMuted,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: AppTheme.background,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              threshold,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              unit,
                              style: const TextStyle(color: AppTheme.textMuted),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSeverityBtn(String label, bool isSelected, {Color? color}) {
    Color activeColor = color ?? AppTheme.surfaceHighlight;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? activeColor.withOpacity(0.2) : Colors.black,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isSelected ? activeColor : AppTheme.surfaceHighlight,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? activeColor : AppTheme.textMuted,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
