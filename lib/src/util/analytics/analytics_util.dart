import 'analytics_events.dart';

class Analyticsutil {
  Function(
    String name,
    String? action,
    int timeStamp,
    Map<String, dynamic>? data,
  )? _onTrackEvent;
  Function(String)? onTrackPageView;
  DateTime? _startedAt;

  Analyticsutil._internal();

  static void init({
    required Function(
      String name,
      String? action,
      int timeStamp,
      Map<String, dynamic>? data,
    )? onTrackEvent,
    required Function(String)? onTrackPageView,
  }) {
    instance._onTrackEvent = onTrackEvent;
    instance.onTrackPageView = onTrackPageView;
    instance._startedAt = DateTime.now();
  }

  static final Analyticsutil instance = Analyticsutil._internal();

  static void start() {
    instance._startedAt ??= DateTime.now();
  }

  factory Analyticsutil(
      Function(
        String name,
        String? action,
        int timeStamp,
        Map<String, dynamic>? data,
      )? onTrackEvent,
      Function(String name)? onTrackPageView) {
    return instance;
  }

  static void trackEvent(
      {required AnalyticsEvent event,
      String? action,
      Map<String, dynamic>? eventParams}) {
    if (instance._onTrackEvent != null) {
      final timeStamp = instance._startedAt != null
          ? DateTime.now().difference(instance._startedAt!).inSeconds
          : -1;
      instance._onTrackEvent!(event.name, action, timeStamp, eventParams);
    }
  }

  static void trackPageView(String name) {
    if (instance.onTrackPageView != null) {
      instance.onTrackPageView!(name);
    }
  }
}
