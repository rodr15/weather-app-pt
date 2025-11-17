import 'package:flutter/material.dart';

/// A widget to display a single weather detail item, consisting of an icon,
/// a value with an optional suffix, and a descriptive label.
class WeatherDetailItem extends StatelessWidget {
  /// Creates a [WeatherDetailItem].
  const WeatherDetailItem({
    required this.iconData, required this.iconColor, required this.value, required this.label, super.key,
    this.valueSuffix = '',
  });

  /// The icon data to be displayed next to the value.
  final IconData iconData;

  /// The color of the icon.
  final Color iconColor;

  /// The main value string (e.g., '25', '80').
  final String value;

  /// The descriptive label for the detail (e.g., 'Humidity', 'Wind Speed').
  final String label;

  /// An optional suffix or unit for the value (e.g., '%', 'm/s'). Defaults to ''.
  final String valueSuffix;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              iconData,
              color: iconColor,
              size: 24,
            ),
            const SizedBox(width: 6),
            Text(
              '$value$valueSuffix',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white.withOpacity(0.8),
            fontSize: 12,
            height: 1.2,
          ),
        ),
      ],
    );
  }
}
