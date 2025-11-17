import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app_pt/src/env/env.dart';
import 'package:weather_app_pt/src/infrastructure/visual_crossing/config.dart';

class VisualCrossingApiClient {
  Future<String> getWeatherByLongitudeLatitude(
    String latitude,
    String longitude,
  ) async {
    return rootBundle.loadString(
      'assets/dummy_data/5_days_forecast.json',
    );
    final uri = Uri.parse(
      '${VisualCrossingConfig.baseUrl}/$latitude,$longitude?key=${Env.visualCrossingApiKey}&lang=es&unitGroup=metric',
    );

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
