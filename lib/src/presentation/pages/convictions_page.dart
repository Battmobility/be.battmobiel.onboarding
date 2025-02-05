import 'package:batt_ds/batt_ds.dart';
import 'package:batt_onboarding/l10n/onboarding_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'onboarding_page.dart';

final class ConvictionsPage extends OnboardingPage {
  final Map<String, String> initialData = {};
  final Map<String, String> data = {};

  ConvictionsPage({
    super.key,
    required super.onValidated,
    super.initialData,
  });

  @override
  ConvictionsPageState createState() => ConvictionsPageState();
}

class ConvictionsPageState extends State<ConvictionsPage> {
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
            final stringData = data.entries
                .map((entry) => MapEntry(entry.key, entry.value.toString()));
            final mapData = Map.fromEntries(stringData);
            // TODO: don't validate if answeredTruthfully = false

            widget.onValidated(mapData);
          }
        },
        child: Padding(
          padding: AppPaddings.medium.all,
          child: Column(
            children: [
              Text(l10n.convictionsPageTitle,
                  style: context.typographyTheme.largeTitle),
              Padding(
                padding: AppPaddings.medium.vertical,
                child: Text(l10n.convictionsPageMessage,
                    style: context.typographyTheme.largeText),
              ),
              FormBuilderCheckbox(
                  name: "ConvictionDrunk",
                  title: Text(l10n.convictionTypeDrunk,
                      style: context.typographyTheme.defaultText)),
              FormBuilderCheckbox(
                  name: "ConvictionIntoxicated",
                  title: Text(l10n.convictionTypeIntoxication,
                      style: context.typographyTheme.defaultText)),
              FormBuilderCheckbox(
                  name: "ConvictionBloodTestRefusal",
                  title: Text(l10n.convictionTypeTestRefusal,
                      style: context.typographyTheme.defaultText)),
              FormBuilderCheckbox(
                  name: "ConvictionHitAndRun",
                  title: Text(l10n.convictionTypeHitAndRun,
                      style: context.typographyTheme.defaultText)),
              FormBuilderCheckbox(
                  name: "ConvictionLicenseRevocation",
                  title: Text(l10n.convictionTypeLicenseRevocation,
                      style: context.typographyTheme.defaultText)),
              Spacer(),
              FormBuilderCheckbox(
                  name: "answeredTruthfully",
                  validator: FormBuilderValidators.isTrue(),
                  title: Text(l10n.convictionsPageFooter,
                      style: context.typographyTheme.defaultText))
            ].map((child) => Flexible(child: child)).toList(),
          ),
        ),
      ),
    );
  }
}
