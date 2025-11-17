/// Defines the possible types of weather events in the domain.
enum EventType {
  /// Indicates hail events.
  HAIL,
}

/// Represents an extreme weather event in the domain model.
class Event {
  /// Creates an [Event] instance.
  Event({
    this.datetime,
    this.datetimeEpoch,
    this.type,
    this.latitude,
    this.longitude,
    this.distance,
    this.desc,
    this.size,
  });

  /// Date and time of the event.
  final DateTime? datetime;

  /// Epoch time of the event.
  final int? datetimeEpoch;

  /// Type of the weather event.
  final EventType? type;

  /// Latitude of the event's location.
  final double? latitude;

  /// Longitude of the event's location.
  final double? longitude;

  /// Distance from the queried location.
  final double? distance;

  /// Description of the event.
  final String? desc;

  /// Size or magnitude of the event.
  final double? size;
}
