import 'package:batt_ds/batt_ds.dart';
import 'package:batt_onboarding/l10n/onboarding_localizations.dart';
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

  bool isChecking = false;
  @override
  Widget build(BuildContext context) {
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
                                  flex: 3,
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
                                  flex: 6,
                                  child: Padding(
                                    padding: AppPaddings.medium.leading,
                                    child: FormBuilderTextField(
                                      name: "phone",
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
                                  if (widget.formKey.currentState!
                                      .saveAndValidate()) {
                                    setState(() {
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
                                    });
                                    // TODO: send phone to API and set _isChecking to true
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
                              onSubmitted: (value) {
                                // TODO: check code and set isChecking to false
                              },
                              length: 6,
                              errorTextStyle: context.typographyTheme.errorText,
                            ),
                          ),
                          Padding(
                            padding: AppPaddings.medium.all,
                            child: OrangeSolidTextButton(
                                label: l10n.verificationPageVerifyButtonTitle,
                                onPressed: () {
                                  // TODO: check code and set isChecking to false
                                }),
                          ),
                          Padding(
                            padding: AppPaddings.medium.all,
                            child: OrangeSimpleTextButton(
                                label: l10n.verificationPageVerificationResend,
                                onPressed: () {
                                  // TODO: resend
                                }),
                          ),
                        ],
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
