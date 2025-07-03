import 'package:batt_ds/batt_ds.dart';
import 'package:batt_onboarding/l10n/onboarding_localizations.dart';
import 'package:flutter/material.dart';

final class OnboardingFormFooter extends StatelessWidget {
  final bool showLaterButton;
  final Function() onNextPressed;
  final Function()? onLaterPressed;

  const OnboardingFormFooter({
    required this.showLaterButton,
    required this.onNextPressed,
    this.onLaterPressed,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.medium.all.add(AppPaddings.xlarge.horizontal),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: AppSpacings.sm,
        children: [
          DefaultSolidTextButton(
            onPressed: onNextPressed,
            label: OnboardingLocalizations.of(context).nextButtonText,
          ),
          if (showLaterButton)
            DefaultOutlinedTextButton(
              onPressed: onLaterPressed ?? () {},
              label: OnboardingLocalizations.of(context).laterButtonText,
            ),
        ],
      ),
    );
  }
}
