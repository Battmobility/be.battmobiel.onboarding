import 'package:batt_ds/batt_ds.dart';
import 'package:batt_onboarding/l10n/onboarding_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'onboarding_page.dart';

final class PickFormulaPage extends OnboardingPage {
  PickFormulaPage({
    super.key,
    required super.formKey,
    required super.onAction,
    super.initialData,
  });

  @override
  PickformulaPageState createState() => PickformulaPageState();
}

class PickformulaPageState extends State<PickFormulaPage> {
  @override
  Widget build(BuildContext context) {
    final l10n = OnboardingLocalizations.of(context);
    return Padding(
      padding: AppPaddings.large.trailing,
      child: SingleChildScrollView(
        child: FormBuilder(
          key: widget.formKey,
          child: Padding(
            padding: AppPaddings.medium.vertical,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(l10n.convictionsPageTitle,
                    style: Theme.of(context).textTheme.headlineLarge),
                Padding(
                  padding: AppPaddings.medium.vertical,
                  child: Text(l10n.convictionsPageMessage,
                      style: Theme.of(context).textTheme.titleMedium),
                ),
              ].map((child) => Flexible(child: child)).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
