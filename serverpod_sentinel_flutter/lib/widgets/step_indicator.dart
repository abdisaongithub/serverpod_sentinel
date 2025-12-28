import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../theme/app_theme.dart';

class OnboardingStepper extends StatelessWidget {
  final int currentStep;
  final List<String> steps;

  const OnboardingStepper({
    super.key,
    required this.currentStep,
    required this.steps,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(steps.length, (index) {
          final isCompleted = index < currentStep;
          final isActive = index == currentStep;
          final isLast = index == steps.length - 1;

          return Expanded(
            child: Row(
              children: [
                // Step Circle/Icon
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isCompleted
                        ? AppTheme.success
                        : (isActive ? AppTheme.primary : Colors.transparent),
                    border: Border.all(
                      color: isCompleted
                          ? AppTheme.success
                          : (isActive
                                ? AppTheme.primary
                                : AppTheme.surfaceHighlight),
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: isCompleted
                        ? const Icon(
                            LucideIcons.check,
                            size: 16,
                            color: Colors.white,
                          )
                        : Text(
                            '${index + 1}',
                            style: TextStyle(
                              color: isActive
                                  ? Colors.white
                                  : AppTheme.textMuted,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
                const SizedBox(width: 12),
                // Step Label
                Expanded(
                  child: Text(
                    steps[index],
                    style: TextStyle(
                      color: isActive ? AppTheme.text : AppTheme.textMuted,
                      fontWeight: isActive
                          ? FontWeight.w600
                          : FontWeight.normal,
                      fontSize: 14,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                // Connector Line
                if (!isLast)
                  Container(
                    height: 2,
                    width: 24,
                    color: isCompleted
                        ? AppTheme.success
                        : AppTheme.surfaceHighlight,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                  ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
