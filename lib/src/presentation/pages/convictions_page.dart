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
    required super.onAction,
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
                  name: "convictionDrunk",
                  title: Text(l10n.convictionTypeDrunk,
                      style: context.typographyTheme.defaultText)),
              FormBuilderCheckbox(
                  name: "convictionIntoxicated",
                  title: Text(l10n.convictionTypeIntoxication,
                      style: context.typographyTheme.defaultText)),
              FormBuilderCheckbox(
                  name: "convictionBloodTestRefusal",
                  title: Text(l10n.convictionTypeTestRefusal,
                      style: context.typographyTheme.defaultText)),
              FormBuilderCheckbox(
                  name: "convictionHitAndRun",
                  title: Text(l10n.convictionTypeHitAndRun,
                      style: context.typographyTheme.defaultText)),
              FormBuilderCheckbox(
                  name: "convictionLicenseRevocation",
                  title: Text(l10n.convictionTypeLicenseRevocation,
                      style: context.typographyTheme.defaultText)),
              Padding(
                padding:
                    AppPaddings.large.leading.add(AppPaddings.xsmall.leading),
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: FormBuilderDropdown(
                          name: "nrOfAccidents",
                          items: [1, 2, 3, 4, 5]
                              .map((value) => DropdownMenuItem(
                                    child: Text("$value"),
                                    value: value,
                                  ))
                              .toList()),
                    ),
                    Flexible(
                        flex: 5,
                        child: Padding(
                          padding: AppPaddings.xlarge.leading
                              .add(AppPaddings.small.horizontal),
                          child: Text(
                            l10n.convictionTypeNoOfAccidents,
                            maxLines: 2,
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(height: AppSpacings.xxl),
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
