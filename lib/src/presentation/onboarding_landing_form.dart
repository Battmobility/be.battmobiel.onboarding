import 'package:batt_ds/batt_ds.dart';
import 'package:batt_onboarding/l10n/onboarding_localizations.dart';
import 'package:batt_onboarding/src/data/api_factory.dart';
import 'package:batt_onboarding/src/data/token_service.dart';
import 'package:batt_onboarding/src/domain/onboarding_progress.dart';
import 'package:batt_onboarding/src/domain/onboarding_repository_provider.dart';
import 'package:batt_onboarding/src/util/file_too_large_exception.dart';
import 'package:batt_onboarding/src/presentation/pages/address_page.dart';
import 'package:batt_onboarding/src/presentation/pages/create_client_page.dart';
import 'package:batt_onboarding/src/presentation/pages/id_documents_page.dart';
import 'package:batt_onboarding/src/presentation/pages/legal_details_page.dart';
import 'package:batt_onboarding/src/presentation/pages/onboarding_page.dart';
import 'package:batt_onboarding/src/presentation/pages/phone_verification_page.dart';
import 'package:batt_onboarding/src/presentation/pages/personal_page.dart';
import 'package:batt_onboarding/src/presentation/pages/intro_page.dart';
import 'package:batt_onboarding/src/presentation/widgets/onboarding_form_footer.dart';
import 'package:batt_onboarding/src/util/analytics/analytics_events.dart';
import 'package:batt_onboarding/src/util/analytics/analytics_util.dart';
import 'package:batt_onboarding/src/util/nonnull_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'onboarding_steps.dart';
import 'pages/phone_entry_page.dart';
import 'widgets/onboarding_form_header.dart';

class OnboardingLandingForm extends StatefulWidget {
  final Function(Object) onAuthenticationError;
  final Function(bool) onSubmitted;

  OnboardingLandingForm({
    String? apiUri,
    required String token,
    required this.onAuthenticationError,
    required this.onSubmitted,
    Function(
      String name,
      String? action,
      int timeStamp,
      Map<String, dynamic>? data,
    )? onTrackEvent,
    Function(String name)? onTrackPageView,
  }) {
    TokenService(token);
    ApiFactory.init(apiUri: apiUri);
    Analyticsutil.init(
        onTrackEvent: onTrackEvent, onTrackPageView: onTrackPageView);
  }

  @override
  OnboardingLandingFormState createState() {
    return OnboardingLandingFormState();
  }
}

class OnboardingLandingFormState extends State<OnboardingLandingForm> {
  int _step = 0;
  DateTime? startedAt;
  Map<String, dynamic>? _scannedIdPics;
  Map<String, dynamic>? _scannedDriversLicensePics;
  Map<String, dynamic>? _personalData;

  String _phoneNumber = "";
  int? clientId;

  late PageController controller;

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

        // Initialize phone number from progress if available
        if (_phoneNumber.isEmpty && progress.phone["phoneNumber"] != null) {
          _phoneNumber = progress.phone["phoneNumber"]!;
        }

