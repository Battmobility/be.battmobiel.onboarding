import 'package:batt_onboarding/src/presentation/onboarding_landing_form.dart';
import 'package:flutter/material.dart';

Future<void> showOnboarding(
  BuildContext context,
  String accessToken,
  Function(Object) onAuthenticationError,
  Function(int) onStepStarted,
  Function(int) onStepCompleted,
  Function(bool) onSubmitted,
) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return OnboardingLandingForm(
        accessToken: accessToken,
        onAuthenticationError: onAuthenticationError,
        onStepStarted: onStepStarted,
        onStepCompleted: onStepCompleted,
        onSubmitted: onSubmitted,
      );
    },
  );
}
