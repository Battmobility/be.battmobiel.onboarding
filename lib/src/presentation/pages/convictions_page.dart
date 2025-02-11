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
    return Padding(
      padding: AppPaddings.large.trailing,
      child: SingleChildScrollView(
        child: FormBuilder(
          key: widget.formKey,
          child: Padding(
            padding: AppPaddings.medium.vertical,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(l10n.convictionsPageTitle,
                    style: Theme.of(context).textTheme.headlineLarge),
                Padding(
                  padding: AppPaddings.medium.vertical,
                  child: Text(l10n.convictionsPageMessage,
                      style: Theme.of(context).textTheme.titleMedium),
                ),
                FormBuilderCheckbox(
                    name: "convictionDrunk",
                    title: Text(l10n.convictionTypeDrunk,
                        style: Theme.of(context).textTheme.bodyLarge)),
                FormBuilderCheckbox(
                    name: "convictionIntoxicated",
                    title: Text(l10n.convictionTypeIntoxication,
                        style: Theme.of(context).textTheme.bodyLarge)),
                FormBuilderCheckbox(
                    name: "convictionBloodTestRefusal",
                    title: Text(l10n.convictionTypeTestRefusal,
                        style: Theme.of(context).textTheme.bodyLarge)),
                FormBuilderCheckbox(
                    name: "convictionHitAndRun",
                    title: Text(l10n.convictionTypeHitAndRun,
                        style: Theme.of(context).textTheme.bodyLarge)),
                FormBuilderCheckbox(
                    name: "convictionLicenseRevocation",
                    title: Text(l10n.convictionTypeLicenseRevocation,
                        style: Theme.of(context).textTheme.bodyLarge)),
                Padding(
                  padding:
                      AppPaddings.large.leading.add(AppPaddings.xsmall.leading),
                  child: Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: FormBuilderDropdown(
                            validator: FormBuilderValidators.required(),
                            name: "nrOfAccidents",
                            items: [0, 1, 2, 3, 4, 5]
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
                          child: Text(l10n.convictionTypeNoOfAccidents,
                              maxLines: 2,
                              style: Theme.of(context).textTheme.bodyLarge),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: AppSpacings.xxl),
                FormBuilderCheckbox(
                    name: "answeredTruthfully",
                    validator: FormBuilderValidators.isTrue(),
                    title: Text(l10n.convictionsPageFooter,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontWeight: FontWeight.bold))),
              ].map((child) => Flexible(child: child)).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
