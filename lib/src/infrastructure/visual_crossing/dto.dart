import 'dart:convert';

/// Converts a JSON string to a [WeatherDto] object.
WeatherDto weatherDtoFromJson(String str) =>
    WeatherDto.fromJson(json.decode(str) as Map<String, dynamic>);

/// Converts a [WeatherDto] object to a JSON string.
String weatherDtoToJson(WeatherDto data) => json.encode(data.toJson());

/// Represents the top-level response from the weather API.
class WeatherDto {
  /// Creates a [WeatherDto] instance.
  const WeatherDto({
    this.queryCost,
    this.latitude,
    this.longitude,
    this.resolvedAddress,
    this.address,
    this.timezone,
    this.tzoffset,
    this.days,
    this.stations,
  });

  /// Creates a [WeatherDto] instance from a JSON map.
  factory WeatherDto.fromJson(Map<String, dynamic> json) => WeatherDto(
    queryCost: json['queryCost'] as int?,
    latitude: json['latitude'] is num
        ? (json['latitude'] as num).toDouble()
        : null,
    longitude: json['longitude'] is num
        ? (json['longitude'] as num).toDouble()
        : null,
    resolvedAddress: json['resolvedAddress'] as String?,
    address: json['address'] as String?,
    timezone: json['timezone'] as String?,
    tzoffset: json['tzoffset'] as int?,
    days: json['days'] == null
        ? <Day>[]
        : List<Day>.from(
            (json['days'] as Iterable<dynamic>).map(
              (x) => Day.fromJson(x as Map<String, dynamic>),
            ),
          ),
    stations: json['stations'] == null
        ? null
        : Map<String, Station>.from(
            (json['stations'] as Map<String, dynamic>).map(
              (k, v) => MapEntry<String, Station>(
                k,
                Station.fromJson(v as Map<String, dynamic>),
              ),
            ),
          ),
  );

  /// The cost associated with the query.
  final int? queryCost;

  /// The latitude of the requested location.
  final double? latitude;

  /// The longitude of the requested location.
  final double? longitude;

  /// The resolved address.
  final String? resolvedAddress;

  /// The original address used in the query.
  final String? address;

  /// The timezone of the location.
  final String? timezone;

  /// The timezone offset.
  final int? tzoffset;

  /// The list of daily weather forecasts.
  final List<Day>? days;

  /// A map of weather stations used for the data.
  final Map<String, Station>? stations;

  /// Converts the [WeatherDto] instance to a JSON map.
  Map<String, dynamic> toJson() => {
    'queryCost': queryCost,
    'latitude': latitude,
    'longitude': longitude,
    'resolvedAddress': resolvedAddress,
    'address': address,
    'timezone': timezone,
    'tzoffset': tzoffset,
    'days': days == null
        ? <String>[]
        : List<dynamic>.from(days!.map((x) => x.toJson())),
    'stations': stations == null
        ? null
        : Map<String, dynamic>.from(
            stations!,
          ).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
  };
}

