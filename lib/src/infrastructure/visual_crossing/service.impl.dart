import 'dart:convert' as convert;

import 'package:weather_app_pt/src/features/current_weather/domain/currentweather.service.dart';
import 'package:weather_app_pt/src/infrastructure/visual_crossing/client.dart';
import 'package:weather_app_pt/src/infrastructure/visual_crossing/dto.dart';
import 'package:weather_app_pt/src/infrastructure/visual_crossing/dto.mapper.dart';
import 'package:weather_app_pt/src/shared/domain/models/place.dart';

class WeatherServiceImpl implements WeatherService {
  @override
  Future<Place> getCurrentPlaceWeather() async {
    try {
      final json = await VisualCrossingApiClient().getWeather('London');
      final jsonResponse = convert.jsonDecode(json) as Map<String, dynamic>;
      final dto = WeatherDto.fromJson(jsonResponse);
      return dto.toPlace();
    } catch (e) {
      throw Exception("Couldn't get the data");
    }
  }
}
