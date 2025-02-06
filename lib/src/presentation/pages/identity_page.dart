import 'package:batt_ds/batt_ds.dart';
import 'package:batt_onboarding/l10n/onboarding_localizations.dart';
import 'package:batt_onboarding/src/presentation/widgets/image_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

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
            Text(l10n.convictionsPageTitle,
                style: context.typographyTheme.largeTitle),
            Padding(
              padding: AppPaddings.medium.vertical,
              child: Text(l10n.convictionsPageMessage,
                  style: context.typographyTheme.largeText),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width / 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ImagePickerWidget(onPicked: (_) => {}),
                  Spacer(),
                  ImagePickerWidget(onPicked: (_) => {}),
                ],
              ),
            ),
            FormBuilderTextField(
              name: 'firstname',
              validator: FormBuilderValidators.firstName(),
              decoration: InputDecoration(labelText: l10n.firstNameFieldTitle),
            ),
            FormBuilderTextField(
              name: 'lastname',
              validator: FormBuilderValidators.lastName(),
              decoration: InputDecoration(labelText: l10n.lastNameFieldTitle),
            ),
            FormBuilderTextField(
              name: 'email',
              validator: FormBuilderValidators.email(),
              decoration: InputDecoration(labelText: l10n.emailFieldTitle),
            ),
            FormBuilderTextField(
              name: 'phone',
              validator: FormBuilderValidators.phoneNumber(),
              decoration: InputDecoration(labelText: l10n.phoneFieldTitle),
            ),
          ]
              .map((field) =>
                  Padding(padding: AppPaddings.medium.vertical, child: field))
              .toList(),
        ),
      ),
    );
  }
}
