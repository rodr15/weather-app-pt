import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_app_pt/src/features/current_weather/domain/currentweather.service.dart';
import 'package:weather_app_pt/src/infrastructure/api/visual_crossing/service.impl.dart';

part 'weather_service.provider.g.dart';

/// Provider for the concrete WeatherService implementation.
/// Uses keepAlive to maintain the service instance in memory.
@Riverpod(keepAlive: true)
WeatherService weatherService(Ref ref) {
  // We return the concrete implementation but expose it as the abstract contract.
  return WeatherServiceImpl();
}
