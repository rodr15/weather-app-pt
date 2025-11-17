// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_service.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider for the concrete WeatherService implementation.
/// Uses keepAlive to maintain the service instance in memory.

@ProviderFor(weatherService)
const weatherServiceProvider = WeatherServiceProvider._();

/// Provider for the concrete WeatherService implementation.
/// Uses keepAlive to maintain the service instance in memory.

final class WeatherServiceProvider
    extends $FunctionalProvider<WeatherService, WeatherService, WeatherService>
    with $Provider<WeatherService> {
  /// Provider for the concrete WeatherService implementation.
  /// Uses keepAlive to maintain the service instance in memory.
  const WeatherServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'weatherServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$weatherServiceHash();

  @$internal
  @override
  $ProviderElement<WeatherService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  WeatherService create(Ref ref) {
    return weatherService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WeatherService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WeatherService>(value),
    );
  }
}

String _$weatherServiceHash() => r'f64b692fbb2f04155e8b8b0c714117a93d1c7d4d';
