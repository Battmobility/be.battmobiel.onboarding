import 'package:batt_ds/batt_ds.dart';
import 'package:batt_onboarding/l10n/onboarding_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../util/analytics/analytics_events.dart';
import 'onboarding_page.dart';

final class LegalPage extends OnboardingPage {
  final Map<String, String> data = {};

  LegalPage({
    super.key,
    required super.formKey,
    required super.onAction,
    super.initialData,
    super.analyticsAction = AnalyticsAction.enterConvictions,
  });

  @override
  LegalPageState createState() => LegalPageState();
}

class LegalPageState extends State<LegalPage> {
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
                            initialValue:
                                widget.initialData?["nrOfAccidents"] ?? 0,
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
              ].map((child) => Flexible(child: child)).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
