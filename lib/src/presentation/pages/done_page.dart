import 'package:batt_ds/batt_ds.dart';
import 'package:batt_onboarding/l10n/onboarding_localizations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../util/analytics/analytics_events.dart';
import 'onboarding_page.dart';

final class OnboardingDonePage extends OnboardingPage {
  final Function()? onReset;

  OnboardingDonePage({
    super.key,
    required super.formKey,
    required super.onAction,
    this.onReset,
    super.initialData,
    super.analyticsAction = AnalyticsAction.finishOnboarding,
  });

  @override
  OnboardingDonePageState createState() => OnboardingDonePageState();
}

class OnboardingDonePageState extends State<OnboardingDonePage> {
  @override
  Widget build(BuildContext context) {
    final l10n = OnboardingLocalizations.of(context);

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 800, maxHeight: 800),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(l10n.donePageTitle,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineLarge),
            SizedBox(height: AppSpacings.xl),
            FaIcon(FontAwesomeIcons.chargingStation,
                size: 100, color: AppColors.defaultBlue),
            SizedBox(height: AppSpacings.xxl),
            Text(l10n.donePageMessage,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium),
            SizedBox(height: AppSpacings.xxl),
            OrangeOutlinedTextButton(
              onPressed: () {
                widget.onAction({});
              },
              label: l10n.donePageButtonTitle,
            ),
            if (kDebugMode)
              Padding(
                padding: AppPaddings.xlarge.all,
                child: OrangeSimpleTextButton(
                  onPressed: () {
                    widget.onReset!();
                  },
                  label: "-- Debug mode: Reset --",
                ),
              )
          ],
        ),
      ),
    );
  }
}
