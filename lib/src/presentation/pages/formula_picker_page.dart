import 'package:batt_ds/batt_ds.dart';
import 'package:batt_onboarding/l10n/onboarding_localizations.dart';
import 'package:batt_onboarding/src/domain/onboarding_repository_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final class FormulaPickerPage extends StatefulWidget {
  final int clientId;
  final int? delegatedTrustClientId;
  final Function() onContractCreated;

  FormulaPickerPage(
      {super.key,
      required this.clientId,
      this.delegatedTrustClientId,
      required this.onContractCreated});

  @override
  State<StatefulWidget> createState() => FormulaPickerPageState();
}

class FormulaPickerPageState extends State<FormulaPickerPage> {
  final TextEditingController _commitmentController = TextEditingController();

  SubscriptionType subscriptionType = SubscriptionType.battFun;
  int commitment = 75;

  @override
  void dispose() {
    _commitmentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = OnboardingLocalizations.of(context);
    return Padding(
      padding: AppPaddings.large.trailing,
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
                child: SegmentedButton(
                  showSelectedIcon: false,
                  segments: [
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
                    });
                  },
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
              SolidCtaButton(
                  label: l10n.createContractConfirmButtonTitle,
                  onPressed: () async {
                    final values = {
                      "clientId": widget.clientId,
                      "delegatedTrustClientId": widget.delegatedTrustClientId,
                      "formula": subscriptionType.name,
                      "commitment": commitment,
                    };
                    final success =
                        await onboardingRepository.postNewContractData(values);
                    if (success) {
                      widget.onContractCreated();
                    } else {
                      _showCreateContractFailedDialog(context);
                    }
                  })
            ],
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
                      child: TextField(
                        controller:
                            TextEditingController(text: commitment.toString()),
                        textAlign: TextAlign.center,
                        textAlignVertical: TextAlignVertical.center,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onChanged: (value) {
                          final newCommitment = int.tryParse(value);
                          if (newCommitment != null) {
                            commitment = newCommitment;
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
    );
  }

  Future<void> postNewContractData(Map<String, dynamic> values) async {
    final success = await onboardingRepository.postNewContractData(values);
    if (success) {
      widget.onContractCreated();
    } else {
      _showCreateContractFailedDialog(context);
    }
  }

  void _showCreateContractFailedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(
            OnboardingLocalizations.of(context).addSubscriptionFormFailure,
            style: Theme.of(context).textTheme.bodyLarge),
        actions: [
          SolidCtaButton(label: "Ok", onPressed: () => Navigator.of(ctx).pop())
        ],
      ),
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
