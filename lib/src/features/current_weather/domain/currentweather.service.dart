import 'package:weather_app_pt/src/shared/domain/models/place.dart';

abstract class WeatherService {
  Future<Place> getCurrentPlaceWeather();
}
