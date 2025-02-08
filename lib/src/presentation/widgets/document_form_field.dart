import 'dart:io';

import 'package:batt_ds/batt_ds.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:batt_onboarding/l10n/onboarding_localizations.dart';

import 'image_picker_widget.dart';

final class DocumentFormField extends StatelessWidget {
  final String fieldName;
  final String displayName;

  final Function(File) onPicked;
  final Function(String? rrn, String? surName, String? firstName,
      String? licenseNumber) onDataFound;

  DocumentFormField({
    required this.fieldName,
    required this.displayName,
    required this.onPicked,
    required this.onDataFound,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<File>(
      name: fieldName,
      autovalidateMode: AutovalidateMode.onUnfocus,
      validator: FormBuilderValidators.required(),
      builder: (field) => Padding(
        padding: AppPaddings.medium.top,
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: displayName,
            labelStyle: context.typographyTheme.largeText,
            contentPadding: AppPaddings.small.vertical,
            errorText: field.value == null
                ? OnboardingLocalizations.of(context).identityPageFileRequired
                : null,
          ),
          child: AspectRatio(
            aspectRatio: 1.586,
            child: ImagePickerWidget(
              onPicked: (file) {
                field.didChange(file);
                if (file != null) {
                  onPicked(file);
                }
              },
              onDataFound: (rrn, surName, givenName, licenseNumber) =>
                  onDataFound(rrn, surName, givenName, licenseNumber),
            ),
          ),
        ),
      ),
    );
  }
}
