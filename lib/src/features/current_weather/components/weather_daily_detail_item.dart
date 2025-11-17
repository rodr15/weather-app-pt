import 'package:flutter/material.dart';

/// A widget to display a single weather-related time or value with an icon.
///
/// This component is designed to be highly reusable for items like sunrise,
/// sunset, or moon phase, stacking the icon, the value, and the label
/// vertically within a [Column].
class WeatherDailyDetailItem extends StatelessWidget {
  /// Creates a [WeatherDailyDetailItem] instance.
  const WeatherDailyDetailItem({
    required this.icon, required this.iconColor, required this.label, required this.value, super.key,
  });

  /// The icon data to display at the top of the item.
  final IconData icon;

  /// The color applied to the [icon].
  final Color iconColor;

  /// The descriptive label for the item (e.g., 'Amanecer').
  final String label;

  /// The main data value to display (e.g., '6:30 AM').
  final String value;

  /// Builds the vertical arrangement of the icon, value, and label.
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Container for the icon (mimics your existing style)
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), // Slightly smaller radius
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Icon(
              icon,
              color: iconColor,
              size: 20,
            ),
          ),
        ),
        const SizedBox(height: 6), // Spacing between icon and time/value
        // Label/Value Text
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white, // Assuming a dark background context
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            color: Colors.white.withOpacity(0.8),
          ),
        ),
      ],
    );
  }
}
