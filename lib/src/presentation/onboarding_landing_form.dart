import 'package:batt_ds/batt_ds.dart';
import 'package:batt_onboarding/src/data/token_service.dart';
import 'package:batt_onboarding/src/presentation/pages/convictions_page.dart';
import 'package:batt_onboarding/src/presentation/pages/done_page.dart';
import 'package:batt_onboarding/src/presentation/pages/identity_page.dart';
import 'package:batt_onboarding/src/presentation/pages/intro_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
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
  List<GlobalKey<FormBuilderState>> get _formKeys => [
        GlobalKey<FormBuilderState>(),
        GlobalKey<FormBuilderState>(),
        GlobalKey<FormBuilderState>(),
        GlobalKey<FormBuilderState>()
      ];

  @override
  Widget build(BuildContext context) {
    final l10n = OnboardingLocalizations.of(context);

    final pages = [
      IntroPage(formKey: _formKeys[0], onValidated: (_) {}),
      ConvictionsPage(
          formKey: _formKeys[1],
          onValidated: (_) {
            // TODO: post data
          }),
      IdentityPage(
          formKey: _formKeys[2],
          onValidated: (_) {
            // TODO: post data
          }),
      DonePage(
          formKey: _formKeys[3],
          onValidated: (_) {
            // TODO: post data
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
                    physics: NeverScrollableScrollPhysics(),
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
                              }
                            })
                        : Opacity(
                            opacity: 0.66,
                            child: OrangeOutlinedBattButton(
                                label: l10n.previousButtonText,
                                onPressed: () {}),
                          ),
                    Text(
                      "Stap ${_step + 1} van ${pages.length}", // TODO: localize
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    OrangeSolidTextButton(
                      label: l10n.nextButtonText,
                      onPressed: () {
                        if (_step == 0 ||
                            (pages[_step].formKey.currentState?.validate() ??
                                false)) {
                          setState(() {
                            _step++;
                          });
                          _controller.jumpToPage(_step);
                        }
                      },
                    )
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
