import 'package:flutter/material.dart';

/// Defines the weather icon IDs returned by the Visual Crossing Weather API,
/// mapped to Material Icons, two gradient Colors, and a dedicated icon Color.
enum WeatherIconId {
  /// Amount of snow is greater than zero.
  snow(
    id: 'snow',
    materialIcon: Icons.ac_unit,
    colors: [Color(0xFFE6E9F0), Color(0xFFAAB8C2)],
    iconColor: Color(0xFF455A64),
  ),

  /// Amount of rainfall is greater than zero.
  rain(
    id: 'rain',
    materialIcon: Icons.water_drop,
    colors: [Color(0xFF657786), Color(0xFF455A64)],
    iconColor: Colors.white,
  ),

  /// Visibility is low (lower than one kilometer or mile).
  fog(
    id: 'fog',
    materialIcon: Icons.dehaze,
    colors: [Color(0xFFD3DCE8), Color(0xFFC5D4E1)],
    iconColor: Color(0xFF607D8B),
  ),

  /// Wind speed is high (greater than 30 kph or mph).
  wind(
    id: 'wind',
    materialIcon: Icons.air,
    colors: [Color(0xFFB0BEC5), Color(0xFF90A4AE)],
    iconColor: Color(0xFF546E7A),
  ),

  /// Cloud cover is greater than 90% cover.
  cloudy(
    id: 'cloudy',
    materialIcon: Icons.cloud,
    colors: [Color(0xFF757F9A), Color(0xFFD7DDE8)],
    iconColor: Colors.white,
  ),

  /// Cloud cover is greater than 20% cover during day time.
  partlyCloudyDay(
    id: 'partly-cloudy-day',
    materialIcon: Icons.cloudy_snowing,
    colors: [Color(0xFFF7971E), Color(0xFFFFD200)],
    iconColor: Color(0xFFB02828),
  ),

  /// Cloud cover is greater than 20% cover during night time.
  partlyCloudyNight(
    id: 'partly-cloudy-night',
    materialIcon: Icons.wb_cloudy_rounded,
    colors: [Color(0xFF2C3E50), Color(0xFF4CA1AF)],
    iconColor: Color(0xFFC5D4E1),
  ),

  /// Cloud cover is less than 20% cover during day time.
  clearDay(
    id: 'clear-day',
    materialIcon: Icons.wb_sunny,
    colors: [Color(0xFF89F7FE), Color(0xFF66A6FF)],
    iconColor: Color(0xFFFDD835),
  ),

  /// Cloud cover is less than 20% cover during night time.
  clearNight(
    id: 'clear-night',
    materialIcon: Icons.nightlight_round,
    colors: [Color(0xFF141E30), Color(0xFF243B55)],
    iconColor: Color(0xFFFFF8E1),
  ),

  /// Periods of snow during the day (icons2).
  snowShowersDay(
    id: 'snow-showers-day',
    materialIcon: Icons.cloudy_snowing,
    colors: [Color(0xFFC3CFE2), Color(0xFFD3DCE8)],
    iconColor: Color(0xFF455A64),
  ),

  /// Periods of snow during the night (icons2).
  snowShowersNight(
    id: 'snow-showers-night',
    materialIcon: Icons.cloudy_snowing,
    colors: [Color(0xFF3E4E60), Color(0xFF657380)],
    iconColor: Color(0xFFCFD8DC),
  ),

  /// Thunderstorms throughout the day or night (icons2).
  thunderRain(
    id: 'thunder-rain',
    materialIcon: Icons.thunderstorm,
    colors: [Color(0xFF1B2838), Color(0xFF4C6A86)],
    iconColor: Color(0xFFFFC107),
  ),

  /// Possible thunderstorms throughout the day (icons2).
  thunderShowersDay(
    id: 'thunder-showers-day',
    materialIcon: Icons.thunderstorm,
    colors: [Color(0xFF4F5C77), Color(0xFF898F9C)],
    iconColor: Color(0xFFFFC107),
  ),

  /// Possible thunderstorms throughout the night (icons2).
  thunderShowersNight(
    id: 'thunder-showers-night',
    materialIcon: Icons.thunderstorm,
    colors: [Color(0xFF1B2838), Color(0xFF4C6A86)],
    iconColor: Color(0xFFFFC107),
  ),

  /// Rain showers during the day (icons2).
  showersDay(
    id: 'showers-day',
    materialIcon: Icons.cloud_queue,
    colors: [Color(0xFF7B8D93), Color(0xFFA1ACB2)],
    iconColor: Color(0xFF34495E),
  ),

  /// Rain showers during the night (icons2).
  showersNight(
    id: 'showers-night',
    materialIcon: Icons.cloud_queue,
    colors: [Color(0xFF34495E), Color(0xFF5D7D8B)],
    iconColor: Color(0xFFB0BEC5),
  ),

  /// Fallback for an unknown or unmapped icon ID.
  unknown(
    id: 'unknown',
    materialIcon: Icons.question_mark,
    colors: [Color(0xFF90A4AE), Color(0xFF607D8B)],
    iconColor: Colors.black54,
  )
  ;

  /// Creates a [WeatherIconId] enum value and initializes its final properties.
  const WeatherIconId({
    required this.id,
    required this.materialIcon,
    required this.colors,
    required this.iconColor,
  });

  /// The string ID returned by the Visual Crossing API (e.g., 'clear-day').
  final String id;

  /// The Material Icon to display in your Flutter UI.
  final IconData materialIcon;

  /// A list containing two [Color] objects for a gradient background.
  final List<Color> colors;

  /// The single [Color] to use for the foreground icon itself.
  final Color iconColor;

  /// Retrieves the [WeatherIconId] enum member corresponding to the given API string [id].
  ///
  /// Returns [WeatherIconId.unknown] if the ID is not found.
  static WeatherIconId fromId(String id) {
    return WeatherIconId.values.firstWhere(
      (v) => v.id == id,
      orElse: () => WeatherIconId.unknown,
    );
  }
}
