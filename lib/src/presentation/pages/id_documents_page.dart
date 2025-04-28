import 'package:batt_ds/batt_ds.dart';
import 'package:batt_onboarding/l10n/onboarding_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../widgets/document_form_field.dart';
import 'onboarding_page.dart';

final class IdDocumentsPage extends OnboardingPage {
  final bool prefilled;
  IdDocumentsPage({
    super.key,
    required super.formKey,
    required super.onAction,
    required this.prefilled,
    super.initialData,
  });

  @override
  IdDocumentsPageState createState() => IdDocumentsPageState();
}

class IdDocumentsPageState extends State<IdDocumentsPage> {
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
                  Text(l10n.idDocumentsPageTitle,
                      style: Theme.of(context).textTheme.headlineLarge),
                  Padding(
                    padding: AppPaddings.medium.vertical,
                    child: Text(l10n.idDocumentsPageMessage,
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
                          onDataFound: (_, __, ___) => {}),

                      DocumentFormField(
                          fieldName: "backId",
                          displayName: l10n.idCardFieldBack,
                          prefilled: widget.prefilled,
                          onDataFound: (_, __, ___) => {}),
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
                          onDataFound: (_, __, ___) => {}),
                      DocumentFormField(
                          fieldName: "backDriverLicense",
                          displayName: l10n.driversLicenseFieldBack,
                          prefilled: widget.prefilled,
                          onDataFound: (_, __, ___) => {}),
                    ].map((child) {
                      return MediaQuery.of(context).size.width >
                              MediaQuery.of(context).size.height
                          ? Flexible(child: child)
                          : Flexible(child: child);
                    }).toList(),
                  ),
                ],
              ),
            ]
                .map((field) =>
                    Padding(padding: AppPaddings.medium.vertical, child: field))
                .toList(),
          ),
        ),
      ),
    );
  }
}
