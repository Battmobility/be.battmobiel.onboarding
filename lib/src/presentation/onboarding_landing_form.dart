import 'package:batt_ds/batt_ds.dart';
import 'package:batt_onboarding/src/data/token_service.dart';
import 'package:batt_onboarding/src/domain/onboarding_progress.dart';
import 'package:batt_onboarding/src/domain/onboarding_repository_provider.dart';
import 'package:batt_onboarding/src/presentation/pages/legal_page.dart';
import 'package:batt_onboarding/src/presentation/pages/documents_page.dart';
import 'package:batt_onboarding/src/presentation/pages/done_page.dart';
import 'package:batt_onboarding/src/presentation/pages/verification_page.dart';
import 'package:batt_onboarding/src/presentation/pages/personal_page.dart';
import 'package:batt_onboarding/src/presentation/pages/intro_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:step_progress/step_progress.dart';
import '../../l10n/onboarding_localizations.dart';

class OnboardingLandingForm extends StatefulWidget {
  final String accessToken;
  final Function(Object) onAuthenticationError;
  final Function(bool) onSubmitted;

  const OnboardingLandingForm({
    super.key,
    required this.accessToken,
    required this.onAuthenticationError,
    required this.onSubmitted,
  });

  @override
  OnboardingLandingFormState createState() {
    TokenService(accessToken);
    return OnboardingLandingFormState();
  }
}

class OnboardingLandingFormState extends State<OnboardingLandingForm> {
  final _stepperScrollController = ScrollController();
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

    return FutureBuilder(
      future: onboardingRepository.getOnboardingProgress(),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data == null) {
          return Center(child: CircularProgressIndicator());
        }
        OnboardingProgress progress = snapshot.data!;
        final controller = PageController(initialPage: _step, keepPage: true);

        final pages = [
          IntroPage(
            formKey: _formKeys[0],
            onAction: (_) {},
          ),
          LegalPage(
            formKey: _formKeys[1],
            onAction: (_) {},
            initialData: progress.legal,
          ),
          DocumentsPage(
            formKey: _formKeys[2],
            onAction: (_) {},
            prefilled: progress.progress > 1,
          ),
          PersonalPage(
            formKey: _formKeys[3],
            onAction: (_) {},
            initialData: progress.personal..addAll(_scannedData),
          ),
          VerificationPage(
            formKey: _formKeys[4],
            onAction: (_) {
              setState(() {
                _step++;
              });
              controller.jumpToPage(_step);
            },
          ),
          OnboardingDonePage(
              formKey: _formKeys[5],
              onAction: (_) {
                widget.onSubmitted(true);
              },
              onReset: () {
                setState(() {
                  _step = 0;
                });
              })
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
                          controller: controller,
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
                            child: _step == 0
                                ? Opacity(
                                    opacity: 0.66,
                                    child: OrangeOutlinedBattButton(
                                      label: l10n.closeButtonText,
                                      onPressed: () {
                                        widget.onSubmitted(false);
                                      },
                                    ),
                                  )
                                : _step == pages.length - 1
                                    ? Container()
                                    : OrangeOutlinedBattButton(
                                        label: l10n.previousButtonText,
                                        onPressed: () {
                                          setState(() {
                                            _step--;
                                          });
                                          controller.jumpToPage(_step);
                                        },
                                      ),
                          ),
                          Flexible(
                            flex: 6,
                            child: Container(
                              padding: AppPaddings.medium.horizontal,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                controller: _stepperScrollController,
                                child: StepProgress(
                                  totalSteps: pages.length,
                                  currentStep: _step,
                                  axis: Axis.horizontal,
                                  nodeActiveIconBuilder: (index) => FaIcon(
                                    index == _step
                                        ? FontAwesomeIcons.carSide
                                        : FontAwesomeIcons.check,
                                    size: 16,
                                  ),
                                  theme: StepProgressThemeData(
                                      activeForegroundColor:
                                          AppColors.defaultBlue),
                                  onStepChanged: (index) {
                                    if (index > pages.length / 2) {
                                      _stepperScrollController.animateTo(
                                        _stepperScrollController
                                            .position.maxScrollExtent,
                                        duration: Duration(seconds: 1),
                                        curve: Curves.fastOutSlowIn,
                                      );
                                    } else {
                                      if (index < pages.length / 2) {
                                        _stepperScrollController.animateTo(
                                          _stepperScrollController
                                              .position.minScrollExtent,
                                          duration: Duration(seconds: 1),
                                          curve: Curves.fastOutSlowIn,
                                        );
                                      }
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 100,
                            child: _step == pages.length - 1
                                ? Container()
                                : OrangeSolidTextButton(
                                    label: l10n.nextButtonText,
                                    onPressed: () {
                                      if (_step == 0) {
                                        setState(() {
                                          _step++;
                                        });
                                        controller.jumpToPage(_step);
                                      } else if (pages[_step]
                                              .formKey
                                              .currentState
                                              ?.saveAndValidate() ??
                                          false) {
                                        final values = pages[_step]
                                            .formKey
                                            .currentState
                                            ?.value;
                                        if (_step == 1) {
                                          if (values != null) {
                                            onboardingRepository
                                                .postConvictions(values)
                                                .then((success) {
                                              if (success) {
                                                setState(() {
                                                  _step++;
                                                });
                                                controller.jumpToPage(_step);
                                              } else {
                                                _showUploadFailedDialog(
                                                    context);
                                              }
                                            });
                                          }
                                        }
                                        if (_step == 2) {
                                          if (values != null) {
                                            _scannedData = values;
                                          }
                                          _validateDocuments(
                                                  values, progress.progress)
                                              .then((success) {
                                            if (success) {
                                              controller.jumpToPage(_step);
                                            }
                                          });
                                        }
                                        if (_step == 3) {
                                          if (values != null) {
                                            onboardingRepository
                                                .postPersonalData(values)
                                                .then((success) {
                                              if (success) {
                                                setState(() {
                                                  _step++;
                                                });
                                                controller.jumpToPage(_step);
                                              } else {
                                                _showUploadFailedDialog(
                                                    context);
                                              }
                                            });
                                          }
                                        }
                                        if (_step == 4) {}
                                        if (_step == 5) {}
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
      },
    );
  }

  Future<bool> _validateDocuments(
      Map<String, dynamic>? values, int progress) async {
    if (values != null && values.isNotEmpty) {
      final success = await onboardingRepository.postFiles(values);
      if (success || progress > 1) {
        setState(() {
          _step++;
        });
      } else {
        _showUploadFailedDialog(context);
      }
      return success || progress > 1;
    }
    return false;
  }

  void _showIncompleteFormDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(
          OnboardingLocalizations.of(context).fillOutBeforeContinuing,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
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
        title: Text(OnboardingLocalizations.of(context).errorPostingMessage,
            style: Theme.of(context).textTheme.bodyLarge),
        actions: [
          OutlinedTextButton(
              label: "Ok", onPressed: () => Navigator.of(ctx).pop())
        ],
      ),
    );
  }
}
