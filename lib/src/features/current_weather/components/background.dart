import 'package:flutter/material.dart';

/// A simple container that fills its area with a vertical linear gradient.
///
/// This widget is useful for applying a consistent gradient background
/// across different screens or sections of the application.
class Background extends StatelessWidget {
  /// Creates a background with a linear gradient spanning from [firstColor]
  /// at the top to [secondColor] at the bottom.
  const Background({
    required this.firstColor,
    required this.secondColor,
    required this.child,
    super.key,
  });

  /// The starting color of the gradient (top).
  final Color firstColor;

  /// The ending color of the gradient (bottom).
  final Color secondColor;

  /// The widget to be displayed on top of the gradient background.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            firstColor,
            secondColor,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: child,
    );
  }
}
