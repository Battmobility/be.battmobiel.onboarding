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

  @override
  Widget build(BuildContext context) {
    final l10n = OnboardingLocalizations.of(context);
    final isPortrait =
        MediaQuery.of(context).size.height > MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: AppPaddings.large.trailing,
            child: FormBuilder(
              key: widget.formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(l10n.phoneEntryPageTitle,
                      style: Theme.of(context).textTheme.headlineLarge),
                  Padding(
                    padding: AppPaddings.xxlarge.vertical,
                    child: Text(l10n.verificationPageMessage,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge),
                  ),
                  if (!isSendingPhone)
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Country code and phone number fields
                        if (isPortrait)
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              FormBuilderDropdown<String>(
                                decoration: InputDecoration(
                                    contentPadding: AppPaddings.large.all),
                                itemHeight: 80,
                                validator: FormBuilderValidators.required(),
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
                              SizedBox(height: AppSpacings.sm),
                              FormBuilderTextField(
                                name: "phone",
                                initialValue:
                                    widget.initialData?["phoneNumber"],
                                onSubmitted: _onPhoneSubmitted,
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                  FormBuilderValidators.phoneNumber(),
                                  FormBuilderValidators.equalLength(10)
                                ]),
                                style: context.typographyTheme.titleMedium,
                                decoration: InputDecoration(
                                    labelText: l10n.phoneFieldTitle,
                                    labelStyle:
                                        context.typographyTheme.titleMedium),
                              ),
                            ],
                          )
                        else
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: 150,
                                child: FormBuilderDropdown<String>(
                                  decoration: InputDecoration(
                                      contentPadding: AppPaddings.large.all),
                                  itemHeight: 80,
                                  validator: FormBuilderValidators.required(),
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
                              SizedBox(width: AppSpacings.sm),
                              Expanded(
                                child: FormBuilderTextField(
                                  name: "phone",
                                  initialValue:
                                      widget.initialData?["phoneNumber"],
                                  onSubmitted: _onPhoneSubmitted,
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(),
                                    FormBuilderValidators.phoneNumber(),
                                    FormBuilderValidators.equalLength(10,
                                        errorText:
                                            "Phone number must be exactly 10 digits (04...)"),
                                  ]),
                                  style: context.typographyTheme.titleMedium,
                                  decoration: InputDecoration(
                                      labelText: l10n.phoneFieldTitle,
                                      labelStyle:
                                          context.typographyTheme.titleMedium),
                                ),
                              ),
                            ],
                          ),

                        // Hidden field to store the full phone number
                        FormBuilderField(
                          builder: ((_) => Container()),
                          name: "phoneNumber",
                        ),

                        Padding(
                          padding: AppPaddings.medium.all,
                          child: SolidCtaButton(
                            label: l10n.verificationPageVerifyButtonTitle,
                            onPressed: _onVerifyButtonPressed,
                          ),
                        ),
                      ],
                    )
                  else
                    Center(
                      child: Container(
                        padding: AppPaddings.large.all,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(CornerRadii.m.x),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: AppPaddings.large.all,
                              child: Text(l10n.verificationPageBusyPhone,
                                  style:
                                      Theme.of(context).textTheme.titleMedium),
                            ),
                            Padding(
                              padding: AppPaddings.medium.all,
                              child: CircularProgressIndicator(),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

// Extract methods to simplify the build method
  void _onPhoneSubmitted(String? value) {
    setState(() {
      isSendingPhone = true;
    });
    final countryCode =
        widget.formKey.currentState?.fields["countryCode"]?.value as String? ??
            "+32";
    final phone =
        widget.formKey.currentState?.fields["phone"]?.value as String? ?? "";
    phoneNumber = countryCode + phone.replaceFirst("0", "");
    _sendPhone(context, phoneNumber ?? "");
  }

  void _onVerifyButtonPressed() async {
    setState(() {
      isSendingPhone = true;
    });
    final phoneFieldText =
        (widget.formKey.currentState?.fields["phone"]?.value as String? ?? "")
            .replaceFirst("0", "");
    if (phoneFieldText.startsWith("+")) {
      await _sendPhone(context, phoneFieldText);
    } else {
      final countryCode = widget
              .formKey.currentState?.fields["countryCode"]?.value as String? ??
          "+32";
      phoneNumber = countryCode + phoneFieldText;
      await _sendPhone(context, phoneNumber ?? "");
    }
  }

  Future<void> _sendPhone(BuildContext context, String phoneNumber) async {
    try {
      final success = await onboardingRepository.postPhoneNumber(phoneNumber);
      setState(() {
        isSendingPhone = false;
      });

      if (success) {
        widget.formKey.currentState?.fields["phoneNumber"]
            ?.didChange(phoneNumber);
        widget.onAction({"phoneNumber": phoneNumber});
      } else {
        // Show error message for failed API call
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            BattSnackbar.error(
              message: OnboardingLocalizations.of(context)
                  .verificationPageSendCodeFailed,
            ).build(context),
          );
        }
      }
    } catch (e) {
      setState(() {
        isSendingPhone = false;
      });
      // Show error message for exception
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(OnboardingLocalizations.of(context)
                .verificationPageSendCodeFailed),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }
}
