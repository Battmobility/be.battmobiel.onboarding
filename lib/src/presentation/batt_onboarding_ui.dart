import 'package:batt_onboarding/src/presentation/onboarding_landing_form.dart';
import 'package:flutter/material.dart';

Future<void> showOnboarding({
  required String? apiUri,
  required BuildContext context,
  required String accessToken,
  required Function(Object) onAuthenticationError,
  required Function(bool) onSubmitted,
  Function(
    String name,
    String? action,
    int timeStamp,
    Map<String, dynamic>? data,
  )? onTrackEvent,
  Function(String name)? onTrackPageView,
}) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return OnboardingLandingForm(
        apiUri: apiUri,
        token: accessToken,
        onAuthenticationError: onAuthenticationError,
        onSubmitted: onSubmitted,
        onTrackEvent: onTrackEvent,
        onTrackPageView: onTrackPageView,
      );
    },
  );
}
