import 'package:batt_ds/batt_ds.dart';
import 'package:batt_onboarding/l10n/onboarding_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'onboarding_page.dart';

final class ConvictionsPage extends OnboardingPage {
  final Map<String, String> data = {};

  ConvictionsPage({
    super.key,
    required super.formKey,
    required super.onValidated,
    super.initialData,
  });

  @override
  ConvictionsPageState createState() => ConvictionsPageState();
}

class ConvictionsPageState extends State<ConvictionsPage> {
  @override
  Widget build(BuildContext context) {
    final l10n = OnboardingLocalizations.of(context);
    return SingleChildScrollView(
      child: FormBuilder(
        key: widget.formKey,
        child: Padding(
          padding: AppPaddings.medium.all,
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
              SizedBox(height: AppSpacings.xl),
              FormBuilderCheckbox(
                  name: "answeredTruthfully",
                  validator: FormBuilderValidators.isTrue(),
                  title: Text(l10n.convictionsPageFooter,
                      style: context.typographyTheme.defaultText
                          .copyWith(fontWeight: FontWeight.bold))),
            ].map((child) => Flexible(child: child)).toList(),
          ),
        ),
      ),
    );
  }
}
