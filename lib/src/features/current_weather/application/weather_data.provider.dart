import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_app_pt/src/features/current_weather/application/weather_service.provider.dart';
import 'package:weather_app_pt/src/shared/domain/models/place.dart';

part 'weather_data.provider.g.dart';

/// Fetches the current weather for a fixed location.
/// This returns an [AsyncValue<Place>] which handles loading and error states.
@riverpod
Future<Place> currentPlaceWeather(Ref ref) {
  final service = ref.watch(weatherServiceProvider);

  const defaultLatitude = '40.7128';
  const defaultLongitude = '-74.0060';

  return service.getCurrentPlaceWeather(defaultLatitude, defaultLongitude);
}
