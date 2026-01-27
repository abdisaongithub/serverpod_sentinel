import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../theme/app_theme.dart';

/// Standard shimmer effect for loading states.
class SentinelShimmer extends StatelessWidget {
  final Widget child;
  const SentinelShimmer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppTheme.darkSurfaceVariant,
      highlightColor: AppTheme.darkSurfaceHighlight,
      child: child,
    );
  }

  /// A basic rectangular shimmer box.
  static Widget box({double? width, double? height, double borderRadius = 8}) {
    return SentinelShimmer(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }

  /// Mimics a list tile structure.
  static Widget listTile() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          box(width: 48, height: 48, borderRadius: 12),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                box(width: 120, height: 16),
                const SizedBox(height: 8),
                box(width: 200, height: 12),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
