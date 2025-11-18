import 'package:weather_app_pt/src/shared/domain/models/place.dart';

abstract class WeatherRepository {
  void savePlaceForecast(Place place);
  Place getLastPlaceForecast();
}
