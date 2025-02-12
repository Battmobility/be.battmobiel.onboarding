import 'dart:io';

import 'package:batt_ds/batt_ds.dart';
import 'package:batt_onboarding/src/data/token_service.dart';
import 'package:batt_onboarding/src/domain/onboarding_repository_provider.dart';
import 'package:batt_onboarding/src/presentation/pages/convictions_page.dart';
import 'package:batt_onboarding/src/presentation/pages/documents_page.dart';
import 'package:batt_onboarding/src/presentation/pages/done_page.dart';
import 'package:batt_onboarding/src/presentation/pages/verification_page.dart';
import 'package:batt_onboarding/src/presentation/pages/identity_page.dart';
import 'package:batt_onboarding/src/presentation/pages/intro_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

  Map<String, dynamic> _scannedData = {};
  List<GlobalKey<FormBuilderState>> get _formKeys => [
        GlobalKey<FormBuilderState>(),
        GlobalKey<FormBuilderState>(),
        GlobalKey<FormBuilderState>(),
        GlobalKey<FormBuilderState>(),
        GlobalKey<FormBuilderState>(),
        GlobalKey<FormBuilderState>()
      ];

  @override
  Widget build(BuildContext context) {
    final l10n = OnboardingLocalizations.of(context);

    final pages = [
      IntroPage(
          formKey: _formKeys[0],
          onAction: (_) {
            widget.onSubmitted(false);
          }),
      ConvictionsPage(
        formKey: _formKeys[1],
        onAction: (_) {},
      ),
      DocumentsPage(
        formKey: _formKeys[2],
        onAction: (_) {},
      ),
      IdentityPage(
        formKey: _formKeys[3],
        onAction: (_) {},
        initialData: _scannedData,
      ),
      VerificationPage(formKey: _formKeys[4], onAction: (_) {}),
      OnboardingDonePage(
        formKey: _formKeys[5],
        onAction: (_) {
          widget.onSubmitted(true);
        },
      )
    ];

    final icons = [
      IntroPage(
          formKey: _formKeys[0],
          onAction: (_) {
            widget.onSubmitted(false);
          }),
      ConvictionsPage(
        formKey: _formKeys[1],
        onAction: (_) {},
      ),
      DocumentsPage(
        formKey: _formKeys[2],
        onAction: (_) {},
      ),
      IdentityPage(
        formKey: _formKeys[3],
        onAction: (_) {},
        initialData: _scannedData,
      ),
      VerificationPage(formKey: _formKeys[4], onAction: (_) {}),
      OnboardingDonePage(
        formKey: _formKeys[5],
        onAction: (_) {
          widget.onSubmitted(true);
        },
      )
    ];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppPaddings.medium.all,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                flex: 8,
                child: Container(
                  child: PageView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      controller: _controller,
                      itemBuilder: (context, index) => pages[index],
                      itemCount: pages.length),
                ),
              ),
              Flexible(
                flex: 1,
                child: Padding(
                  padding: AppPaddings.medium.top,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 100,
                        child: _step > 0
                            ? OrangeOutlinedBattButton(
                                label: l10n.previousButtonText,
                                onPressed: () {
                                  _scannedData = {};
                                  setState(() {
                                    _step--;
                                  });
                                  _controller.jumpToPage(_step);
                                })
                            : Opacity(
                                opacity: 0.66,
                                child: OrangeOutlinedBattButton(
                                    label: l10n.closeButtonText,
                                    onPressed: () {
                                      widget.onSubmitted(false);
                                    }),
                              ),
                      ),
                      Flexible(
                        flex: 6,
                        child: Padding(
                          padding: AppPaddings.small.top,
                          child: Stepper(
                            type: StepperType.horizontal,
                            elevation: 0,
                            currentStep: _step,
                            margin: EdgeInsets.only(top: AppSpacings.xxs),
                            stepIconWidth: AppSpacings.xxl,
                            stepIconMargin: EdgeInsets.zero,
                            connectorColor: WidgetStatePropertyAll(
                                Theme.of(context).colorScheme.primary),
                            connectorThickness: 2,
                            physics: NeverScrollableScrollPhysics(),
                            stepIconBuilder: (stepIndex, stepState) {
                              switch (stepState) {
                                case StepState.complete:
                                  return FaIcon(
                                    FontAwesomeIcons.check,
                                    size: 14,
                                  );
                                case StepState.editing:
                                  return Padding(
                                    padding: EdgeInsets.only(bottom: 1),
                                    child: FaIcon(FontAwesomeIcons.carSide,
                                        size: 14),
                                  );
                                case StepState.indexed:
                                  return Text("$stepIndex");
                                case StepState.error:
                                  return FaIcon(
                                      FontAwesomeIcons.triangleExclamation);
                                case StepState.disabled:
                                  return Opacity(
                                      opacity: 100, child: Text("$stepIndex"));
                              }
                            },
                            steps: pages
                                .map((page) => Step(
                                      title: Text(""),
                                      content: pages.indexOf(page) < _step
                                          ? FaIcon(FontAwesomeIcons.check)
                                          : pages.indexOf(page) == _step
                                              ? FaIcon(FontAwesomeIcons.carSide)
                                              : Text("$_step"),
                                      isActive: pages.indexOf(page) <= _step,
                                      state: pages.indexOf(page) < _step
                                          ? StepState.complete
                                          : pages.indexOf(page) == _step
                                              ? StepState.editing
                                              : StepState.indexed,
                                    ))
                                .toList(),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: OrangeSolidTextButton(
                          label: l10n.nextButtonText,
                          onPressed: () {
                            if (_step == 0) {
                              setState(() {
                                _step++;
                              });
                              _controller.jumpToPage(_step);
                            } else if (pages[_step]
                                    .formKey
                                    .currentState
                                    ?.saveAndValidate() ??
                                false) {
                              if (_step == 1) {
                                final values =
                                    pages[1].formKey.currentState?.value;
                                if (values != null) {
                                  onboardingRepository
                                      .postConvictions(values)
                                      .then((success) {
                                    if (success) {
                                      setState(() {
                                        _step++;
                                      });
                                      _controller.jumpToPage(_step);
                                    } else {
                                      _showUploadFailedDialog(context);
                                    }
                                  });
                                }
                              }
                              if (_step == 2) {
                                final values =
                                    pages[2].formKey.currentState?.value;
                                if (values != null) {
                                  // TODO: re enable when api fixed

                                  onboardingRepository
                                      .postDocuments(values)
                                      .then((success) {
                                    if (success) {
                                      setState(() {
                                        _step++;
                                      });
                                      _controller.jumpToPage(_step);
                                    } else {
                                      _showUploadFailedDialog(context);
                                    }
                                  });
                                }
                              }
                              if (_step == 3) {
                                final values =
                                    pages[3].formKey.currentState?.value;
                                if (values != null) {
                                  onboardingRepository
                                      .postPersonalData(values)
                                      .then((success) {
                                    if (success) {
                                      setState(() {
                                        _step++;
                                      });
                                      _controller.jumpToPage(_step);
                                    } else {
                                      _showUploadFailedDialog(context);
                                    }
                                  });
                                }
                              }
                              if (_step == 4) {
                                final values =
                                    pages[4].formKey.currentState?.value;
                                if (values != null) {
                                  // TODO: do whatever, phone is confirmed here
                                  setState(() {
                                    _step++;
                                  });
                                  _controller.jumpToPage(_step);
                                }
                              }
                              if (_step == 5) {
                                // TODO: show success page/close onboarding?
                              }
                            } else {
                              _showIncompleteFormDialog(context);
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showIncompleteFormDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title:
            Text(OnboardingLocalizations.of(context).fillOutBeforeContinuing),
        actions: [
          OutlinedTextButton(
              label: "Ok", onPressed: () => Navigator.of(ctx).pop())
        ],
      ),
    );
  }

  void _showUploadFailedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(OnboardingLocalizations.of(context).errorPostingMessage),
        actions: [
          OutlinedTextButton(
              label: "Ok", onPressed: () => Navigator.of(ctx).pop())
        ],
      ),
    );
  }
}
