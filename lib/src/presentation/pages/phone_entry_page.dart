import 'dart:ui';

import 'package:batt_ds/batt_ds.dart';
import 'package:batt_onboarding/l10n/onboarding_localizations.dart';
import 'package:batt_onboarding/src/domain/onboarding_repository_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:sealed_countries/sealed_countries.dart';
import '../../util/analytics/analytics_events.dart';
import 'onboarding_page.dart';

final class PhoneEntryPage extends OnboardingPage {
  PhoneEntryPage({
    super.key,
    required super.formKey,
    required super.onAction,
    super.initialData,
    super.analyticsAction = AnalyticsAction.enterPhone,
  });

  @override
  PhoneEntryPageState createState() => PhoneEntryPageState();
}

class PhoneEntryPageState extends State<PhoneEntryPage> {
  String? phoneNumber;
  bool isSendingPhone = false;
  bool isChecking = false;
  bool verified = false;

  int sendPhoneRetries = 0;
  int checkPhoneRetries = 0;

  @override
  void initState() {
    super.initState();
  }

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
              Text(l10n.phoneEntryPageTitle,
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
                                          context.typographyTheme.titleMedium,
                                      decoration: InputDecoration(
                                          labelText: l10n.phoneFieldTitle,
                                          labelStyle: context
                                              .typographyTheme.titleMedium),
                                    ),
                                  ),
                                ),
                                FormBuilderField(
                                  builder: ((_) => Container()),
                                  name: "phoneNumber",
                                )
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

  void _sendPhone(BuildContext context, String phoneNumber) async {
    setState(() {
      isSendingPhone = true;
    });
    final requested = await onboardingRepository.postPhoneNumber(phoneNumber);
    await Future.delayed(Duration(seconds: 2));

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
    } else {
      widget.formKey.currentState!.fields["phoneNumber"]!
          .didChange(phoneNumber);
    }
  }
}
