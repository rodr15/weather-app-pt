import 'package:riverpod/riverpod.dart';

/// The provider that creates and exposes the [SelectedDayIndexNotifier].
///
/// Widgets watch this provider to get the current day index.
final selectedDayIndexProvider =
    NotifierProvider<SelectedDayIndexNotifier, int>(
      SelectedDayIndexNotifier.new,
    );

/// A [Notifier] that holds the index of the currently selected forecast day.
///
/// The state is an [int], starting at 0 (today's forecast).
class SelectedDayIndexNotifier extends Notifier<int> {
  @override
  int build() {
    // Initial state is 0 (first day/today).
    return 0;
  }

  /// Sets the selected day index to a new [index].
  void setIndex(int index) {
    state = index;
  }

  /// Increments the index to show the next day.
  void nextDay() {
    state++;
  }

  /// Decrements the index to show the previous day.
  void previousDay() {
    state--;
  }
}
