import 'package:flutter/material.dart';

/// Centralized animation configuration for the Sentinel platform.
/// Ensures consistent "Fluid-Utility" motion across the application.
class SentinelMotion {
  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // DURATIONS
  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  
  /// Instant feedback (button presses, micro-interactions).
  static const Duration fast = Duration(milliseconds: 150);
  
  /// Standard component entrance or slide.
  static const Duration medium = Duration(milliseconds: 300);
  
  /// Significant layout transitions (sidebar collapse, screen changes).
  static const Duration slow = Duration(milliseconds: 500);
  
  /// Background loops or long-form notifications.
  static const Duration pulse = Duration(milliseconds: 2000);

  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // CURVES
  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  
  /// Snappy and professional for most UI elements.
  static const Curve curveFast = Curves.easeOutCubic;
  
  /// Fluid and high-end for layout transitions.
  static const Curve curveLayout = Curves.easeOutExpo;
  
  /// For rhythmic pulses (health indicators).
  static const Curve curvePulse = Curves.easeInOutSine;

  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // HELPERS
  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  
  /// Standard fade-in entrance for cards and list items.
  static Widget fadeIn(Widget child, {Duration delay = Duration.zero}) {
    return _AnimatedEntrance(
      delay: delay,
      duration: medium,
      curve: curveFast,
      child: child,
    );
  }
}

class _AnimatedEntrance extends StatefulWidget {
  final Widget child;
  final Duration delay;
  final Duration duration;
  final Curve curve;

  const _AnimatedEntrance({
    required this.child,
    required this.delay,
    required this.duration,
    required this.curve,
  });

  @override
  State<_AnimatedEntrance> createState() => _AnimatedEntranceState();
}

class _AnimatedEntranceState extends State<_AnimatedEntrance> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _opacity = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: _controller, curve: widget.curve));
    _slide = Tween<Offset>(begin: const Offset(0, 0.05), end: Offset.zero).animate(CurvedAnimation(parent: _controller, curve: widget.curve));

    Future.delayed(widget.delay, () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacity,
      child: SlideTransition(
        position: _slide,
        child: widget.child,
      ),
    );
  }
}
