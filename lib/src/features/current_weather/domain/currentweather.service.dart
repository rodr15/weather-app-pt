import 'package:weather_app_pt/src/shared/domain/models/place.dart';

/// {@template weather_service}
/// Abstract class defining the contract for fetching weather-related data.
/// {@endtemplate}
abstract class WeatherService {
  /// Fetches the current weather for the user's current location.
  Future<Place> getCurrentPlaceWeather(
    String latitude,
    String longitude,
  );
}
