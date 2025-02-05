import 'package:batt_onboarding/l10n/onboarding_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'onboarding_page.dart';

final class IdentityPage extends OnboardingPage {
  IdentityPage({
    super.key,
    required super.onValidated,
    super.initialData,
  });

  @override
  IdentityPageState createState() => IdentityPageState();
}

class IdentityPageState extends State<IdentityPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final l10n = OnboardingLocalizations.of(context);
    return SingleChildScrollView(
      child: FormBuilder(
        key: _formKey,
        onChanged: () {
          if (_formKey.currentState!.validate()) {
            final data = _formKey.currentState!.value as Map<String, String>;
            widget.onValidated(data);
          }
        },
        child: Column(
          children: [
            // TODO: scan id
            FormBuilderTextField(
              name: 'firstname',
              decoration: InputDecoration(labelText: l10n.firstNameFieldTitle),
            ),
            FormBuilderTextField(
              name: 'lastname',
              decoration: InputDecoration(labelText: l10n.lastNameFieldTitle),
            ),
            FormBuilderTextField(
              name: 'email',
              decoration: InputDecoration(labelText: l10n.emailFieldTitle),
            ),
          ],
        ),
      ),
    );
  }
}
