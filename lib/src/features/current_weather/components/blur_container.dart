import 'dart:ui';
import 'package:flutter/material.dart';

/// A container that applies a background blur effect ([BackdropFilter])
/// to its area, ideal for translucent overlay elements (Glassmorphism).
class BlurContainer extends StatelessWidget {
  /// Creates a container with rounded corners that blurs the content behind it.
  const BlurContainer({
    required this.child,
    super.key,
    this.borderRadius = 20.0,
  });

  /// The content to be placed inside the blurred area.
  final Widget child;

  /// The radius for the container's rounded corners. Defaults to 20.0.
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            border: Border.all(
              color: Colors.white.withOpacity(0.4),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
