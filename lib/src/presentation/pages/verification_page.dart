import 'dart:ui';

import 'package:batt_ds/batt_ds.dart';
import 'package:batt_onboarding/l10n/onboarding_localizations.dart';
import 'package:batt_onboarding/src/domain/onboarding_repository_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:pinput/pinput.dart';
import 'package:sealed_countries/sealed_countries.dart';
import 'onboarding_page.dart';

final class VerificationPage extends OnboardingPage {
  VerificationPage({
    super.key,
    required super.formKey,
    required super.onAction,
    super.initialData,
  });

  @override
  VerificationPageState createState() => VerificationPageState();
}

class VerificationPageState extends State<VerificationPage> {
  String? phoneNumber;
  bool isSendingPhone = false;
  bool isChecking = false;
  bool verified = false;

  int sendPhoneRetries = 0;
  int checkPhoneRetries = 0;

  late FocusNode pinFocusNode;

  @override
  void initState() {
    super.initState();

    pinFocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      textStyle: Theme.of(context)
          .textTheme
          .labelLarge!
          .copyWith(fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final errorPinTheme = PinTheme(
      textStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
          fontWeight: FontWeight.w600,
          color: Theme.of(context).colorScheme.error),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final l10n = OnboardingLocalizations.of(context);
    return SingleChildScrollView(
      child: Padding(
        padding: AppPaddings.large.trailing,
        child: FormBuilder(
          key: widget.formKey,
          child: Column(
            children: [
              Text(l10n.verificationPageTitle,
                  style: Theme.of(context).textTheme.headlineLarge),
              Padding(
                padding: AppPaddings.xxlarge.vertical,
                child: Text(
                    phoneNumber == null
                        ? l10n.verificationPageMessage
                        : l10n.verificationPageEnterCodeMessage(
                            phoneNumber ?? ""),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium),
              ),
              Stack(
                children: [
                  Visibility(
                    visible: (phoneNumber == null),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: AppPaddings.xxlarge.all,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  flex: 5,
                                  child: Expanded(
                                    child: FormBuilderDropdown(
                                      decoration: InputDecoration(
                                          contentPadding:
                                              AppPaddings.large.all),
                                      itemHeight: 80,
                                      validator:
                                          FormBuilderValidators.required(),
                                      name: "countryCode",
                                      initialValue: WorldCountry.fromCode("Bel")
                                          .idd
                                          .phoneCode(),
                                      items: WorldCountry.list
                                          .map((country) => DropdownMenuItem(
                                                child: Text(
                                                  "${country.emoji} ${country.idd.phoneCode()} ${country.name.common}",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge,
                                                ),
                                                value: country.idd.phoneCode(),
                                              ))
                                          .toList(),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 8,
                                  child: Padding(
                                    padding: AppPaddings.medium.leading,
                                    child: FormBuilderTextField(
                                      name: "phone",
                                      onSubmitted: (value) {
                                        setState(() {
                                          isSendingPhone = true;
                                        });
                                        if (widget.formKey.currentState!
                                            .saveAndValidate()) {
                                          setState(() async {
                                            phoneNumber = (widget
                                                    .formKey
                                                    .currentState!
                                                    .fields["countryCode"]!
                                                    .value as String) +
                                                (widget
                                                        .formKey
                                                        .currentState!
                                                        .fields["phone"]!
                                                        .value as String)
                                                    .replaceFirst("0", "");
                                            _sendPhone(context, phoneNumber!);
                                          });
                                        }
                                      },
                                      validator:
                                          FormBuilderValidators.phoneNumber(),
                                      style:
                                          context.typographyTheme.mediumTitle,
                                      decoration: InputDecoration(
                                          labelText: l10n.phoneFieldTitle,
                                          labelStyle: context
                                              .typographyTheme.mediumTitle),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: AppPaddings.medium.all,
                            child: OrangeSolidTextButton(
                                label: l10n.verificationPageVerifyButtonTitle,
                                onPressed: () {
                                  setState(() {
                                    isSendingPhone = true;
                                  });
                                  if (widget.formKey.currentState!
                                      .saveAndValidate()) {
                                    setState(() async {
                                      phoneNumber = (widget
                                              .formKey
                                              .currentState!
                                              .fields["countryCode"]!
                                              .value as String) +
                                          (widget
                                                  .formKey
                                                  .currentState!
                                                  .fields["phone"]!
                                                  .value as String)
                                              .replaceFirst("0", "");
                                      _sendPhone(context, phoneNumber!);
                                    });
                                  }
                                }),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                    visible: (phoneNumber != null),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: AppPaddings.large.all,
                            child: Pinput(
                              defaultPinTheme: defaultPinTheme,
                              errorPinTheme: errorPinTheme,
                              focusNode: pinFocusNode,
                              autofocus: true,
                              onCompleted: (code) async {
                                _sendCode(context, phoneNumber!, code);
                              },
                              length: 6,
                              errorTextStyle: context.typographyTheme.errorText,
                            ),
                          ),
                          Padding(
                            padding: AppPaddings.medium.all,
                            child: OrangeSimpleTextButton(
                                label: l10n.verificationPageVerificationResend,
                                onPressed: () async {
                                  _sendPhone(context, phoneNumber!);
                                }),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                    visible: isSendingPhone,
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                          child: Padding(
                            padding: AppPaddings.large.all,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: AppPaddings.large.all,
                                  child: Text(l10n.verificationPageBusyPhone,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium),
                                ),
                                Padding(
                                    padding: AppPaddings.medium.all,
                                    child: CircularProgressIndicator()),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: isChecking,
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                          child: Padding(
                            padding: AppPaddings.large.all,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: AppPaddings.large.all,
                                  child: Text(l10n.verificationPageBusyCode,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium),
                                ),
                                Padding(
                                    padding: AppPaddings.medium.all,
                                    child: CircularProgressIndicator()),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    pinFocusNode.dispose();
    super.dispose();
  }

  void _sendPhone(BuildContext context, String phoneNumber) async {
    setState(() {
      isSendingPhone = true;
    });
    final requested = await onboardingRepository.postPhoneNumber(phoneNumber);
    await Future.delayed(Duration(seconds: 2));
    pinFocusNode.requestFocus();
    setState(() {
      isSendingPhone = false;
    });

    if (!requested) {
      if (sendPhoneRetries < 3) {
        sendPhoneRetries++;
        _sendPhone(context, phoneNumber);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          BattSnackbar.error(
                  title: OnboardingLocalizations.of(context)
                      .verificationPageSendCodeFailed)
              .build(context),
        );
      }
    }
  }

  void _sendCode(BuildContext context, String phoneNumber, String code) async {
    setState(() {
      isChecking = true;
    });
    final success =
        await onboardingRepository.postVerificationCode(phoneNumber, code);
    if (success) {
      widget.onAction({});
    } else {
      if (checkPhoneRetries < 3) {
        checkPhoneRetries++;
        _sendCode(context, phoneNumber, code);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          BattSnackbar.error(
                  title: OnboardingLocalizations.of(context)
                      .verificationPageCheckPhoneFailed)
              .build(context),
        );
      }
    }
  }
}
