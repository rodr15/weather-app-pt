// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_data.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Fetches the current weather for a fixed location.
/// This returns an AsyncValue<Place> which handles loading and error states.

@ProviderFor(currentPlaceWeather)
const currentPlaceWeatherProvider = CurrentPlaceWeatherProvider._();

/// Fetches the current weather for a fixed location.
/// This returns an AsyncValue<Place> which handles loading and error states.

final class CurrentPlaceWeatherProvider
    extends $FunctionalProvider<AsyncValue<Place>, Place, FutureOr<Place>>
    with $FutureModifier<Place>, $FutureProvider<Place> {
  /// Fetches the current weather for a fixed location.
  /// This returns an AsyncValue<Place> which handles loading and error states.
  const CurrentPlaceWeatherProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentPlaceWeatherProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentPlaceWeatherHash();

  @$internal
  @override
  $FutureProviderElement<Place> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Place> create(Ref ref) {
    return currentPlaceWeather(ref);
  }
}

String _$currentPlaceWeatherHash() =>
    r'eeb3ecc4556843bcbec76d7e5a98f67fcfb5215c';
