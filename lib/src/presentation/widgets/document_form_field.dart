import 'package:batt_ds/batt_ds.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:batt_onboarding/l10n/onboarding_localizations.dart';
import 'package:image_picker/image_picker.dart';

import 'image_picker_widget.dart';

final class DocumentFormField extends StatelessWidget {
  final String fieldName;
  final String displayName;
  final bool prefilled;
  final Function(String? rrn, String? surName, String? firstName) onDataFound;

  DocumentFormField({
    required this.fieldName,
    required this.displayName,
    required this.onDataFound,
    required this.prefilled,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<XFile>(
      name: fieldName,
      validator: prefilled ? null : FormBuilderValidators.required(),
      builder: (field) => Padding(
        padding: AppPaddings.medium.top,
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: displayName,
            labelStyle: context.typographyTheme.largeText,
            contentPadding: AppPaddings.small.vertical,
            errorText: (field.value == null && !prefilled)
                ? OnboardingLocalizations.of(context).identityPageFileRequired
                : null,
          ),
          child: AspectRatio(
            aspectRatio: 1.586,
            child: ImagePickerWidget(
              onPicked: (file) {
                field.didChange(file);
              },
              onDataFound: (rrn, surName, givenName) =>
                  onDataFound(rrn, surName, givenName),
            ),
          ),
        ),
      ),
    );
  }
}
