import 'package:http/http.dart' as http;
import 'package:weather_app_pt/src/env/env.dart';
import 'package:weather_app_pt/src/infrastructure/visual_crossing/config.dart';

class VisualCrossingApiClient {
  Future<String> getWeather(String city) async {
    final uri = Uri.parse(
      '${VisualCrossingConfig.baseUrl}/$city/last30days?key=${Env.visualCrossingApiKey}',
    );

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
