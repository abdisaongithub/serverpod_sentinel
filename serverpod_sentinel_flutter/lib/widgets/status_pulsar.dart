import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../theme/sentinel_motion.dart';

/// An animated status indicator that glows and pulses.
class StatusPulsar extends StatefulWidget {
  final Color color;
  final double size;
  final bool isPulsing;

  const StatusPulsar({
    super.key,
    required this.color,
    this.size = 12,
    this.isPulsing = true,
  });

  @override
  State<StatusPulsar> createState() => _StatusPulsarState();
}

class _StatusPulsarState extends State<StatusPulsar> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: SentinelMotion.pulse,
    );
    if (widget.isPulsing) _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            // Outer Glow
            Container(
              width: widget.size * (1 + _controller.value * 1.5),
              height: widget.size * (1 + _controller.value * 1.5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.color.withOpacity(0.3 * (1 - _controller.value)),
              ),
            ),
            // Middle Glow
            Container(
              width: widget.size * (1 + _controller.value * 0.5),
              height: widget.size * (1 + _controller.value * 0.5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.color.withOpacity(0.5 * (1 - _controller.value)),
              ),
            ),
            // Solid Core
            Container(
              width: widget.size,
              height: widget.size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.color,
                boxShadow: [
                  BoxShadow(
                    color: widget.color.withOpacity(0.5),
                    blurRadius: 4,
                    spreadRadius: 1,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
