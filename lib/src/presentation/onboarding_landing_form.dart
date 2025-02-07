import 'package:batt_ds/batt_ds.dart';
import 'package:batt_onboarding/src/data/token_service.dart';
import 'package:batt_onboarding/src/presentation/pages/convictions_page.dart';
import 'package:batt_onboarding/src/presentation/pages/identity_page.dart';
import 'package:batt_onboarding/src/presentation/pages/intro_page.dart';
import 'package:flutter/material.dart';
import '../../l10n/onboarding_localizations.dart';

class OnboardingLandingForm extends StatefulWidget {
  final String accessToken;
  final Function(Object) onAuthenticationError;
  final Function(int) onStepStarted;
  final Function(int) onStepCompleted;
  final Function(bool) onSubmitted;

  const OnboardingLandingForm({
    super.key,
    required this.accessToken,
    required this.onAuthenticationError,
    required this.onStepStarted,
    required this.onStepCompleted,
    required this.onSubmitted,
  });

  @override
  OnboardingLandingFormState createState() {
    TokenService(accessToken);
    return OnboardingLandingFormState();
  }
}

class OnboardingLandingFormState extends State<OnboardingLandingForm> {
  final _controller = PageController(
      initialPage: 0); // TODO: not if resuming from earlier state
  int _step = 0;
  bool _canContinue = true;

  @override
  Widget build(BuildContext context) {
    final l10n = OnboardingLocalizations.of(context);

    final pages = [
      IntroPage(onValidated: (_) {}),
      ConvictionsPage(onValidated: (_) {
        // TODO: post data
        _canContinue = true;
        setState(() {});
      }),
      IdentityPage(onValidated: (_) {
        // TODO: post data
        _canContinue = true;
        setState(() {});
      })
    ];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppPaddings.medium.all,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                flex: 8,
                child: PageView.builder(
                    controller: _controller,
                    itemBuilder: (context, index) => pages[index],
                    itemCount: pages.length),
              ),
              Spacer(),
              Flexible(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _step > 0
                        ? OrangeOutlinedBattButton(
                            label: l10n.previousButtonText,
                            onPressed: () {
                              if (_step > 0) {
                                _step--;
                                _controller.jumpToPage(_step);
                                _canContinue = true;
                              }
                            })
                        : Opacity(
                            opacity: 0.66,
                            child: OrangeOutlinedBattButton(
                                label: l10n.previousButtonText,
                                onPressed: () {}),
                          ),
                    Text(
                      "Stap ${_step + 1} van ${pages.length}",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    _canContinue
                        ? OrangeSolidTextButton(
                            label: l10n.nextButtonText,
                            onPressed: () {
                              _canContinue = false;
                              _step++;
                              _controller.jumpToPage(_step);
                              setState(() {});
                            })
                        : Opacity(
                            opacity: 0.66,
                            child: OrangeOutlinedBattButton(
                              label: l10n.nextButtonText,
                              onPressed: () => showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                  title: Text(l10n.fillOutBeforeContinuing),
                                ),
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
