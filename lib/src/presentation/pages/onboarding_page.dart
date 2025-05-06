import 'package:batt_onboarding/src/util/analytics/analytics_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

abstract base class OnboardingPage extends StatefulWidget {
  final GlobalKey<FormBuilderState> formKey;
  final Function(Map<String, String>) onAction;
  final AnalyticsAction analyticsAction;
  final Map<String, dynamic>? initialData;

  OnboardingPage(
      {super.key,
      required this.onAction,
      required this.analyticsAction,
      this.initialData,
      required this.formKey});
}
