import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:food_user_app/core/theme/app_radius.dart';

class LiquidGlassButton extends StatelessWidget {
  const LiquidGlassButton({
    required this.child,
    required this.onTap,
    super.key,
    this.size = 32,
    this.borderRadius = const BorderRadius.all(AppRadius.sm),
    this.blurSigma = 18,
    this.semanticLabel,
  });

  final Widget child;
  final VoidCallback onTap;
  final double size;
  final BorderRadius borderRadius;
  final double blurSigma;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final button = ClipRRect(
      borderRadius: borderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white.withValues(alpha: 0.36),
                Colors.white.withValues(alpha: 0.14),
              ],
            ),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.34),
              width: 0.8,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.12),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
              BoxShadow(
                color: Colors.white.withValues(alpha: 0.14),
                blurRadius: 1,
                offset: const Offset(-1, -1),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              borderRadius: borderRadius,
              child: SizedBox(
                width: size,
                height: size,
                child: Center(child: child),
              ),
            ),
          ),
        ),
      ),
    );

    if (semanticLabel == null) return button;

    return Semantics(label: semanticLabel, button: true, child: button);
  }
}
