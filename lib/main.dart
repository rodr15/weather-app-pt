import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app_pt/src/features/current_weather/current_weather.page.dart'; // <--- 1. Import Riverpod

void main() {
  // 2. Wrap the root of your app with ProviderScope
  runApp(
    const ProviderScope(
      child:
          MainApp(), // Replace MyApp with the name of your main MaterialApp/CupertinoApp widget
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: CurrentWeather()),
    );
  }
}
