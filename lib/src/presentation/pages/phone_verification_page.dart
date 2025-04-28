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

final class PhoneVerificationPage extends OnboardingPage {
  final String phoneNumber;
  PhoneVerificationPage({
    super.key,
    required this.phoneNumber,
    required super.formKey,
    required super.onAction,
    super.initialData,
  });

  @override
  PhoneVerificationPageState createState() => PhoneVerificationPageState();
}

class PhoneVerificationPageState extends State<PhoneVerificationPage> {
  bool isChecking = false;
  bool isSendingPhone = false;
  bool verified = false;

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
                    l10n.verificationPageEnterCodeMessage(widget.phoneNumber),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium),
              ),
              Stack(
                children: [
                  Center(
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
                              _sendCode(context, widget.phoneNumber, code);
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
                                _sendPhone(context, widget.phoneNumber);
                              }),
                        ),
                      ],
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
    await onboardingRepository.postPhoneNumber(phoneNumber);
    await Future.delayed(Duration(seconds: 2));
    pinFocusNode.requestFocus();
    setState(() {
      isSendingPhone = false;
    });
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
