import 'package:batt_ds/batt_ds.dart';
import 'package:batt_onboarding/src/data/token_service.dart';
import 'package:batt_onboarding/src/domain/onboarding_progress.dart';
import 'package:batt_onboarding/src/domain/onboarding_repository_provider.dart';
import 'package:batt_onboarding/src/presentation/pages/address_page.dart';
import 'package:batt_onboarding/src/presentation/pages/id_documents_page.dart';
import 'package:batt_onboarding/src/presentation/pages/legal_details_page.dart';
import 'package:batt_onboarding/src/presentation/pages/drivers_license_page.dart';
import 'package:batt_onboarding/src/presentation/pages/done_page.dart';
import 'package:batt_onboarding/src/presentation/pages/phone_verification_page.dart';
import 'package:batt_onboarding/src/presentation/pages/personal_page.dart';
import 'package:batt_onboarding/src/presentation/pages/intro_page.dart';
import 'package:batt_onboarding/src/util/nonnull_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../../l10n/onboarding_localizations.dart';
import 'pages/deposit_page.dart';
import 'pages/documents_explainer.dart';
import 'pages/phone_entry_page.dart';

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

enum OnboardingSteps {
  intro,
  personal,
  address,
  phone,
  phoneVerification,
  documentsExplainer,
  idDocuments,
  driversLicense,
  legal,
  legalDetails,
  deposit,
  confirmation
}

class OnboardingLandingFormState extends State<OnboardingLandingForm> {
  final _stepperScrollController = ScrollController();
  int _step = 0;
  Map<String, dynamic>? _scannedIdPics;
  Map<String, dynamic>? _scannedDriversLicensePics;

  String? _phoneNumber;
  int? clientId;

  List<GlobalKey<FormBuilderState>> get _formKeys =>
      OnboardingSteps.values.map((_) => GlobalKey<FormBuilderState>()).toList();

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
            phoneNumber: _phoneNumber!,
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

        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: AppPaddings.medium.all,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  // TODO: top bar
                  Flexible(
                    flex: 8,
                    child: Card(
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
                            child: _step == OnboardingSteps.intro.index
                                ? Opacity(
                                    opacity: 0.66,
                                    child: OrangeOutlinedTextButton(
                                      label: l10n.closeButtonText,
                                      onPressed: () {
                                        widget.onSubmitted(false);
                                      },
                                    ),
                                  )
                                : _step == OnboardingSteps.confirmation.index
                                    ? Container()
                                    : OrangeOutlinedTextButton(
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
                                child: LinearProgressIndicator(
                                  value: OnboardingSteps.values.length / _step,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 100,
                            child: _step == OnboardingSteps.confirmation.index
                                ? Container()
                                : OrangeSolidTextButton(
                                    label: l10n.nextButtonText,
                                    onPressed: () {
                                      // Skippable steps
                                      if (_step ==
                                              OnboardingSteps.intro.index ||
                                          _step ==
                                              OnboardingSteps
                                                  .documentsExplainer.index) {
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
                                        if (_step ==
                                            OnboardingSteps.personal.index) {
                                          // TODO: check if split into two calls on  backend, if not cache data here and post in OnboardingSteps.address
                                          if (values != null) {
                                            onboardingRepository
                                                .postPersonalData(values)
                                                .then((success) {
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
                                                _showUploadFailedDialog(
                                                    context);
                                              }
                                            });
                                          }
                                        }
                                        if (_step ==
                                            OnboardingSteps.address.index) {
                                          // TODO: check if split into two calls on  backend, if not append cached data from OnboardingSteps.personal
                                          if (values != null) {
                                            onboardingRepository
                                                .postPersonalData(values)
                                                .then((success) {
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
                                                _showUploadFailedDialog(
                                                    context);
                                              }
                                            });
                                          }
                                        }
                                        if (_step ==
                                            OnboardingSteps.phone.index) {
                                          if (values != null) {
                                            _phoneNumber =
                                                values["phoneNumber"];
                                            controller.jumpToPage(_step);
                                          }
                                        }
                                        if (_step ==
                                            OnboardingSteps
                                                .phoneVerification.index) {
                                          controller.jumpToPage(_step);
                                        }
                                        if (_step ==
                                            OnboardingSteps.idDocuments.index) {
                                          if (values != null) {
                                            _scannedIdPics =
                                                values.withNullsRemoved;
                                          }

                                          _validateIdDocuments(
                                                  values, progress.progress)
                                              .then((success) {
                                            if (success) {
                                              controller.jumpToPage(_step);
                                            }
                                          });
                                        }
                                        if (_step ==
                                            OnboardingSteps
                                                .driversLicense.index) {
                                          if (values != null) {
                                            _scannedDriversLicensePics =
                                                values.withNullsRemoved;
                                          }
                                          _validateDriversLicense(
                                                  values, progress.progress)
                                              .then((success) {
                                            if (success) {
                                              controller.jumpToPage(_step);
                                            }
                                          });
                                        }
                                        if (_step ==
                                            OnboardingSteps.legal.index) {
                                          // TODO: post if no convictions
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
                                        if (_step ==
                                            OnboardingSteps
                                                .legalDetails.index) {
                                          // TODO: post if user has convictions

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

  Future<bool> _validateIdDocuments(
      Map<String, dynamic>? values, int progress) async {
    if (values != null && values.isNotEmpty) {
      final success = await onboardingRepository.postIdFiles(values);
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

  Future<bool> _validateDriversLicense(
      Map<String, dynamic>? values, int progress) async {
    if (values != null && values.isNotEmpty) {
      final success = await onboardingRepository.postDriversLicense(values);
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
}
