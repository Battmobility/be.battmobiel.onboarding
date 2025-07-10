import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:matomo_tracker/matomo_tracker.dart';

class MatomoTracking {
  static bool _initialized = false;
  
  static Future<void> init({
    required String matomoUrl,
    required String siteId,
  }) async {
    if (kIsWeb && !_initialized) {
      await MatomoTracker.instance.initialize(
        siteId: siteId,
        url: matomoUrl,
      );
      _initialized = true;
    }
  }
  
  static void trackEvent({
    required String name,
    required String? action,
    required int timeStamp,
    Map<String, dynamic>? data,
  }) {
    if (!kIsWeb || !_initialized) return;
    
    MatomoTracker.instance.trackEvent(
      eventInfo: EventInfo(
        category: name,
        action: action ?? 'unknown',
        name: action,
        value: timeStamp,
      ),
    );
  }
  
  static void trackPageView(String name, {BuildContext? context}) {
    if (!kIsWeb || !_initialized) return;
    
    if (context != null) {
      MatomoTracker.instance.trackPageView(
        context: context,
      );
    } else {
      // Use trackEvent as an alternative for page views without context
      MatomoTracker.instance.trackEvent(
        eventInfo: EventInfo(
          category: 'page-view',
          action: name,
        ),
      );
    }
  }
}