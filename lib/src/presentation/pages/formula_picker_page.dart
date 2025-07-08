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

  // Formula descriptions map
  static const Map<BattFormulaType, String> formulaDescriptions = {
    BattFormulaType.battFun: "Comfort vloot zonder abonnementskosten",
    BattFormulaType.battFunPlusDL:
        "Luxevloot, geen vaste kost, waarborg geregeld door je werkgever.",
    BattFormulaType.battFan:
        "Comfort vloot + maandelijks een vaste prepaid, 25% korting.",
    BattFormulaType.battFunPlus: "Luxevloot zonder abonnementskosten",
    BattFormulaType.battFanPlus:
        "Luxevloot + maandelijks een vaste prepaid, 25% korting.",
    BattFormulaType.battForBusiness:
        "Voor bedrijven: luxevloot aan 25% korting",
  };

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
            "No formulas available for this subscription",
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
              ...possibleFormulas
                  .map((formula) => _buildFormulaOption(formula)),
              SizedBox(height: AppSpacings.lg),
              // Minimum commitment field (only if needed)
              if (selectedFormula?.minCommitment != null &&
                  selectedFormula!.minCommitment! > 0)
                _buildCommitmentField(),
              SizedBox(height: AppSpacings.xl),
              SizedBox(
                width: double.infinity,
                child: SolidCtaButton(
                  label: l10n.createContractConfirmButtonTitle,
                  onPressed: selectedFormula != null ? _createContract : null,
                ),
              ),
            ],
        ),
      ),
    );
  }

  Widget _buildFormulaOption(BattFormula formula) {
    final formulaType = formula.type;

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
                formulaDescriptions[formulaType] ?? "No description available",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            SizedBox(height: AppSpacings.xs),
            if (formula.warrantyAmount != null)
              Text(
                "Warranty: €${formula.warrantyAmount}",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.b2cKeyColor,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            if (formula.minCommitment != null && formula.minCommitment! > 0)
              Text(
                "Minimum commitment: €${formula.minCommitment}",
                style: Theme.of(context).textTheme.bodySmall,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildCommitmentField() {
    return Card(
      child: Padding(
        padding: AppPaddings.medium.all,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Commitment Amount",
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
                      hintText: "Enter amount",
                      suffix: Text("€"),
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
                  "Minimum: €${selectedFormula!.minCommitment}",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.grey[600],
                      ),
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
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              "Commitment must be at least €${selectedFormula!.minCommitment}"),
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
