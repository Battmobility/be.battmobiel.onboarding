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
  bool _canContinue = false;

  @override
  Widget build(BuildContext context) {
    final l10n = OnboardingLocalizations.of(context);

    final pages = [
      IntroPage(onValidated: (_) {
        _step++;

        _canContinue = true;
        setState(() {});
      }),
      ConvictionsPage(onValidated: (_) {
        // TODO: post data
        _step++;

        setState(() {});
      }),
      IdentityPage(onValidated: (_) {
        // TODO: post data
        _step++;
        // _controller.jumpToPage(1);
        setState(() {});
      })
    ];

    return Scaffold(
      body: Container(
        padding: AppPaddings.xxlarge.all,
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 800, maxHeight: 800),
          child: Column(
            children: [
              PageView.builder(
                  itemBuilder: (context, index) => pages[index], itemCount: 3),
              Row(
                children: [
                  OrangeOutlinedBattButton(
                      label: l10n.previousButtonText,
                      onPressed: () {
                        _controller.jumpToPage(_step--);
                        _canContinue = false;
                      }),
                  Expanded(child: SizedBox()),
                  _canContinue
                      ? OrangeOutlinedBattButton(
                          label: l10n.nextButtonText,
                          onPressed: () {
                            _canContinue = true;
                            _controller.jumpToPage(_step++);
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
                        )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
