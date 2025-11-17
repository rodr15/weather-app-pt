/// Represents the weather forecast data for a single hour.
class HourForecast {
  /// Creates an [HourForecast] instance.
  HourForecast({
    this.datetime,
    this.datetimeEpoch,
    this.temp,
    this.cloudcover,
    this.conditions,
    this.dew,
    this.feelslike,
    this.humidity,
    this.icon,
    this.precip,
    this.precipprob,
    this.preciptype,
    this.pressure,
    this.snow,
    this.snowdepth,
    this.solarenergy,
    this.solarradiation,
    this.source,
    this.stations,
    this.tzoffset,
    this.uvindex,
    this.visibility,
    this.winddir,
    this.windgust,
    this.windspeed,
  });

  /// The date and time of the forecast hour (e.g., "14:00:00").
  final String? datetime;

  /// The epoch time of the forecast hour.
  final int? datetimeEpoch;

  /// The average temperature for the hour.
  final double? temp;

  /// The perceived temperature (feels like).
  final double? feelslike;

  /// The humidity percentage.
  final double? humidity;

  /// The dew point temperature.
  final double? dew;

  /// The precipitation amount.
  final double? precip;

  /// The probability of precipitation (0-100%).
  final int? precipprob;

  /// The amount of snowfall.
  final int? snow;

  /// The snow depth.
  final int? snowdepth;

  /// The types of precipitation (e.g., 'rain', 'snow').
  final List<String>? preciptype;

  /// The maximum wind gust speed.
  final double? windgust;

  /// The average wind speed.
  final double? windspeed;

  /// The wind direction in degrees.
  final int? winddir;

  /// The atmospheric pressure.
  final double? pressure;

  /// The visibility distance.
  final double? visibility;

  /// The cloud cover percentage.
  final double? cloudcover;

  /// The solar radiation index.
  final int? solarradiation;

  /// The solar energy amount.
  final double? solarenergy;

  /// The UV index for the hour.
  final int? uvindex;

  /// The general weather conditions summary.
  final String? conditions;

  /// The icon identifier for the weather condition.
  final String? icon;

  /// The list of station IDs used for the data.
  final List<String>? stations;

  /// The data source.
  final String? source;

  /// The timezone offset.
  final int? tzoffset;
}
