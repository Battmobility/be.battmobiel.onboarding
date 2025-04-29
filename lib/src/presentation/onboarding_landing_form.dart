import 'package:batt_ds/batt_ds.dart';
import 'package:batt_onboarding/src/data/token_service.dart';
import 'package:batt_onboarding/src/domain/onboarding_progress.dart';
import 'package:batt_onboarding/src/domain/onboarding_repository_provider.dart';
import 'package:batt_onboarding/src/presentation/pages/address_page.dart';
import 'package:batt_onboarding/src/presentation/pages/id_documents_page.dart';
import 'package:batt_onboarding/src/presentation/pages/legal_details_page.dart';
import 'package:batt_onboarding/src/presentation/pages/drivers_license_page.dart';
import 'package:batt_onboarding/src/presentation/pages/done_page.dart';
import 'package:batt_onboarding/src/presentation/pages/onboarding_page.dart';
import 'package:batt_onboarding/src/presentation/pages/phone_verification_page.dart';
import 'package:batt_onboarding/src/presentation/pages/personal_page.dart';
import 'package:batt_onboarding/src/presentation/pages/intro_page.dart';
import 'package:batt_onboarding/src/presentation/widgets/onboarding_form_footer.dart';
import 'package:batt_onboarding/src/util/event_names.dart';
import 'package:batt_onboarding/src/util/nonnull_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../../l10n/onboarding_localizations.dart';
import 'onboarding_steps.dart';
import 'pages/deposit_page.dart';
import 'pages/documents_explainer.dart';
import 'pages/phone_entry_page.dart';
import 'widgets/onboarding_form_header.dart';

class OnboardingLandingForm extends StatefulWidget {
  final String accessToken;
  final Function(Object) onAuthenticationError;
  final Function(bool) onSubmitted;
  final Function(
    String name,
    String? action,
    int timeStamp,
    Map<String, dynamic>? data,
  )? onTrackEvent;
  final Function(String name)? onTrackPageView;

  const OnboardingLandingForm({
    super.key,
    required this.accessToken,
    required this.onAuthenticationError,
    required this.onSubmitted,
    this.onTrackEvent,
    this.onTrackPageView,
  });

  @override
  OnboardingLandingFormState createState() {
    TokenService(accessToken);
    return OnboardingLandingFormState();
  }
}

class OnboardingLandingFormState extends State<OnboardingLandingForm> {
  int _step = 0;
  DateTime? startedAt;
  Map<String, dynamic>? _scannedIdPics;
  Map<String, dynamic>? _scannedDriversLicensePics;

  String _phoneNumber = "";
  int? clientId;

