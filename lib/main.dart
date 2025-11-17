import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app_pt/l10n/app_localizations.dart';
import 'package:weather_app_pt/src/features/current_weather/current_weather.page.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: CurrentWeather()),
      localizationsDelegates: [AppLocalizations.delegate],
      supportedLocales: [
        Locale('en', ''),
        Locale('es', ''),
      ],
    );
  }
}
