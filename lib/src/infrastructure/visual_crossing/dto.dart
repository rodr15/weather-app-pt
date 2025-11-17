import 'dart:convert';

// --- Utility Classes MUST BE DEFINED FIRST ---

/// Defines the possible types of weather events reported by the API.
enum EventTypeApi {
  /// Indicates hail events.
  HAIL,
}

/// A utility class for mapping string values to enum values and vice versa.
class EnumValues<T> {
  /// Creates an [EnumValues] instance.
  EnumValues(this.map);

  /// The map containing string keys and enum values.
  final Map<String, T> map;

  /// Returns the inverse map, calculated on demand.
  Map<T, String> get reverse {
    // Only calculate the reverse map once
    return map.map((k, v) => MapEntry(v, k));
  }
}

/// Utility for mapping API event string values to [EventTypeApi].
// This definition must come BEFORE EventApi uses it in its fromJson factory.
final EnumValues<EventTypeApi> typeValues = EnumValues({
  'hail': EventTypeApi.HAIL,
});

// --- Model Classes follow ---

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
    queryCost: (json['queryCost'] as num?)?.toDouble(),
    latitude: (json['latitude'] as num?)?.toDouble(),
    longitude: (json['longitude'] as num?)?.toDouble(),
    resolvedAddress: json['resolvedAddress'] as String?,
    address: json['address'] as String?,
    timezone: json['timezone'] as String?,
    tzoffset: (json['tzoffset'] as num?)?.toDouble(),
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
  final double? queryCost;

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
  final double? tzoffset;

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
        ? <dynamic>[]
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
    this.hours,
  });

  /// Creates a [Day] instance from a JSON map.
  factory Day.fromJson(Map<String, dynamic> json) => Day(
    datetime: json['datetime'] == null
        ? null
        : DateTime.tryParse(json['datetime'] as String),
    datetimeEpoch: (json['datetimeEpoch'] as num?)?.toDouble(),
    tempmax: (json['tempmax'] as num?)?.toDouble(),
    tempmin: (json['tempmin'] as num?)?.toDouble(),
    temp: (json['temp'] as num?)?.toDouble(),
    feelslikemax: (json['feelslikemax'] as num?)?.toDouble(),
    feelslikemin: (json['feelslikemin'] as num?)?.toDouble(),
    feelslike: (json['feelslike'] as num?)?.toDouble(),
    dew: (json['dew'] as num?)?.toDouble(),
    humidity: (json['humidity'] as num?)?.toDouble(),
    precip: (json['precip'] as num?)?.toDouble(),
    precipprob: (json['precipprob'] as num?)?.toDouble(),
    precipcover: (json['precipcover'] as num?)?.toDouble(),
    preciptype: json['preciptype'] == null
        ? <String>[]
        : List<String>.from(
            (json['preciptype'] as Iterable<dynamic>).map((x) => x as String),
          ),
    snow: (json['snow'] as num?)?.toDouble(),
    snowdepth: (json['snowdepth'] as num?)?.toDouble(),
    windgust: (json['windgust'] as num?)?.toDouble(),
    windspeed: (json['windspeed'] as num?)?.toDouble(),
    winddir: (json['winddir'] as num?)?.toDouble(),
    pressure: (json['pressure'] as num?)?.toDouble(),
    cloudcover: (json['cloudcover'] as num?)?.toDouble(),
    visibility: (json['visibility'] as num?)?.toDouble(),
    solarradiation: (json['solarradiation'] as num?)?.toDouble(),
    solarenergy: (json['solarenergy'] as num?)?.toDouble(),
    uvindex: (json['uvindex'] as num?)?.toDouble(),
    sunrise: json['sunrise'] as String?,
    sunriseEpoch: (json['sunriseEpoch'] as num?)?.toDouble(),
    sunset: json['sunset'] as String?,
    sunsetEpoch: (json['sunsetEpoch'] as num?)?.toDouble(),
    moonphase: (json['moonphase'] as num?)?.toDouble(),
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
  final double? datetimeEpoch;

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
  final double? precipprob;

  /// Precipitation coverage percentage.
  final double? precipcover;

  /// Types of precipitation (e.g., 'rain', 'snow').
  final List<String>? preciptype;

  /// Snowfall amount.
  final double? snow;

  /// Snow depth.
  final double? snowdepth;

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
  final double? uvindex;

  /// Time of sunrise.
  final String? sunrise;

  /// Epoch time of sunrise.
  final double? sunriseEpoch;

  /// Time of sunset.
  final String? sunset;

  /// Epoch time of sunset.
  final double? sunsetEpoch;

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

  /// The list of hourly weather forecasts.
  final List<Hour>? hours;

  /// Converts the [Day] instance to a JSON map.
  Map<String, dynamic> toJson() => {
    'datetime': datetime?.toIso8601String().split('T').first,
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
        ? <dynamic>[]
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
        ? <dynamic>[]
        : List<dynamic>.from(stations!.map((x) => x)),
    'source': source,
    'events': events == null
        ? <dynamic>[]
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
    datetimeEpoch: (json['datetimeEpoch'] as num?)?.toDouble(),
    // This is where 'typeValues' is used. It is now defined above this class.
    type: typeValues.map[json['type'] as String],
    latitude: (json['latitude'] as num?)?.toDouble(),
    longitude: (json['longitude'] as num?)?.toDouble(),
    distance: (json['distance'] as num?)?.toDouble(),
    desc: json['desc'] as String?,
    size: (json['size'] as num?)?.toDouble(),
  );

  /// Date and time of the event.
  final DateTime? datetime;

  /// Epoch time of the event.
  final double? datetimeEpoch;

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
    distance: (json['distance'] as num?)?.toDouble(),
    latitude: (json['latitude'] as num?)?.toDouble(),
    longitude: (json['longitude'] as num?)?.toDouble(),
    useCount: (json['useCount'] as num?)?.toDouble(),
    id: json['id'] as String?,
    name: json['name'] as String?,
    quality: (json['quality'] as num?)?.toDouble(),
    contribution: (json['contribution'] as num?)?.toDouble(),
  );

  /// Distance to the station from the queried location.
  final double? distance;

  /// Latitude of the station.
  final double? latitude;

  /// Longitude of the station.
  final double? longitude;

  /// Number of times the station's data was used.
  final double? useCount;

  /// The unique identifier of the station.
  final String? id;

  /// The name of the station.
  final String? name;

  /// Quality score of the station's data.
  final double? quality;

  /// Contribution score of the station.
  final double? contribution;

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

/// Represents the weather forecast data for a single hour.
class Hour {
  /// Creates an [Hour] instance.
  Hour({
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
    // ... otros campos
  });

  /// Creates an [Hour] instance from a JSON map.
  factory Hour.fromJson(Map<String, dynamic> json) => Hour(
    // ... implementación de fromJson
  );

  /// Converts the [Hour] instance to a JSON map.
  Map<String, dynamic> toJson() => {
    // ... implementación de toJson
  };

  // --- Campos ---

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
