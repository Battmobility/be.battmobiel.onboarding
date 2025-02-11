import 'dart:io';

import 'package:batt_ds/batt_ds.dart';
import 'package:batt_onboarding/l10n/onboarding_localizations.dart';
import 'package:batt_onboarding/src/util/rrn_birthday_parser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../widgets/document_form_field.dart';
import 'onboarding_page.dart';

final class DocumentsPage extends OnboardingPage {
  DocumentsPage({
    super.key,
    required super.formKey,
    required super.onAction,
    super.initialData,
  });

  @override
  DocumentsPageState createState() => DocumentsPageState();
}

class DocumentsPageState extends State<DocumentsPage> {
  File? _driversLicenseFrontImage;
  File? _driversLicenseBackImage;
  File? _idCardFrontImage;
  File? _idCardBackImage;

  @override
  Widget build(BuildContext context) {
    final l10n = OnboardingLocalizations.of(context);
    return SingleChildScrollView(
      child: FormBuilder(
        key: widget.formKey,
        child: Column(
          children: [
            Column(
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
                  spacing: AppPaddings.small.size,
                  mainAxisSize: MainAxisSize.min,
                  direction: MediaQuery.of(context).size.width >
                          MediaQuery.of(context).size.height
                      ? Axis.horizontal
                      : Axis.vertical,
                  children: [
                    // FRONT
                    DocumentFormField(
                      fieldName: "idCardFront",
                      displayName: l10n.idCardFieldFront,
                      onDataFound: (rrn, surName, firstName) => {},
                      onPicked: (file) => _idCardFrontImage = file,
                    ),

                    DocumentFormField(
                      fieldName: "idCardBack",
                      displayName: l10n.idCardFieldBack,
                      onDataFound: (rrn, surName, firstName) =>
                          _updateFormData(rrn, surName, firstName),
                      onPicked: (file) => _idCardBackImage = file,
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: AppPaddings.xxsmall.vertical,
                  child: Text(l10n.driversLicenseFieldTitle,
                      style: context.typographyTheme.largeText),
                ),
                Flex(
                  spacing: AppPaddings.small.size,
                  mainAxisSize: MainAxisSize.min,
                  direction: MediaQuery.of(context).size.width >
                          MediaQuery.of(context).size.height
                      ? Axis.horizontal
                      : Axis.vertical,
                  children: [
                    // FRONT
                    DocumentFormField(
                      fieldName: "driversLicenseFront",
                      displayName: l10n.driversLicenseFieldFront,
                      onDataFound: (rrn, surName, firstName) =>
                          _updateFormData(null, null, null),
                      onPicked: (file) => _driversLicenseFrontImage = file,
                    ),
                    DocumentFormField(
                      fieldName: "driversLicenseBack",
                      displayName: l10n.driversLicenseFieldBack,
                      onDataFound: (rrn, surName, firstName) =>
                          _updateFormData(null, null, null),
                      onPicked: (file) => _driversLicenseBackImage = file,
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
            FormBuilderField(builder: ((_) => Container()), name: "rrn"),
            FormBuilderField(builder: ((_) => Container()), name: "lastname"),
            FormBuilderField(builder: ((_) => Container()), name: "firstname"),
            FormBuilderField(builder: ((_) => Container()), name: "birthdate"),
          ]
              .map((field) =>
                  Padding(padding: AppPaddings.medium.vertical, child: field))
              .toList(),
        ),
      ),
    );
  }

  void _updateFormData(String? rrn, String? surname, String? firstName) {
    rrn != null ? widget.formKey.currentState?.patchValue({"rrn": rrn}) : {};
    surname != null
        ? widget.formKey.currentState?.patchValue({"lastname": surname})
        : {};
    firstName != null
        ? widget.formKey.currentState?.patchValue({"firstname": firstName})
        : {};

    if (rrn != null) {
      final birthDate = RrnBirthdayParser.birthdayFromRrn(rrn);
      if (birthDate != null) {
        widget.formKey.currentState?.patchValue({"birthdate": birthDate});
      }
    }
  }
}