        // If onboarding is completed, go directly to CreateClientPage
        if (progress.progress == 5 && _step == 0) {
          _step = OnboardingSteps.createClient.index;
        }

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
            initialData: progress.phone,
            onAction: (data) {
              _phoneNumber = data["phoneNumber"]!;
              setState(() {
                _step++;
              });
              controller.jumpToPage(_step);
            },
          ),
          PhoneVerificationPage(
            phoneNumber: _phoneNumber.isNotEmpty ? _phoneNumber : "PLACEHOLDER",
            formKey: _formKeys[OnboardingSteps.phoneVerification.index],
            onAction: (_) {
              setState(() {
                _step++;
              });
              controller.jumpToPage(_step);
            },
          ),
          IdDocumentsPage(
            formKey: _formKeys[OnboardingSteps.idDocuments.index],
            onAction: (_) {},
            prefilled:
                false, // TODO: use progress and possible back id data from personal data page
          ),
          LegalDetailsPage(
            formKey: _formKeys[OnboardingSteps.legal.index],
            onAction: (_) {},
            initialData: progress.legal,
          ),
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
        ];

        controller = PageController(
          initialPage: _step,
          keepPage: true,
        );
        controller.addListener(() {
          if (_step == 0 && startedAt == null) {
            Analyticsutil.start();
          }
          if (Analyticsutil.instance.onTrackPageView != null) {
            Analyticsutil
                .instance.onTrackPageView!(OnboardingSteps.values[_step].name);
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
                  title: _getLocalizedStepTitle(
                      context, OnboardingSteps.values[_step]),
                  progress: ((_step + 1).toDouble() /
                      OnboardingSteps.values.length.toDouble()),
                  backButtonEnabled: _step != OnboardingSteps.intro.index &&
                      _step != OnboardingSteps.createClient.index,
                  onbackPressed: () {
                    setState(() {
                      _step--;
                    });
                    Analyticsutil.trackEvent(
                      name: OnboardingSteps.values[_step].name,
                      action: AnalyticsAction.goBack,
                    );
                    controller.jumpToPage(_step);
                  },
                ),
                Divider(thickness: 0.5),
                Expanded(
                  flex: 12,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: AppPaddings.xxlarge.horizontal,
                      child: PageView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          controller: controller,
                          itemBuilder: (context, index) => pages[index],
                          itemCount: pages.length),
                    ),
                  ),
                ),
                Divider(thickness: 0.5),
                Expanded(
                    flex: OnboardingSteps.values[_step].canSkip ? 3 : 2,
                    child: OnboardingFormFooter(
                      showLaterButton: OnboardingSteps.values[_step].canSkip,
                      showNextButton: OnboardingSteps.values[_step].hasNext,
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
                                    OutlinedCtaButton(
                                        label: l10n
                                            .continueLaterDialogOptionContinueNow,
                                        onPressed: () {
                                          Navigator.of(ctx).pop();
                                        }),
                                    SizedBox(height: AppSpacings.sm),
                                    SolidCtaButton(
                                        label: l10n
                                            .continueLaterDialogOptionContinueLater,
                                        onPressed: () {
                                          Navigator.of(ctx).pop();

                                          Analyticsutil.trackEvent(
                                            action:
                                                AnalyticsAction.exitOnboarding,
                                            name: OnboardingSteps
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
          resizeToAvoidBottomInset: false,
        );
      },
    );
  }

  void _nextStep(
    PageController controller,
    List<OnboardingPage> pages,
    OnboardingProgress progress,
  ) {
    final analyticsAction = pages[_step].analyticsAction;
    Analyticsutil.trackEvent(
      action: analyticsAction,
      name: OnboardingSteps.values[_step].name,
    );
    // Skippable steps
    if (_step == OnboardingSteps.intro.index) {
      setState(() {
        _step++;
      });
      controller.jumpToPage(_step);
    } else if (pages[_step].formKey.currentState?.saveAndValidate() ?? false) {
      final values = pages[_step].formKey.currentState?.value;
      if (_step == OnboardingSteps.personal.index) {
        _personalData = values;

        setState(() {
          _step++;
        });

        controller.jumpToPage(_step);
        return;
      }
      if (_step == OnboardingSteps.address.index) {
        if (values != null) {
          var combinedMaps = Map<String, dynamic>.from(_personalData ?? {});
          combinedMaps.addAll(values);
          onboardingRepository.postPersonalData(combinedMaps).then((success) {
            if (success) {
              setState(() {
                _step++;
              });

              controller.jumpToPage(_step);
              return;
            } else {
              _showUploadFailedDialog(context);
            }
          });
        }
      }

      // phone steps have no next button

      if (_step == OnboardingSteps.idDocuments.index) {
        if (values != null) {
          _scannedIdPics = values.withNullsRemoved;
        }

        _validateIdDocuments(values, progress.progress).then((success) {
          if (success) {
            controller.jumpToPage(_step);
            return;
          }
        });
      }

      if (_step == OnboardingSteps.legal.index) {
        if (values != null) {
          onboardingRepository.postConvictions(values).then((success) {
            if (success) {
              setState(() {
                _step++;
              });
              controller.jumpToPage(_step);

              return;
            } else {
              _showUploadFailedDialog(context);
            }
          });
        }
      }
      if (_step == OnboardingSteps.createClient.index) {
        if (values != null) {
          onboardingRepository.postNewClientData(values).then((newClientId) {
            if (newClientId != null) {
              clientId = newClientId;
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
    } else {
      _showIncompleteFormDialog(context);
    }
  }

  Future<bool> _validateIdDocuments(
      Map<String, dynamic>? values, int progress) async {
    if (values != null && values.isNotEmpty) {
      try {
        final success = await onboardingRepository.postIdFiles(values);
        if (success || progress > 1) {
          setState(() {
            _step++;
          });
          Analyticsutil.trackEvent(
              name: "upload_id", action: AnalyticsAction.uploadId);
        } else {
          _showUploadFailedDialog(context);
        }
        return success || progress > 1;
      } catch (e) {
        if (e is FileTooLargeException) {
          _showFileTooLargeError(context);
        } else {
          _showUploadFailedDialog(context);
        }
        return false;
      }
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
          SolidCtaButton(label: "Ok", onPressed: () => Navigator.of(ctx).pop())
        ],
      ),
    );
  }

  String _getLocalizedStepTitle(BuildContext context, OnboardingSteps step) {
    final l10n = OnboardingLocalizations.of(context);

    switch (step) {
      case OnboardingSteps.intro:
        return l10n.onboardingStepIntro;
      case OnboardingSteps.personal:
        return l10n.onboardingStepPersonal;
      case OnboardingSteps.address:
        return l10n.onboardingStepAddress;
      case OnboardingSteps.phone:
        return l10n.onboardingStepPhone;
      case OnboardingSteps.phoneVerification:
        return l10n.onboardingStepPhoneVerification;
      case OnboardingSteps.idDocuments:
        return l10n.onboardingStepIdDocuments;
      case OnboardingSteps.legal:
        return l10n.onboardingStepLegal;
      case OnboardingSteps.createClient:
        return l10n.onboardingStepCreateClient;
    }
  }

  void _showUploadFailedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(OnboardingLocalizations.of(context).errorPostingMessage,
            style: Theme.of(context).textTheme.bodyLarge),
        actions: [
          SolidCtaButton(label: "Ok", onPressed: () => Navigator.of(ctx).pop())
        ],
      ),
    );
  }

  void _showFileTooLargeError(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      BattSnackbar.error(
        message: OnboardingLocalizations.of(context).documentsFileTooLargeError,
      ).build(context),
    );
  }
}
