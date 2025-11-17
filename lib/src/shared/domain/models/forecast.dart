import 'package:weather_app_pt/src/shared/domain/models/event.dart';

/// Represents the weather forecast data for a single day in the domain model.
class Forecast {
  /// Creates a [Forecast] instance.
  const Forecast({
    this.datetime,
    this.datetimeEpoch,
    this.tempmax,
    this.tempmin,
    this.temp,
    this.feelslikemax,
    this.feelslikemin,
    this.feelslike,
    this.dew,
    this.humidity,
    this.precip,
    this.precipprob,
    this.precipcover,
    this.preciptype,
    this.snow,
    this.snowdepth,
    this.windgust,
    this.windspeed,
    this.winddir,
    this.pressure,
    this.cloudcover,
    this.visibility,
    this.solarradiation,
    this.solarenergy,
    this.uvindex,
    this.sunrise,
    this.sunriseEpoch,
    this.sunset,
    this.sunsetEpoch,
    this.moonphase,
    this.conditions,
    this.description,
    this.icon,
    this.stations,
    this.source,
    this.events,
  });

  /// The date of the forecast.
  final DateTime? datetime;

  /// The epoch time of the forecast date.
  final int? datetimeEpoch;

  /// Maximum temperature.
  final double? tempmax;

  /// Minimum temperature.
  final double? tempmin;

  /// Average temperature.
  final double? temp;

  /// Maximum perceived temperature.
  final double? feelslikemax;

  /// Minimum perceived temperature.
  final double? feelslikemin;

  /// Average perceived temperature.
  final double? feelslike;

  /// Dew point.
  final double? dew;

  /// Humidity percentage.
  final double? humidity;

  /// Precipitation amount.
  final double? precip;

  /// Probability of precipitation.
  final int? precipprob;

  /// Precipitation coverage percentage.
  final double? precipcover;

  /// Types of precipitation (e.g., 'rain', 'snow').
  final List<String>? preciptype;

  /// Snowfall amount.
  final int? snow;

  /// Snow depth.
  final int? snowdepth;

  /// Wind gust speed.
  final double? windgust;

  /// Wind speed.
  final double? windspeed;

  /// Wind direction in degrees.
  final double? winddir;

  /// Atmospheric pressure.
  final double? pressure;

  /// Cloud cover percentage.
  final double? cloudcover;

  /// Visibility distance.
  final double? visibility;

  /// Solar radiation.
  final double? solarradiation;

  /// Solar energy.
  final double? solarenergy;

  /// UV index.
  final int? uvindex;

  /// Time of sunrise.
  final String? sunrise;

  /// Epoch time of sunrise.
  final int? sunriseEpoch;

  /// Time of sunset.
  final String? sunset;

  /// Epoch time of sunset.
  final int? sunsetEpoch;

  /// Moon phase.
  final double? moonphase;

  /// General weather conditions summary.
  final String? conditions;

  /// Detailed weather description.
  final String? description;

  /// Icon identifier for the weather condition.
  final String? icon;

  /// List of station IDs used for the data.
  final List<String>? stations;

  /// Data source.
  final String? source;

  /// List of weather events (e.g., hail).
  final List<Event>? events;
}
