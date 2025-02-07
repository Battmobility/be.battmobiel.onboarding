import 'dart:io';

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
  File? _driversLicenseFrontImage;
  File? _driversLicenseBackImage;
  File? _idCardFrontImage;
  File? _idCardBackImage;

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
            Text(l10n.identityPageTitle,
                style: context.typographyTheme.largeTitle),
            Padding(
              padding: AppPaddings.medium.vertical,
              child: Text(l10n.identityPageMessage,
                  style: context.typographyTheme.largeText),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: AppPaddings.small.vertical,
                          child: Text(l10n.idCardFieldFront,
                              style: context.typographyTheme.largeText),
                        ),
                        AspectRatio(
                          aspectRatio: 1.586,
                          child: ImagePickerWidget(
                            onPicked: (file) => {_idCardFrontImage = file},
                            onDataFound: null,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: AppPaddings.small.vertical,
                          child: Text(l10n.idCardFieldBack,
                              style: context.typographyTheme.largeText),
                        ),
                        AspectRatio(
                          aspectRatio: 1.586,
                          child: ImagePickerWidget(
                            onPicked: (file) => {_idCardBackImage = file},
                            onDataFound: (rrn, surName, firstName, _) =>
                                _updateFormData(rrn, surName, firstName, null),
                          ),
                        ),
                      ],
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
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: AppPaddings.small.vertical,
                          child: Text(l10n.driversLicenseFieldFront,
                              style: context.typographyTheme.largeText),
                        ),
                        AspectRatio(
                          aspectRatio: 1.586,
                          child: ImagePickerWidget(
                            onPicked: (file) =>
                                {_driversLicenseFrontImage = file},
                            onDataFound: (_, __, ___, licenseNumber) =>
                                _updateFormData(
                                    null, null, null, licenseNumber),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: AppPaddings.small.vertical,
                          child: Text(l10n.driversLicenseFieldBack,
                              style: context.typographyTheme.largeText),
                        ),
                        AspectRatio(
                          aspectRatio: 1.586,
                          child: ImagePickerWidget(
                            onPicked: (file) =>
                                {_driversLicenseBackImage = file},
                            onDataFound: (_, __, ___, licenseNumber) =>
                                _updateFormData(
                                    null, null, null, licenseNumber),
                          ),
                        ),
                      ],
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
              name: 'rrn',
              validator: FormBuilderValidators.numeric(),
              decoration: InputDecoration(labelText: l10n.rrnFieldTitle),
            ),
          ]
              .map((field) =>
                  Padding(padding: AppPaddings.medium.vertical, child: field))
              .toList(),
        ),
      ),
    );
  }

  void _updateFormData(
      String? rrn, String? surname, String? firstName, String? licenseNumber) {
    rrn != null ? _formKey.currentState?.patchValue({"rrn": rrn}) : {};
    surname != null
        ? _formKey.currentState?.patchValue({"lastname": surname})
        : {};
    firstName != null
        ? _formKey.currentState?.patchValue({"firstname": firstName})
        : {};
    licenseNumber != null
        ? _formKey.currentState?.patchValue({"licensenumber": firstName})
        : {};
  }
}
