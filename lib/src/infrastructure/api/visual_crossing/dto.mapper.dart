import 'package:weather_app_pt/src/infrastructure/api/visual_crossing/dto.dart';
import 'package:weather_app_pt/src/shared/domain/models/event.dart';
import 'package:weather_app_pt/src/shared/domain/models/forecast.dart';
import 'package:weather_app_pt/src/shared/domain/models/hour_forecast.dart';
import 'package:weather_app_pt/src/shared/domain/models/place.dart';

/// Extension to map [WeatherDto] to the domain model [Place].
extension WeatherDtoMapper on WeatherDto {
  /// Converts the DTO to a domain [Place] object.
  Place toPlace() {
    return Place(
      latitude: latitude,
      longitude: longitude,
      resolvedAddress: resolvedAddress,
      address: address,
      timezone: timezone,
      tzoffset: tzoffset,
      forecastDaysList: days?.map((day) => day.toForecast()).toList(),
    );
  }
}

/// Extension to map [Day] DTO to the domain model [Forecast].
extension DayMapper on Day {
  /// Converts the DTO to a domain [Forecast] object.
  Forecast toForecast() {
    return Forecast(
      datetime: datetime,
      datetimeEpoch: datetimeEpoch,
      tempmax: tempmax,
      tempmin: tempmin,
      temp: temp,
      feelslikemax: feelslikemax,
      feelslikemin: feelslikemin,
      feelslike: feelslike,
      dew: dew,
      humidity: humidity,
      precip: precip,
      precipprob: precipprob,
      precipcover: precipcover,
      preciptype: preciptype,
      snow: snow,
      snowdepth: snowdepth,
      windgust: windgust,
      windspeed: windspeed,
      winddir: winddir,
      pressure: pressure,
      cloudcover: cloudcover,
      visibility: visibility,
      solarradiation: solarradiation,
      solarenergy: solarenergy,
      uvindex: uvindex,
      sunrise: sunrise,
      sunriseEpoch: sunriseEpoch,
      sunset: sunset,
      sunsetEpoch: sunsetEpoch,
      moonphase: moonphase,
      conditions: conditions,
      description: description,
      icon: icon,
      events: events?.map((event) => event.toEvent()).toList(),
      hourForecast: hours?.map((hour) => hour.toHourForecast()).toList(),
    );
  }
}

/// Extension to map [Hour] DTO to the domain model [HourForecast].
extension HourMapper on Hour {
  /// Converts the DTO to a domain [HourForecast] object.
  HourForecast toHourForecast() {
    return HourForecast(
      datetime: datetime,
      datetimeEpoch: datetimeEpoch,
      temp: temp,
      cloudcover: cloudcover,
      conditions: conditions,
      dew: dew,
      feelslike: feelslike,
      humidity: humidity,
      icon: icon,
      precip: precip,
      precipprob: precipprob,
      preciptype: preciptype,
      pressure: pressure,
      snow: snow,
      snowdepth: snowdepth,
      solarenergy: solarenergy,
      solarradiation: solarradiation,
      source: source,
      stations: stations,
      tzoffset: tzoffset,
      uvindex: uvindex,
      visibility: visibility,
      winddir: winddir,
      windgust: windgust,
      windspeed: windspeed,
    );
  }
}

/// Extension to map the DTO enum [EventTypeApi] to the domain enum [EventType].
extension EventTypeApiMapper on EventTypeApi {
  /// Converts the API enum value to the domain enum value.
  EventType toDomain() {
    switch (this) {
      case EventTypeApi.HAIL:
        return EventType.HAIL;
    }
  }
}

/// Extension to map [EventApi] DTO to the domain model [Event].
extension EventMapper on EventApi {
  /// Converts the DTO to a domain [Event] object.
  Event toEvent() {
    return Event(
      datetime: datetime,
      datetimeEpoch: datetimeEpoch,
      type: type?.toDomain(),
      latitude: latitude,
      longitude: longitude,
      distance: distance,
      desc: desc,
      size: size,
    );
  }
}
