import 'package:batt_ds/batt_ds.dart';
import 'package:batt_onboarding/l10n/onboarding_localizations.dart';
import 'package:batt_onboarding/src/util/rrn_birthday_parser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../widgets/document_form_field.dart';
import 'onboarding_page.dart';

final class DriversLicensePage extends OnboardingPage {
  final bool prefilled;
  DriversLicensePage({
    super.key,
    required super.formKey,
    required super.onAction,
    required this.prefilled,
    super.initialData,
  });

  @override
  DriversLicensePageState createState() => DriversLicensePageState();
}

class DriversLicensePageState extends State<DriversLicensePage> {
  @override
  Widget build(BuildContext context) {
    final l10n = OnboardingLocalizations.of(context);
    return SingleChildScrollView(
      child: Padding(
        padding: AppPaddings.large.trailing,
        child: FormBuilder(
          key: widget.formKey,
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l10n.documentsPageTitle,
                      style: Theme.of(context).textTheme.headlineLarge),
                  Padding(
                    padding: AppPaddings.medium.vertical,
                    child: Text(l10n.documentsPageMessage,
                        style: Theme.of(context).textTheme.titleMedium),
                  ),
                  Padding(
                    padding: AppPaddings.xxsmall.vertical,
                    child: Text(l10n.idCardFieldTitle,
                        style: context.typographyTheme.largeText),
                  ),
                  Flex(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: AppSpacings.md,
                    direction: MediaQuery.of(context).size.width >
                            MediaQuery.of(context).size.height
                        ? Axis.horizontal
                        : Axis.vertical,
                    children: [
                      // FRONT
                      DocumentFormField(
                        fieldName: "frontId",
                        displayName: l10n.idCardFieldFront,
                        prefilled: widget.prefilled,
                        onDataFound: (rrn, surName, firstName) => {},
                      ),

                      DocumentFormField(
                        fieldName: "backId",
                        displayName: l10n.idCardFieldBack,
                        prefilled: widget.prefilled,
                        onDataFound: (rrn, surName, firstName) =>
                            _updateFormData(rrn, surName, firstName),
                      ),
                    ].map((child) {
                      return Flexible(child: child);
                    }).toList(),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: AppPaddings.xxsmall.vertical,
                    child: Text(l10n.driversLicenseFieldTitle,
                        style: context.typographyTheme.largeText),
                  ),
                  Flex(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: AppSpacings.md,
                    direction: MediaQuery.of(context).size.width >
                            MediaQuery.of(context).size.height
                        ? Axis.horizontal
                        : Axis.vertical,
                    children: [
                      // FRONT
                      DocumentFormField(
                        fieldName: "frontDriverLicense",
                        displayName: l10n.driversLicenseFieldFront,
                        prefilled: widget.prefilled,
                        onDataFound: (rrn, surName, firstName) =>
                            _updateFormData(null, null, null),
                      ),
                      DocumentFormField(
                        fieldName: "backDriverLicense",
                        displayName: l10n.driversLicenseFieldBack,
                        prefilled: widget.prefilled,
                        onDataFound: (rrn, surName, firstName) =>
                            _updateFormData(null, null, null),
                      ),
                    ].map((child) {
                      return MediaQuery.of(context).size.width >
                              MediaQuery.of(context).size.height
                          ? Flexible(child: child)
                          : Flexible(child: child);
                    }).toList(),
                  ),
                ],
              ),
              // Invisible, just to pass data
              FormBuilderField(
                  builder: ((_) => Container()), name: "socialSecurityNumber"),
              FormBuilderField(builder: ((_) => Container()), name: "lastName"),
              FormBuilderField(
                  builder: ((_) => Container()), name: "firstName"),
              FormBuilderField(
                  builder: ((_) => Container()), name: "dateOfBirth"),
            ]
                .map((field) =>
                    Padding(padding: AppPaddings.medium.vertical, child: field))
                .toList(),
          ),
        ),
      ),
    );
  }

  void _updateFormData(String? rrn, String? surname, String? firstName) {
    rrn != null
        ? widget.formKey.currentState?.patchValue({"socialSecurityNumber": rrn})
        : {};
    surname != null
        ? widget.formKey.currentState?.patchValue({"lastName": surname})
        : {};
    firstName != null
        ? widget.formKey.currentState?.patchValue({"firstName": firstName})
        : {};

    if (rrn != null) {
      final birthDate = RrnBirthdayParser.birthdayFromRrn(rrn);
      if (birthDate != null) {
        widget.formKey.currentState?.patchValue({"dateOfBirth": birthDate});
      }
    }
  }
}
