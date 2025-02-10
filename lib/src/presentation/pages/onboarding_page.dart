import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

abstract base class OnboardingPage extends StatefulWidget {
  final GlobalKey<FormBuilderState> formKey;
  final Function(Map<String, String>) onAction;
  final Map<String, dynamic>? initialData;

  OnboardingPage(
      {super.key,
      required this.onAction,
      this.initialData,
      required this.formKey});
}
