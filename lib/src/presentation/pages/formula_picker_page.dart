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

  // New state variables for custom layout
  String? selectedFormulaType; // 'battFun' or 'battFan'
  bool useLuxuryFleet = false;

  @override
  void initState() {
    super.initState();
    // Select first available formula by default
    if (widget.subscription.possibleFormulas?.isNotEmpty == true) {
      selectedFormula = widget.subscription.possibleFormulas!.first;
      commitment = selectedFormula?.minCommitment ?? 0;
      _commitmentController.text = commitment.toString();
    }

    // Auto-select BattFun for custom layout
    selectedFormulaType = 'battFun';
    commitment = 0;
    _commitmentController.text = "0";
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

    // Use custom layout if there are exactly 4 possible formulas
    if (possibleFormulas.length == 4) {
      return _buildCustomLayout(context, possibleFormulas);
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
    final isEnabled = selectedFormulaType == 'battFan';

    return Card(
      child: Padding(
        padding: AppPaddings.medium.all,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.commitmentAmount,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: isEnabled
                        ? Theme.of(context).textTheme.titleMedium?.color
                        : Theme.of(context).disabledColor,
                  ),
            ),
            SizedBox(height: AppSpacings.sm),
            Row(
              children: [
                Text(
                  "€",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: isEnabled
                            ? Theme.of(context).textTheme.bodyLarge?.color
                            : Theme.of(context).disabledColor,
                      ),
                ),
                SizedBox(width: AppSpacings.sm),
                Expanded(
                  child: TextField(
                    controller: _commitmentController,
                    enabled: isEnabled,
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
            // Always show minimum text area to prevent layout shifts
            Padding(
              padding: EdgeInsets.only(top: AppSpacings.xs),
              child: Text(
                isEnabled
                    ? l10n.minimumPrefix("75")
                    : " ", // Space to maintain height
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
          content: Text(l10n.commitmentMinimumError(
              selectedFormula!.minCommitment.toString())),
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

  Widget _buildCustomLayout(
      BuildContext context, List<BattFormula> possibleFormulas) {
    final l10n = OnboardingLocalizations.of(context);

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

            // Two-column layout for BattFun and BattFan
            Row(
              children: [
                Expanded(
                  child: _buildCustomFormulaOption(
                    'battFun',
                    l10n.formulaPickerBattFunTitle,
                    l10n.formulaPickerBattFunDescription,
                  ),
                ),
                SizedBox(width: AppSpacings.md),
                Expanded(
                  child: _buildCustomFormulaOption(
                    'battFan',
                    l10n.formulaPickerBattFanTitle,
                    l10n.formulaPickerBattFanDescription,
                  ),
                ),
              ],
            ),

            SizedBox(height: AppSpacings.lg),

            // Always show commitment field to prevent layout shifts
            _buildCommitmentField(),

            SizedBox(height: AppSpacings.lg),

            // Luxury fleet toggle
            Card(
              child: Padding(
                padding: AppPaddings.medium.all,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Switch(
                          value: useLuxuryFleet,
                          onChanged: (value) {
                            setState(() {
                              useLuxuryFleet = value;
                              _updateSelectedFormula(possibleFormulas);
                            });
                          },
                        ),
                        SizedBox(width: AppSpacings.sm),
                        Expanded(
                          child: Text(
                            l10n.formulaPickerUseLuxuryFleet,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  color: AppColors.b2bKeyColor, // Always blue
                                  fontWeight: useLuxuryFleet
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                          ),
                        ),
                      ],
                    ),
                    // Warranty on separate line for clarity - always show to prevent layout shifts
                    Padding(
                      padding: EdgeInsets.only(
                          top: AppSpacings.sm, left: AppSpacings.lg),
                      child: Text(
                        _getSelectedFormula(possibleFormulas)?.warrantyAmount !=
                                null
                            ? l10n.warrantyAmount(
                                _getSelectedFormula(possibleFormulas)!
                                    .warrantyAmount
                                    .toString())
                            : "", // Empty string to maintain space
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppColors.b2bKeyColor,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: AppSpacings.xl),

            SizedBox(
              width: double.infinity,
              child: Opacity(
                opacity: selectedFormulaType != null ? 1.0 : 0.5,
                child: SolidCtaButton(
                  label: l10n.createContractConfirmButtonTitle,
                  onPressed: selectedFormulaType != null
                      ? _createCustomContract
                      : null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomFormulaOption(
      String formulaType, String title, String description) {
    final isSelected = selectedFormulaType == formulaType;

    return Card(
      color: isSelected ? Theme.of(context).colorScheme.surface : null,
      elevation: isSelected ? 3 : 1,
      shape: isSelected
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(
                color: AppColors.b2bKeyColor,
                width: 2,
              ),
            )
          : null,
      child: Container(
        constraints: BoxConstraints(minHeight: 100), // Ensure consistent height
        child: Theme(
          data: Theme.of(context).copyWith(
            radioTheme: RadioThemeData(
              fillColor: WidgetStateProperty.resolveWith<Color>((states) {
                if (states.contains(WidgetState.selected)) {
                  return AppColors.b2bKeyColor; // Use blue when selected
                }
                return Colors.grey[400]!; // Use grey when unselected
              }),
            ),
          ),
          child: RadioListTile<String>(
            value: formulaType,
            groupValue: selectedFormulaType,
            onChanged: (String? value) {
              setState(() {
                selectedFormulaType = value;
                if (value == 'battFun') {
                  commitment = 0;
                  _commitmentController.text = "0";
                } else if (value == 'battFan') {
                  // Set default commitment for BattFan
                  commitment = 75;
                  _commitmentController.text = "75";
                }
                _updateSelectedFormula(
                    widget.subscription.possibleFormulas ?? []);
              });
            },
            title: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: isSelected
                        ? AppColors.b2bKeyColor
                        : Theme.of(context).textTheme.titleMedium?.color,
                  ),
            ),
            subtitle: Text(
              description,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: isSelected
                        ? Theme.of(context).textTheme.bodyMedium?.color
                        : Theme.of(context).textTheme.bodyMedium?.color,
                  ),
            ),
          ),
        ),
      ),
    );
  }

  BattFormula? _getSelectedFormula(List<BattFormula> possibleFormulas) {
    if (selectedFormulaType == null) return null;

    final formulaType = _mapToFormulaType(selectedFormulaType!, useLuxuryFleet);
    return possibleFormulas.firstWhere(
      (formula) => formula.type == formulaType,
      orElse: () => possibleFormulas.first,
    );
  }

  void _updateSelectedFormula(List<BattFormula> possibleFormulas) {
    selectedFormula = _getSelectedFormula(possibleFormulas);
  }

  BattFormulaType _mapToFormulaType(String formulaType, bool isLuxury) {
    switch (formulaType) {
      case 'battFun':
        return isLuxury ? BattFormulaType.battFunPlus : BattFormulaType.battFun;
      case 'battFan':
        return isLuxury ? BattFormulaType.battFanPlus : BattFormulaType.battFan;
      default:
        return BattFormulaType.battFun;
    }
  }

  Future<void> _createCustomContract() async {
    if (selectedFormulaType == null) return;

    final mappedFormula =
        _getSelectedFormula(widget.subscription.possibleFormulas ?? []);
    if (mappedFormula == null) return;

    // Validate minimum commitment for BattFan
    if (selectedFormulaType == 'battFan' && commitment < 75) {
      final l10n = OnboardingLocalizations.of(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.commitmentMinimumError("75")),
        ),
      );
      return;
    }

    final values = {
      "clientId": widget.subscription.clientId,
      "delegatedTrustClientId": widget.subscription.delegatedTrustClientId,
      "formula": mappedFormula.type?.name,
      "commitment": selectedFormulaType == 'battFan' ? commitment : 0,
    };

    final success = await onboardingRepository.postNewContractData(values);
    if (success) {
      widget.onContractCreated();
    } else {
      _showCreateContractFailedDialog(context);
    }
  }
}
