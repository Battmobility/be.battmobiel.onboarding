import 'package:flutter/material.dart';

abstract base class OnboardingPage extends StatefulWidget {
  final Function(Map<String, String>) onValidated;
  final Map<String, String>? initialData;

  OnboardingPage({super.key, required this.onValidated, this.initialData});
}
