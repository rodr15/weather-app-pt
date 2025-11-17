import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_app_pt/src/features/current_weather/application/weather_service.provider.dart';
import 'package:weather_app_pt/src/shared/domain/models/place.dart';

part 'weather_data.provider.g.dart';

/// Fetches the current weather for a fixed location.
/// This returns an AsyncValue<Place> which handles loading and error states.
@riverpod
Future<Place> currentPlaceWeather(Ref ref) {
  // 1. Get the WeatherService implementation from its provider
  final service = ref.watch(weatherServiceProvider);

  // 2. Define the location (replace with a real location provider later)
  const String defaultLatitude = '40.7128';
  const String defaultLongitude = '-74.0060';

  // 3. Call the service method
  return service.getCurrentPlaceWeather(defaultLatitude, defaultLongitude);
}
