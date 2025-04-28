import 'package:batt_ds/batt_ds.dart';
import 'package:batt_onboarding/l10n/onboarding_localizations.dart';
import 'package:flutter/material.dart';

final class MoreInfoButton extends StatelessWidget {
  final String? text;
  final Function onPressed;

  const MoreInfoButton({required this.onPressed, this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: WidgetStatePropertyAll(0),
        backgroundColor: WidgetStatePropertyAll(AppColors.grey[300]),
      ),
      onPressed: onPressed(),
      child: Text(
          text ?? OnboardingLocalizations.of(context).moreInfoButtonLabel,
          style: Theme.of(context).textTheme.bodyMedium!),
    );
  }
}