/// Represents the weather forecast data for a single day.
class Day {
  /// Creates a [Day] instance.
  const Day({
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

  /// Creates a [Day] instance from a JSON map.
  factory Day.fromJson(Map<String, dynamic> json) => Day(
    datetime: json['datetime'] == null
        ? null
        : DateTime.tryParse(json['datetime'] as String),
    datetimeEpoch: json['datetimeEpoch'] as int?,
    tempmax: json['tempmax'] is num
        ? (json['tempmax'] as num).toDouble()
        : null,
    tempmin: json['tempmin'] is num
        ? (json['tempmin'] as num).toDouble()
        : null,
    temp: json['temp'] is num ? (json['temp'] as num).toDouble() : null,
    feelslikemax: json['feelslikemax'] is num
        ? (json['feelslikemax'] as num).toDouble()
        : null,
    feelslikemin: json['feelslikemin'] is num
        ? (json['feelslikemin'] as num).toDouble()
        : null,
    feelslike: json['feelslike'] is num
        ? (json['feelslike'] as num).toDouble()
        : null,
    dew: json['dew'] is num ? (json['dew'] as num).toDouble() : null,
    humidity: json['humidity'] is num
        ? (json['humidity'] as num).toDouble()
        : null,
    precip: json['precip'] is num ? (json['precip'] as num).toDouble() : null,
    precipprob: json['precipprob'] as int?,
    precipcover: json['precipcover'] is num
        ? (json['precipcover'] as num).toDouble()
        : null,
    preciptype: json['preciptype'] == null
        ? <String>[]
        : List<String>.from(
            (json['preciptype'] as Iterable<dynamic>).map((x) => x as String),
          ),
    snow: json['snow'] as int?,
    snowdepth: json['snowdepth'] as int?,
    windgust: json['windgust'] is num
        ? (json['windgust'] as num).toDouble()
        : null,
    windspeed: json['windspeed'] is num
        ? (json['windspeed'] as num).toDouble()
        : null,
    winddir: json['winddir'] is num
        ? (json['winddir'] as num).toDouble()
        : null,
    pressure: json['pressure'] is num
        ? (json['pressure'] as num).toDouble()
        : null,
    cloudcover: json['cloudcover'] is num
        ? (json['cloudcover'] as num).toDouble()
        : null,
    visibility: json['visibility'] is num
        ? (json['visibility'] as num).toDouble()
        : null,
    solarradiation: json['solarradiation'] is num
        ? (json['solarradiation'] as num).toDouble()
        : null,
    solarenergy: json['solarenergy'] is num
        ? (json['solarenergy'] as num).toDouble()
        : null,
    uvindex: json['uvindex'] as int?,
    sunrise: json['sunrise'] as String?,
    sunriseEpoch: json['sunriseEpoch'] as int?,
    sunset: json['sunset'] as String?,
    sunsetEpoch: json['sunsetEpoch'] as int?,
    moonphase: json['moonphase'] is num
        ? (json['moonphase'] as num).toDouble()
        : null,
    conditions: json['conditions'] as String?,
    description: json['description'] as String?,
    icon: json['icon'] as String?,
    stations: json['stations'] == null
        ? <String>[]
        : List<String>.from(
            (json['stations'] as Iterable<dynamic>).map((x) => x as String),
          ),
    source: json['source'] as String?,
    events: json['events'] == null
        ? <EventApi>[]
        : List<EventApi>.from(
            (json['events'] as Iterable<dynamic>).map(
              (x) => EventApi.fromJson(x as Map<String, dynamic>),
            ),
          ),
  );

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
  final List<EventApi>? events;

  /// Converts the [Day] instance to a JSON map.
  Map<String, dynamic> toJson() => {
    'datetime':
        ///
        // ignore: lines_longer_than_80_chars
        '${datetime!.year.toString().padLeft(4, '0')}-${datetime!.month.toString().padLeft(2, '0')}-${datetime!.day.toString().padLeft(2, '0')}',
    'datetimeEpoch': datetimeEpoch,
    'tempmax': tempmax,
    'tempmin': tempmin,
    'temp': temp,
    'feelslikemax': feelslikemax,
    'feelslikemin': feelslikemin,
    'feelslike': feelslike,
    'dew': dew,
    'humidity': humidity,
    'precip': precip,
    'precipprob': precipprob,
    'precipcover': precipcover,
    'preciptype': preciptype == null
        ? <String>[]
        : List<dynamic>.from(preciptype!.map((x) => x)),
    'snow': snow,
    'snowdepth': snowdepth,
    'windgust': windgust,
    'windspeed': windspeed,
    'winddir': winddir,
    'pressure': pressure,
    'cloudcover': cloudcover,
    'visibility': visibility,
    'solarradiation': solarradiation,
    'solarenergy': solarenergy,
    'uvindex': uvindex,
    'sunrise': sunrise,
    'sunriseEpoch': sunriseEpoch,
    'sunset': sunset,
    'sunsetEpoch': sunsetEpoch,
    'moonphase': moonphase,
    'conditions': conditions,
    'description': description,
    'icon': icon,
    'stations': stations == null
        ? <String>[]
        : List<dynamic>.from(stations!.map((x) => x)),
    'source': source,
    'events': events == null
        ? <String>[]
        : List<dynamic>.from(events!.map((x) => x.toJson())),
  };
}

/// Represents an extreme weather event reported by the API.
class EventApi {
  /// Creates an [EventApi] instance.
  const EventApi({
    this.datetime,
    this.datetimeEpoch,
    this.type,
    this.latitude,
    this.longitude,
    this.distance,
    this.desc,
    this.size,
  });

  /// Creates an [EventApi] instance from a JSON map.
  factory EventApi.fromJson(Map<String, dynamic> json) => EventApi(
    datetime: json['datetime'] == null
        ? null
        : DateTime.tryParse(json['datetime'] as String),
    datetimeEpoch: json['datetimeEpoch'] as int?,
    type: typeValues.map[json['type'] as String],
    latitude: json['latitude'] is num
        ? (json['latitude'] as num).toDouble()
        : null,
    longitude: json['longitude'] is num
        ? (json['longitude'] as num).toDouble()
        : null,
    distance: json['distance'] is num
        ? (json['distance'] as num).toDouble()
        : null,
    desc: json['desc'] as String?,
    size: json['size'] is num ? (json['size'] as num).toDouble() : null,
  );

  /// Date and time of the event.
  final DateTime? datetime;

  /// Epoch time of the event.
  final int? datetimeEpoch;

  /// Type of the weather event.
  final EventTypeApi? type;

  /// Latitude of the event's location.
  final double? latitude;

  /// Longitude of the event's location.
  final double? longitude;

  /// Distance from the queried location.
  final double? distance;

  /// Description of the event.
  final String? desc;

  /// Size or magnitude of the event.
  final double? size;

  /// Converts the [EventApi] instance to a JSON map.
  Map<String, dynamic> toJson() => {
    'datetime': datetime?.toIso8601String(),
    'datetimeEpoch': datetimeEpoch,
    'type': typeValues.reverse[type],
    'latitude': latitude,
    'longitude': longitude,
    'distance': distance,
    'desc': desc,
    'size': size,
  };
}

/// Defines the possible types of weather events reported by the API.
enum EventTypeApi {
  /// Indicates hail events.
  HAIL,
}

/// Utility for mapping API event string values to [EventTypeApi].
final EnumValues<EventTypeApi> typeValues = EnumValues({
  'hail': EventTypeApi.HAIL,
});

/// Represents a weather station used to gather data for the forecast.
class Station {
  /// Creates a [Station] instance.
  const Station({
    this.distance,
    this.latitude,
    this.longitude,
    this.useCount,
    this.id,
    this.name,
    this.quality,
    this.contribution,
  });

  /// Creates a [Station] instance from a JSON map.
  factory Station.fromJson(Map<String, dynamic> json) => Station(
    distance: json['distance'] as int?,
    latitude: json['latitude'] is num
        ? (json['latitude'] as num).toDouble()
        : null,
    longitude: json['longitude'] is num
        ? (json['longitude'] as num).toDouble()
        : null,
    useCount: json['useCount'] as int?,
    id: json['id'] as String?,
    name: json['name'] as String?,
    quality: json['quality'] as int?,
    contribution: json['contribution'] as int?,
  );

  /// Distance to the station from the queried location.
  final int? distance;

  /// Latitude of the station.
  final double? latitude;

  /// Longitude of the station.
  final double? longitude;

  /// Number of times the station's data was used.
  final int? useCount;

  /// The unique identifier of the station.
  final String? id;

  /// The name of the station.
  final String? name;

  /// Quality score of the station's data.
  final int? quality;

  /// Contribution score of the station.
  final int? contribution;

  /// Converts the [Station] instance to a JSON map.
  Map<String, dynamic> toJson() => {
    'distance': distance,
    'latitude': latitude,
    'longitude': longitude,
    'useCount': useCount,
    'id': id,
    'name': name,
    'quality': quality,
    'contribution': contribution,
  };
}

/// A utility class for mapping string values to enum values and vice versa.
class EnumValues<T> {
  /// Creates an [EnumValues] instance.
  EnumValues(this.map);

  /// The map containing string keys and enum values.
  final Map<String, T> map;

  /// The inverse map, containing enum keys and string values.
  late Map<T, String> reverseMap;

  /// Returns the inverse map, initializing it if necessary.
  Map<T, String> get reverse {
    return map.map((k, v) => MapEntry(v, k));
  }
}
