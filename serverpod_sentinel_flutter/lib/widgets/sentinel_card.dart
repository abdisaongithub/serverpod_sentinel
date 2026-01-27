import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// A premium, enterprise-grade card for the Sentinel platform.
class SentinelCard extends StatelessWidget {
  final Widget child;
  final Widget? header;
  final Widget? footer;
  final EdgeInsets padding;
  final Color? color;
  final List<BoxShadow>? shadows;

  const SentinelCard({
    super.key,
    required this.child,
    this.header,
    this.footer,
    this.padding = const EdgeInsets.all(24),
    this.color,
    this.shadows,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color ?? AppTheme.darkSurface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.darkBorder, width: 1),
        boxShadow: shadows ?? AppTheme.shadowLow,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (header != null) ...[
            header!,
            Divider(color: AppTheme.darkBorder, height: 1),
          ],
          Padding(
            padding: padding,
            child: child,
          ),
          if (footer != null) ...[
            Divider(color: AppTheme.darkBorder, height: 1),
            footer!,
          ],
        ],
      ),
    );
  }
}
