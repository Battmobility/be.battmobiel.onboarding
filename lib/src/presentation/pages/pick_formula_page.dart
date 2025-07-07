import 'package:batt_ds/batt_ds.dart';
import 'package:batt_onboarding/l10n/onboarding_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../util/analytics/analytics_events.dart';
import 'onboarding_page.dart';

final class PickFormulaPage extends OnboardingPage {
  PickFormulaPage({
    super.key,
    required super.formKey,
    required super.onAction,
    super.initialData,
    super.analyticsAction = AnalyticsAction.pickFormula,
  });

  @override
  PickformulaPageState createState() => PickformulaPageState();
}

class PickformulaPageState extends State<PickFormulaPage> {
  SubscriptionType subscriptionType = SubscriptionType.battFan;

  @override
  Widget build(BuildContext context) {
    final l10n = OnboardingLocalizations.of(context);
    return Padding(
      padding: AppPaddings.large.trailing,
      child: FormBuilder(
        key: widget.formKey,
        child: Padding(
          padding: AppPaddings.medium.vertical,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(l10n.createContractPickFormulaLabel,
                    style: Theme.of(context).textTheme.headlineLarge),
                Padding(
                  padding: AppPaddings.large.vertical,
                  child: FormBuilderField<String>(
                    name: "formula",
                    initialValue: subscriptionType.name,
                    builder: (field) => SegmentedButton(
                      showSelectedIcon: false,
                      segments: [ // TODO: cupertino picker like bookings in app
                        ButtonSegment(
                          value: SubscriptionType.battFun,
                          label: Text(SubscriptionType.battFun.description),
                        ),
                        ButtonSegment(
                          value: SubscriptionType.battFan,
                          label: Text(SubscriptionType.battFan.description),
                        ),
                        ButtonSegment(
                          value: SubscriptionType.battMax,
                          label: Text(SubscriptionType.battMax.description),
                        ),
                      ],
                      selected: {subscriptionType},
                      onSelectionChanged: (type) {
                        setState(() {
                          subscriptionType = type.first;
                          field.didChange(type.first.description);
                        });
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: AppPaddings.medium.top,
                  child: _subscriptionExplainer(subscriptionType, context),
                ),
                (subscriptionType == SubscriptionType.battFan)
                    ? _battFanFooter(context)
                    : SizedBox(
                        height: MediaQuery.of(context).size.height / 10,
                      ),
                FormBuilderField<int>(
                  builder: ((_) => Container()),
                  name: "clientId",
                  initialValue: widget.initialData?["clientId"],
                ),
              ].map((child) => Flexible(child: child)).toList(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _subscriptionExplainer(SubscriptionType type, BuildContext context) {
    final l10n = OnboardingLocalizations.of(context);

    switch (type) {
      case SubscriptionType.battFun:
        return Text(
          l10n.createContractFormulaBattFunExplanation,
          style: Theme.of(context).textTheme.labelLarge,
          maxLines: 3,
          textAlign: TextAlign.center,
        );
      case SubscriptionType.battFan:
        return Text(
          l10n.createContractFormulaBattFanExplanation,
          style: Theme.of(context).textTheme.labelLarge,
          maxLines: 3,
          textAlign: TextAlign.center,
        );
      case SubscriptionType.battMax:
        return Text(
          l10n.createContractFormulaBattMaxExplanation,
          style: Theme.of(context).textTheme.labelLarge,
          maxLines: 3,
          textAlign: TextAlign.center,
        );
    }
  }

  Widget _battFanFooter(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 10,
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              flex: 3,
              child: Padding(
                padding: AppPaddings.xlarge.all,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: AppPaddings.small.all,
                      child: Text(
                        "€",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 5,
                      child: FormBuilderTextField(
                        name: "commitment",
                        initialValue: "75",
                        validator: FormBuilderValidators.numeric(),
                        textAlign: TextAlign.center,
                        textAlignVertical: TextAlignVertical.center,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
    );
  }
}

enum SubscriptionType { battFun, battFan, battMax }

extension SubscriptionString on SubscriptionType {
  String get description {
    switch (this) {
      case SubscriptionType.battFun:
        return "BattFun";
      case SubscriptionType.battFan:
        return "BattFan";
      case SubscriptionType.battMax:
        return "BattMax";
    }
  }
}
