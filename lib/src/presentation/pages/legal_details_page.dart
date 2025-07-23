import 'package:batt_ds/batt_ds.dart';
import 'package:batt_onboarding/l10n/onboarding_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../util/analytics/analytics_events.dart';
import 'onboarding_page.dart';

final class LegalDetailsPage extends OnboardingPage {
  final Map<String, String> data = {};

  LegalDetailsPage({
    super.key,
    required super.formKey,
    required super.onAction,
    super.initialData,
    super.analyticsAction = AnalyticsAction.enterAccidents,
  });

  @override
  LegalDetailsPageState createState() => LegalDetailsPageState();
}

class LegalDetailsPageState extends State<LegalDetailsPage> {
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
                SizedBox(width: AppSpacings.lg),
                Row(
                  children: [
                    Flexible(
                      flex: 3,
                      child: Text(l10n.convictionTypeNoOfAccidents,
                          style: Theme.of(context).textTheme.bodyLarge),
                    ),
                    SizedBox(width: AppSpacings.sm),
                    Flexible(
                      flex: 1,
                      child: FormBuilderDropdown(
                          validator: FormBuilderValidators.required(),
                          name: "nrOfAccidents",
                          initialValue:
                              widget.initialData?["nrOfAccidents"] ?? 0,
                          items: [0, 1, 2, 3, 4, 5]
                              .map((value) => DropdownMenuItem(
                                    child: Text("$value"),
                                    value: value,
                                  ))
                              .toList()),
                    ),
                  ],
                ),
                Divider(),
                Text(l10n.convictionsPageSubtitle,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.bold)),
                SizedBox(height: AppSpacings.sm),
                FormBuilderCheckbox(
                    name: "convictionDrunk",
                    initialValue:
                        widget.initialData?["convictionDrunk"] ?? false,
                    title: Text(l10n.convictionTypeDrunk,
                        style: Theme.of(context).textTheme.bodyLarge)),
                FormBuilderCheckbox(
                    name: "convictionIntoxicated",
                    initialValue:
                        widget.initialData?["convictionIntoxicated"] ?? false,
                    title: Text(l10n.convictionTypeIntoxication,
                        style: Theme.of(context).textTheme.bodyLarge)),
                FormBuilderCheckbox(
                    name: "convictionBloodTestRefusal",
                    initialValue:
                        widget.initialData?["convictionBloodTestRefusal"] ??
                            false,
                    title: Text(l10n.convictionTypeTestRefusal,
                        style: Theme.of(context).textTheme.bodyLarge)),
                FormBuilderCheckbox(
                    name: "convictionHitAndRun",
                    initialValue:
                        widget.initialData?["convictionHitAndRun"] ?? false,
                    title: Text(l10n.convictionTypeHitAndRun,
                        style: Theme.of(context).textTheme.bodyLarge)),
                FormBuilderCheckbox(
                    name: "convictionLicenseRevocation",
                    initialValue:
                        widget.initialData?["convictionLicenseRevocation"] ??
                            false,
                    title: Text(l10n.convictionTypeLicenseRevocation,
                        style: Theme.of(context).textTheme.bodyLarge)),
                SizedBox(height: AppSpacings.xxl),
                FormBuilderCheckbox(
                    name: "answeredTruthfully",
                    initialValue: false,
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
