import 'package:weather_app_pt/src/shared/domain/models/forecast.dart';

/// Represents a geographical location and its weather forecast data in the
/// domain model.
class Place {
  /// Creates a [Place] instance.
  const Place({
    this.latitude,
    this.longitude,
    this.resolvedAddress,
    this.address,
    this.timezone,
    this.tzoffset,
    this.days,
  });

  /// The latitude of the location.
  final double? latitude;

  /// The longitude of the location.
  final double? longitude;

  /// The resolved, accurate address string.
  final String? resolvedAddress;

  /// The original address used in the query.
  final String? address;

  /// The timezone of the location (e.g., 'America/New_York').
  final String? timezone;

  /// The timezone offset in hours.
  final double? tzoffset;

  /// A list of daily weather forecasts for the location.
  final List<Forecast>? days;
}
