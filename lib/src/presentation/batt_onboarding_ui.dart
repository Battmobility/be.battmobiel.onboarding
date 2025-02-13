import 'package:batt_onboarding/src/presentation/onboarding_landing_form.dart';
import 'package:flutter/material.dart';

Future<void> showOnboarding({
  required BuildContext context,
  required String accessToken,
  required Function(Object) onAuthenticationError,
  required Function(bool) onSubmitted,
}) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return OnboardingLandingForm(
        accessToken: accessToken,
        onAuthenticationError: onAuthenticationError,
        onSubmitted: onSubmitted,
      );
    },
  );
}
