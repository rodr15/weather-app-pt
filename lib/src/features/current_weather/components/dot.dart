import 'package:flutter/material.dart';

/// A small circular indicator used to represent the current index
/// in a horizontally scrollable list (like a [PageView]).
///
/// The appearance of the dot changes based on whether it is currently [selected].
class Dot extends StatelessWidget {
  /// Creates a [Dot] instance.
  const Dot({
    required this.selected,
    super.key,
  });

  /// A boolean indicating whether this dot represents the currently active page/item.
  ///
  /// Determines the [color] and opacity of the dot.
  final bool selected;

  /// Builds the circular container with conditional color styling.
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      width: 8,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: selected ? Colors.white : Colors.white.withOpacity(0.4),
      ),
    );
  }
}
