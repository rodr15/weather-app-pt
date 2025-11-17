import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app_pt/src/features/current_weather/application/daily_forecasts.provider.dart';
import 'package:weather_app_pt/src/features/current_weather/application/selected_day_index.provider.dart';
import 'package:weather_app_pt/src/features/current_weather/components/daily_datils_card.dart';
import 'package:weather_app_pt/src/features/current_weather/components/dot.dart';

/// This watches the [dailyForecastsProvider] for the data and synchronizes
/// the current page index with the [selectedDayIndexProvider].
class DailyForecastsPageView extends ConsumerStatefulWidget {
  /// Creates a page view for navigating through daily forecasts.
  const DailyForecastsPageView({super.key});

  @override
  ConsumerState<DailyForecastsPageView> createState() =>
      _DailyForecastsPageViewState();
}

class _DailyForecastsPageViewState
    extends ConsumerState<DailyForecastsPageView> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    // Initialize controller with the current state from the provider
    final initialIndex = ref.read(selectedDayIndexProvider);
    _pageController = PageController(initialPage: initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  /// Callback executed when the user manually changes the page (swiping).
  void _onPageChanged(int newIndex) {
    // 1. Update the Riverpod state whenever the page changes.
    // This action changes the 'selectedDayIndexProvider' for the entire app.
    ref.read(selectedDayIndexProvider.notifier).setIndex(newIndex);
  }

  @override
  Widget build(BuildContext context) {
    final forecastsAsyncValue = ref.watch(dailyForecastsProvider);
    final selectedIndex = ref.watch(selectedDayIndexProvider);

    if (_pageController.hasClients && _pageController.page != selectedIndex) {
      _pageController.animateToPage(
        selectedIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }

    return forecastsAsyncValue.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) =>
          Center(child: Text('Error loading data: $error')),
      data: (forecasts) {
        if (forecasts.isEmpty) {
          return const Center(child: Text('No forecast data available.'));
        }

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: SizedBox(
                height: 600,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: forecasts.length,
                  onPageChanged: _onPageChanged,
                  itemBuilder: (context, index) {
                    final dayForecast = forecasts[index];
                    return DailyDetailsCard(forecast: dayForecast);
                  },
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  forecasts.length,
                  (index) => Dot(
                    selected: index == selectedIndex,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
