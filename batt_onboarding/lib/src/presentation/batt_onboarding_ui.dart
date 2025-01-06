import 'package:batt_onboarding/src/presentation/onboarding_landing_form.dart';
import 'package:flutter/material.dart';

Future<void> showOnboarding(BuildContext context) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      // TODO: wrapper with cancel buttons etc
      return OnboardingLandingForm();
    },
  );
}
