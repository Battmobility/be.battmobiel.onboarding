import 'package:batt_ds/batt_ds.dart';
import 'package:batt_onboarding/l10n/onboarding_localizations.dart';
import 'package:batt_onboarding/src/domain/onboarding_repository_provider.dart';
import 'package:batt_onboarding/src/domain/subscription.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final class FormulaPickerPage extends StatefulWidget {
  final Subscription subscription;
  final Function() onContractCreated;

  FormulaPickerPage({
    super.key,
    required this.subscription,
    required this.onContractCreated,
  });

  @override
  State<StatefulWidget> createState() => FormulaPickerPageState();
}

class FormulaPickerPageState extends State<FormulaPickerPage> {
  final TextEditingController _commitmentController = TextEditingController();

  BattFormula? selectedFormula;
  int commitment = 0;

  @override
  void initState() {
    super.initState();
    // Select first available formula by default
    if (widget.subscription.possibleFormulas?.isNotEmpty == true) {
      selectedFormula = widget.subscription.possibleFormulas!.first;
      commitment = selectedFormula?.minCommitment ?? 0;
      _commitmentController.text = commitment.toString();
    }
  }

  @override
  void dispose() {
    _commitmentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = OnboardingLocalizations.of(context);
    final possibleFormulas = widget.subscription.possibleFormulas ?? [];

    if (possibleFormulas.isEmpty) {
      return Padding(
        padding: AppPaddings.large.all,
        child: Center(
          child: Text(
            l10n.noFormulasAvailable,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      );
    }

    return Padding(
      padding: AppPaddings.large.all,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.createContractPickFormulaLabel,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(height: AppSpacings.lg),
            // Radio buttons for each possible formula
            ...possibleFormulas.map((formula) => _buildFormulaOption(formula)),
            SizedBox(height: AppSpacings.lg),
            // Minimum commitment field (only if needed)
            if (selectedFormula?.minCommitment != null &&
                selectedFormula!.minCommitment! > 0)
              _buildCommitmentField(),
            SizedBox(height: AppSpacings.xl),
            SizedBox(
              width: double.infinity,
              child: Opacity(
                opacity: selectedFormula != null ? 1.0 : 0.5,
                child: SolidCtaButton(
                  label: l10n.createContractConfirmButtonTitle,
                  onPressed: selectedFormula != null ? _createContract : null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getFormulaDescription(
      BuildContext context, BattFormulaType? formulaType) {
    final l10n = OnboardingLocalizations.of(context);

    switch (formulaType) {
      case BattFormulaType.battFun:
        return l10n.formulaBattFunDescription;
      case BattFormulaType.battFunPlusDL:
        return l10n.formulaBattFunPlusDLDescription;
      case BattFormulaType.battFan:
        return l10n.formulaBattFanDescription;
      case BattFormulaType.battFunPlus:
        return l10n.formulaBattFunPlusDescription;
      case BattFormulaType.battFanPlus:
        return l10n.formulaBattFanPlusDescription;
      case BattFormulaType.battForBusiness:
        return l10n.formulaBattForBusinessDescription;
      default:
        return "No description available";
    }
  }

  Widget _buildFormulaOption(BattFormula formula) {
    final formulaType = formula.type;
    final l10n = OnboardingLocalizations.of(context);

    return Card(
      margin: EdgeInsets.only(bottom: AppSpacings.md),
      child: RadioListTile<BattFormula>(
        value: formula,
        groupValue: selectedFormula,
        onChanged: (BattFormula? value) {
          setState(() {
            selectedFormula = value;
            // Update commitment when formula changes
            if (value?.minCommitment != null && value!.minCommitment! > 0) {
              commitment = value.minCommitment!;
              _commitmentController.text = commitment.toString();
            } else {
              commitment = 0;
              _commitmentController.text = "0";
            }
          });
        },
        title: Text(
          formulaType?.name.toUpperCase() ?? "Unknown Formula",
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (formulaType != null)
              Text(
                _getFormulaDescription(context, formulaType),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            SizedBox(height: AppSpacings.xs),
            if (formula.warrantyAmount != null)
              Text(
                l10n.warrantyAmount(formula.warrantyAmount.toString()),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.b2cKeyColor,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            if (formula.minCommitment != null && formula.minCommitment! > 0)
              Text(
                l10n.minimumCommitment(formula.minCommitment.toString()),
                style: Theme.of(context).textTheme.bodySmall,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildCommitmentField() {
    final l10n = OnboardingLocalizations.of(context);
    return Card(
      child: Padding(
        padding: AppPaddings.medium.all,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.commitmentAmount,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: AppSpacings.sm),
            Row(
              children: [
                Text(
                  "€",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(width: AppSpacings.sm),
                Expanded(
                  child: TextField(
                    controller: _commitmentController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: l10n.enterAmount,
                    ),
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
            if (selectedFormula?.minCommitment != null &&
                selectedFormula!.minCommitment! > 0)
              Padding(
                padding: EdgeInsets.only(top: AppSpacings.xs),
                child: Text(
                  l10n.minimumPrefix(selectedFormula!.minCommitment.toString()),
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: AppColors.neutralColors[600]),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _createContract() async {
    // Validate minimum commitment
    if (selectedFormula?.minCommitment != null &&
        selectedFormula!.minCommitment! > 0 &&
        commitment < selectedFormula!.minCommitment!) {
      final l10n = OnboardingLocalizations.of(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              l10n.commitmentMinimumError(selectedFormula!.minCommitment.toString())),
        ),
      );
      return;
    }

    final values = {
      "clientId": widget.subscription.clientId,
      "delegatedTrustClientId": widget.subscription.delegatedTrustClientId,
      "formula": selectedFormula?.type?.name,
      "commitment": commitment,
    };

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