  List<GlobalKey<FormBuilderState>> get _formKeys =>
      OnboardingSteps.values.map((_) => GlobalKey<FormBuilderState>()).toList();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: onboardingRepository.getOnboardingProgress(),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data == null) {
          return Center(child: CircularProgressIndicator());
        }
        OnboardingProgress progress = snapshot.data!;

        final pages = [
          IntroPage(
            formKey: _formKeys[OnboardingSteps.intro.index],
            onAction: (_) {},
          ),
          PersonalPage(
            formKey: _formKeys[OnboardingSteps.personal.index],
            onAction: (_) {},
            initialData: progress.personal
              ..addAll(
                (_scannedIdPics ?? {}),
              )
              ..addAll(
                (_scannedDriversLicensePics ?? {}),
              ),
          ),
          AddressPage(
            formKey: _formKeys[OnboardingSteps.address.index],
            onAction: (_) {},
            initialData: progress.personal
              ..addAll(
                (_scannedIdPics ?? {}),
              )
              ..addAll(
                (_scannedDriversLicensePics ?? {}),
              ),
          ),
          PhoneEntryPage(
            formKey: _formKeys[OnboardingSteps.phone.index],
            onAction: (_) {},
          ),
          PhoneVerificationPage(
            phoneNumber: _phoneNumber,
            formKey: _formKeys[OnboardingSteps.phoneVerification.index],
            onAction: (_) {},
          ),
          DocumentsExplainerPage(
            formKey: _formKeys[OnboardingSteps.documentsExplainer.index],
            onAction: (_) {},
          ),
          IdDocumentsPage(
            formKey: _formKeys[OnboardingSteps.idDocuments.index],
            onAction: (_) {},
            prefilled: false,
          ),
          DriversLicensePage(
            formKey: _formKeys[OnboardingSteps.driversLicense.index],
            onAction: (_) {},
            prefilled: false,
          ),
          LegalDetailsPage(
            formKey: _formKeys[OnboardingSteps.legal.index],
            onAction: (_) {},
            initialData: progress.legal,
          ),
          LegalDetailsPage(
            formKey: _formKeys[OnboardingSteps.legalDetails.index],
            onAction: (_) {},
            initialData: progress.legal,
          ),
          DepositPage(
            formKey: _formKeys[OnboardingSteps.deposit.index],
            onAction: (_) {},
            initialData: progress.legal,
          ),
          /*
          CreateClientPage(
            formKey: _formKeys[6],
            initialData: progress.personal,
            onAction: (_) {
              // Skip to finish
              setState(() {
                _step += 2;
              });
              controller.jumpToPage(_step);
            },
          ),
          PickFormulaPage(
            formKey: _formKeys[7],
            initialData: progress.personal..addAll({"clientId": clientId}),
            onAction: (_) {},
          ),
          */
          OnboardingDonePage(
            formKey: _formKeys[OnboardingSteps.confirmation.index],
            onAction: (_) {
              widget.onSubmitted(true);
            },
            onReset: () {
              setState(() {
                _step = 0;
              });
            },
          )
        ];

        final controller = PageController(
          initialPage: _step,
          keepPage: true,
        );
        controller.addListener(() {
          if (_step == 0 && startedAt == null) {
            startedAt = DateTime.now();
          }
          if (widget.onTrackPageView != null &&
              controller.page != null &&
              _step < OnboardingSteps.values.length - 1) {
            widget.onTrackPageView!(OnboardingSteps.values[_step].name);
          }
        });

        return Scaffold(
          body: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                OnboardingFormHeader(
                  title: OnboardingSteps.values[_step].name,
                  progress:
                      _step > 0 ? OnboardingSteps.values.length / _step : 0,
                  backButtonEnabled: _step != OnboardingSteps.intro.index &&
                      _step != OnboardingSteps.confirmation.index,
                  onbackPressed: () {
                    setState(() {
                      _step--;
                    });
                    controller.jumpToPage(_step);
                  },
                ),
                Divider(thickness: 0.5, color: AppColors.grey[500]),
                Expanded(
                  flex: 12,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: AppPaddings.medium.all,
                      child: PageView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          controller: controller,
                          itemBuilder: (context, index) => pages[index],
                          itemCount: pages.length),
                    ),
                  ),
                ),
                Divider(thickness: 0.5, color: AppColors.grey[500]),
                Expanded(
                    flex: OnboardingSteps.values[_step].canSkip ? 3 : 2,
                    child: OnboardingFormFooter(
                      showLaterButton: OnboardingSteps.values[_step].canSkip,
                      onNextPressed: () {
                        _nextStep(controller, pages, progress);
                      },
                      onLaterPressed: () {
                        showDialog(
                            context: context,
                            builder: (ctx) {
                              final l10n = OnboardingLocalizations.of(ctx);

                              return BattDialog(
                                  title: l10n.continueLaterDialogTitle,
                                  message: l10n.continueLaterDialogMessage,
                                  actions: [
                                    DefaultOutlinedTextButton(
                                        label: l10n
                                            .continueLaterDialogOptionContinueNow,
                                        onPressed: () {
                                          _trackEvent(
                                            eventName: EventNames
                                                .continueLaterCanceled.name,
                                            action: OnboardingSteps
                                                .values[_step].name,
                                          );
                                          Navigator.of(ctx).pop();
                                        }),
                                    OrangeSolidTextButton(
                                        label: l10n
                                            .continueLaterDialogOptionContinueLater,
                                        onPressed: () {
                                          Navigator.of(ctx).pop();

                                          _trackEvent(
                                            eventName: EventNames
                                                .continueLaterPressed.name,
                                            action: OnboardingSteps
                                                .values[_step].name,
                                          );
                                          widget.onSubmitted(false);
                                        }),
                                  ]).build(ctx);
                            });

                        widget.onSubmitted(false);
                      },
                    )),
              ],
            ),
          ),
        );
      },
    );
  }

  void _nextStep(
    PageController controller,
    List<OnboardingPage> pages,
    OnboardingProgress progress,
  ) {
    // Skippable steps
    if (_step == OnboardingSteps.intro.index ||
        _step == OnboardingSteps.documentsExplainer.index) {
      setState(() {
        _step++;
      });
      controller.jumpToPage(_step);
    } else if (pages[_step].formKey.currentState?.saveAndValidate() ?? false) {
      final values = pages[_step].formKey.currentState?.value;
      if (_step == OnboardingSteps.personal.index) {
        // TODO: check if split into two calls on  backend, if not cache data here and post in OnboardingSteps.address
        if (values != null) {
          onboardingRepository.postPersonalData(values).then((success) {
            if (success) {
              if (progress.progress >= 5) {
                setState(() {
                  _step += 2;
                });
              } else {
                setState(() {
                  _step++;
                });
              }

              controller.jumpToPage(_step);
            } else {
              _showUploadFailedDialog(context);
            }
          });
        }
      }
      if (_step == OnboardingSteps.address.index) {
        // TODO: check if split into two calls on  backend, if not append cached data from OnboardingSteps.personal
        if (values != null) {
          onboardingRepository.postPersonalData(values).then((success) {
            if (success) {
              if (progress.progress >= 5) {
                setState(() {
                  _step += 2;
                });
              } else {
                setState(() {
                  _step++;
                });
              }

              controller.jumpToPage(_step);
            } else {
              _showUploadFailedDialog(context);
            }
          });
        }
      }
      if (_step == OnboardingSteps.phone.index) {
        if (values != null) {
          _phoneNumber = values["phoneNumber"];
          controller.jumpToPage(_step);
        }
      }
      if (_step == OnboardingSteps.phoneVerification.index) {
        controller.jumpToPage(_step);
      }
      if (_step == OnboardingSteps.idDocuments.index) {
        if (values != null) {
          _scannedIdPics = values.withNullsRemoved;
        }

        _validateIdDocuments(values, progress.progress).then((success) {
          if (success) {
            controller.jumpToPage(_step);
          }
        });
      }
      if (_step == OnboardingSteps.driversLicense.index) {
        if (values != null) {
          _scannedDriversLicensePics = values.withNullsRemoved;
        }
        _validateDriversLicense(values, progress.progress).then((success) {
          if (success) {
            controller.jumpToPage(_step);
          }
        });
      }
      if (_step == OnboardingSteps.legal.index) {
        // TODO: post if no convictions
        if (values != null) {
          onboardingRepository.postConvictions(values).then((success) {
            if (success) {
              setState(() {
                _step++;
              });
              controller.jumpToPage(_step);
            } else {
              _showUploadFailedDialog(context);
            }
          });
        }
      }
      if (_step == OnboardingSteps.legalDetails.index) {
        // TODO: post if user has convictions

        if (values != null) {
          onboardingRepository.postConvictions(values).then((success) {
            if (success) {
              setState(() {
                _step++;
              });
              controller.jumpToPage(_step);
            } else {
              _showUploadFailedDialog(context);
            }
          });
        }
      }

      // TBC:
      /*
                                        if (_step == 6) {
                                          if (values != null) {
                                            onboardingRepository
                                                .postNewClientData(values)
                                                .then((newClientId) {
                                              if (newClientId != null) {
                                                clientId = newClientId;
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
                                        if (_step == 7) {
                                          if (values != null) {
                                            onboardingRepository
                                                .postNewContractData(values)
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
                                        */
    } else {
      _showIncompleteFormDialog(context);
    }
  }

  Future<bool> _validateIdDocuments(
      Map<String, dynamic>? values, int progress) async {
    if (values != null && values.isNotEmpty) {
      final success = await onboardingRepository.postIdFiles(values);
      if (success || progress > 1) {
        setState(() {
          _step++;
        });
        _trackEvent(eventName: EventNames.idUploaded.name);
      } else {
        _trackEvent(eventName: EventNames.idUploadFailed.name);
        _showUploadFailedDialog(context);
      }
      return success || progress > 1;
    }
    return false;
  }

  Future<bool> _validateDriversLicense(
      Map<String, dynamic>? values, int progress) async {
    if (values != null && values.isNotEmpty) {
      final success = await onboardingRepository.postDriversLicense(values);
      if (success || progress > 1) {
        _trackEvent(eventName: EventNames.drivingLicenseUploaded.name);
        setState(() {
          _step++;
        });
      } else {
        _trackEvent(eventName: EventNames.drivingLicenseUploadFailed.name);

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
          OrangeOutlinedTextButton(
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
          OrangeOutlinedTextButton(
              label: "Ok", onPressed: () => Navigator.of(ctx).pop())
        ],
      ),
    );
  }

  void _trackEvent(
      {required String eventName,
      String? action,
      Map<String, dynamic>? eventParams}) {
    if (widget.onTrackEvent != null) {
      final timeStamp = startedAt != null
          ? DateTime.now().difference(startedAt!).inSeconds
          : -1;
      widget.onTrackEvent!(eventName, action, timeStamp, eventParams);
    }
  }
}
