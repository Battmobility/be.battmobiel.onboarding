import 'package:batt_ds/batt_ds.dart';
import 'package:batt_onboarding/batt_onboarding.dart';
import 'package:batt_onboarding/l10n/onboarding_localizations.dart';
import 'package:batt_onboarding/src/domain/onboarding_repository_provider.dart';
import 'package:batt_onboarding/src/domain/subscription.dart';
import 'package:batt_onboarding/src/presentation/pages/formula_picker_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:sealed_countries/sealed_countries.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../util/analytics/analytics_events.dart';
import 'onboarding_page.dart';

const String _appStoreUrl =
    'https://apps.apple.com/us/app/battmobility/id1499493665';
const String _playStoreUrl =
    'https://play.google.com/store/apps/details?id=be.battmobiel.android_app';

final class CreateClientPage extends OnboardingPage {
  final businessClientFormKey = GlobalKey<FormBuilderState>();
  CreateClientPage({
    super.key,
    required super.formKey,
    required super.onAction,
    required super.initialData,
    super.analyticsAction = AnalyticsAction.createClient,
  });

  @override
  CreateClientPageState createState() => CreateClientPageState();
}

class CreateClientPageState extends State<CreateClientPage> {
  bool _showBusinessForm = true;
  bool _showEmployeeFamilyMessage = true;

  @override
  Widget build(BuildContext context) {
    final l10n = OnboardingLocalizations.of(context);

    return FutureBuilder<OnboardingProgress?>(
        future: onboardingRepository.getOnboardingProgress(),
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: CircularProgressIndicator());
          }
          OnboardingProgress progress = snapshot.data!;
          return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _employeeFamilyMessage(),
                _finishedContracts(progress.subscriptions),
                _formChildren(progress.subscriptions),
                FormBuilder(
                    key: widget.formKey,
                    child: Column(
                      children: [
                        FormField(
                          builder: (_) {
                            return SizedBox.shrink();
                          },
                          validator: (_) {
                            // Simplified validation - just check if there are any incomplete contracts
                            final subsWithoutContract = progress.subscriptions
                                .where(
                                    (sub) => sub.subscriptionContract == null);
                            return subsWithoutContract.isEmpty
                                ? null
                                : "Please complete all contracts before continuing";
                          },
                        ),
                      ],
                    ))
              ]);
        });
  }

  Widget _employeeFamilyMessage() {
    final l10n = OnboardingLocalizations.of(context);

    if (!_showEmployeeFamilyMessage) {
      return SizedBox.shrink();
    }

    return FutureBuilder<OnboardingProgress?>(
      future: onboardingRepository.getOnboardingProgress(),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data == null) {
          return SizedBox.shrink();
        }

        final progress = snapshot.data!;
        final hasFinishedContract = progress.subscriptions
            .any((sub) => sub.subscriptionContract != null);

        if (hasFinishedContract) {
          return SizedBox.shrink();
        }

        return Padding(
          padding: AppPaddings.medium.vertical,
          child: Card(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Padding(
              padding: AppPaddings.medium.all,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.info_outline,
                    color: Theme.of(context).colorScheme.surface,
                    size: 20,
                  ),
                  SizedBox(width: AppSpacings.sm),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        children: _parseEmailInText(
                            l10n.createClientEmployeeFamilyMessage, context),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _showEmployeeFamilyMessage = false;
                      });
                    },
                    child: Icon(
                      Icons.close,
                      color: Theme.of(context).colorScheme.surface,
                      size: 20,
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

  List<TextSpan> _parseEmailInText(String text, BuildContext context) {
    final List<TextSpan> spans = [];
    final RegExp emailRegex =
        RegExp(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b');
    int lastIndex = 0;

    for (final Match match in emailRegex.allMatches(text)) {
      // Add text before the email
      if (match.start > lastIndex) {
        spans.add(TextSpan(
          text: text.substring(lastIndex, match.start),
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.surface,
              ),
        ));
      }

      // Add the email as clickable link
      spans.add(TextSpan(
        text: match.group(0),
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.surface,
              decoration: TextDecoration.underline,
              decorationColor: Theme.of(context).colorScheme.surface,
            ),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            launchUrl(Uri.parse('mailto:${match.group(0)}'));
          },
      ));

      lastIndex = match.end;
    }

    // Add remaining text after the last email
    if (lastIndex < text.length) {
      spans.add(TextSpan(
        text: text.substring(lastIndex),
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
      ));
    }

    return spans;
  }

  Widget _finishedContracts(List<Subscription> subscriptions) {
    final l10n = OnboardingLocalizations.of(context);

    final finishedSubscriptions =
        subscriptions.where((sub) => sub.subscriptionContract != null);
    if (finishedSubscriptions.isNotEmpty) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AppSpacings.md,
        children: [
          const SizedBox(height: AppSpacings.xs),
          Text(l10n.addSubscriptionFormLabelExistingContracts,
              style: Theme.of(context).textTheme.titleMedium),
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: AppSpacings.md,
              children: finishedSubscriptions.map((sub) {
                if (sub.clientSuspended == true) {
                  return Padding(
                    padding: EdgeInsets.only(left: AppSpacings.lg),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: AppSpacings.xs,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          spacing: AppSpacings.sm,
                          children: [
                            Text(
                              "• ",
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Text(
                              sub.clientName!,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Text(sub.subscriptionContract!.subscriptionType!,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(fontWeight: FontWeight.bold)),
                            Icon(Icons.pending, color: AppColors.b2cKeyColor),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: AppSpacings.md),
                          child: Text(
                            l10n.contractVerificationInProgress,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: AppColors.b2cKeyColor),
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Padding(
                    padding: EdgeInsets.only(left: AppSpacings.lg),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      spacing: AppSpacings.sm,
                      children: [
                        Text(
                          "• ",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          sub.clientName!,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(sub.subscriptionContract!.subscriptionType!,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontWeight: FontWeight.bold)),
                        Icon(Icons.check_circle, color: AppColors.b2cKeyColor),
                      ],
                    ),
                  );
                }
              }).toList(),
            ),
          )
        ],
      );
    }

    return SizedBox.shrink();
  }

  Widget _formChildren(List<Subscription> subscriptions) {
    final subsWithoutContract = subscriptions
        .where((sub) => sub.subscriptionContract == null)
        .toList()
      ..sort((a, b) => (b.clientId ?? 0)
          .compareTo(a.clientId ?? 0)); // Sort by clientId descending

    // Auto-hide business form if there are 2+ subscriptions (only on first build)
    if (subscriptions.length >= 2 && _showBusinessForm) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          _showBusinessForm = false;
        });
      });
    }

    // Check if all subscriptions have contracts (onboarding completed)
    final allSubscriptionsComplete =
        subscriptions.isNotEmpty && subsWithoutContract.isEmpty;

    return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Show completion message if all subscriptions have contracts
          if (allSubscriptionsComplete) _onboardingCompletedWidget(),
          // Show business form or collapse button when less than 2 subscriptions
          if (!allSubscriptionsComplete && subscriptions.length < 2) ...[
            if (_showBusinessForm)
              _businessClientForm()
            else
              _showBusinessFormButton(),
          ],
          // Show CTAs for each subscription without contract
          if (!allSubscriptionsComplete)
            ...subsWithoutContract.asMap().entries.map((entry) {
              final index = entry.key;
              final sub = entry.value;
              return _simplifiedClientCta(sub, isEnabled: index == 0);
            })
        ]);
  }

  Widget _onboardingCompletedWidget() {
    final l10n = OnboardingLocalizations.of(context);

    return Padding(
      padding: AppPaddings.medium.top,
      child: Card(
        elevation: 8,
        child: Padding(
          padding: AppPaddings.large.all,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle,
                size: 64,
                color: AppColors.b2cKeyColor,
              ),
              SizedBox(height: AppSpacings.lg),
              Text(
                l10n.onboardingCompletedTitle,
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: AppColors.b2cKeyColor,
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: AppSpacings.md),
              Text(
                l10n.onboardingCompletedMessage,
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: AppSpacings.lg),
              Wrap(
                spacing: AppSpacings.md,
                runSpacing: AppSpacings.md,
                children: [
                  GestureDetector(
                    onTap: () => _launchAppStore(),
                    child: Text(
                      l10n.onboardingCompletedAppStoreLink,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.b2cKeyColor,
                            decoration: TextDecoration.underline,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _launchPlayStore(),
                    child: Text(
                      l10n.onboardingCompletedPlayStoreLink,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.b2cKeyColor,
                            decoration: TextDecoration.underline,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchAppStore() async {
    final Uri uri = Uri.parse(_appStoreUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Could not launch App Store'),
            duration: Duration(seconds: 3),
          ),
        );
      }
    }
  }

  Future<void> _launchPlayStore() async {
    final Uri uri = Uri.parse(_playStoreUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Could not launch Play Store'),
            duration: Duration(seconds: 3),
          ),
        );
      }
    }
  }

  Widget _showBusinessFormButton() {
    return Padding(
      padding: AppPaddings.medium.vertical,
      child: OutlinedCtaButton(
        label: OnboardingLocalizations.of(context).addBusinessInfo,
        onPressed: () {
          setState(() {
            _showBusinessForm = true;
          });
        },
      ),
    );
  }

  Widget _simplifiedClientCta(Subscription subscription,
      {required bool isEnabled}) {
    final l10n = OnboardingLocalizations.of(context);

    return Padding(
      padding: AppPaddings.medium.vertical,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            subscription.clientName ?? "Unknown Client",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(height: AppSpacings.sm),
          Opacity(
            opacity: isEnabled ? 1.0 : 0.5,
            child: SolidCtaButton(
              label: l10n.createContractPickFormulaLabel,
              onPressed: isEnabled
                  ? () {
                      _showContractPicker(context, subscription);
                    }
                  : null,
            ),
          ),
        ],
      ),
    );
  }

  Widget _businessClientForm() {
    final l10n = OnboardingLocalizations.of(context);

    return FormBuilder(
      key: widget.businessClientFormKey,
      child: Padding(
        padding: AppPaddings.medium.vertical,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: AppPaddings.medium.vertical,
                        child: Text(l10n.addSubscriptionFormMessageBusinessUse,
                            style: Theme.of(context).textTheme.titleMedium),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 80,
                  child: OutlinedCtaButton(
                    label: l10n.skip,
                    onPressed: () {
                      setState(() {
                        _showBusinessForm = false;
                      });
                    },
                  ),
                ),
              ],
            ),
            FormBuilderTextField(
              decoration:
                  InputDecoration(labelText: l10n.addSubscriptionFormName),
              name: "name",
              validator: FormBuilderValidators.required(),
              textInputAction: TextInputAction.next,
            ),
            FormBuilderTextField(
              decoration:
                  InputDecoration(labelText: l10n.addSubscriptionFormVAT),
              name: "vat",
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.skipWhen((value) {
                  return value == null || value.isEmpty;
                }, FormBuilderValidators.minLength(9)),
                FormBuilderValidators.skipWhen((value) {
                  return value == null || value.isEmpty;
                }, FormBuilderValidators.maxLength(15)),
              ]),
              textInputAction: TextInputAction.next,
            ),
            FormBuilderTextField(
              decoration:
                  InputDecoration(labelText: l10n.addSubscriptionFormEmail),
              name: "email",
              initialValue: widget.initialData?["email"] ?? "",
              validator: FormBuilderValidators.email(),
              textInputAction: TextInputAction.next,
            ),
            FormBuilderTextField(
              decoration:
                  InputDecoration(labelText: l10n.addSubscriptionFormStreet),
              name: "street",
              initialValue: widget.initialData?["street"] ?? "",
              validator: FormBuilderValidators.required(),
              textInputAction: TextInputAction.next,
            ),
            FormBuilderTextField(
              decoration: InputDecoration(
                  labelText: l10n.addSubscriptionFormHouseNumber),
              name: "houseNumber",
              initialValue:
                  "${widget.initialData?["houseNumber"] ?? ""} ${widget.initialData?["box"] ?? ""}",
              validator: FormBuilderValidators.required(),
              textInputAction: TextInputAction.next,
            ),
            FormBuilderTextField(
              decoration:
                  InputDecoration(labelText: l10n.addSubscriptionFormCity),
              name: "city",
              initialValue: widget.initialData?["city"] ?? "",
              validator: FormBuilderValidators.required(),
              textInputAction: TextInputAction.next,
            ),
            FormBuilderDropdown(
              validator: FormBuilderValidators.required(),
              name: "country",
              initialValue: widget.initialData?["country"] ??
                  WorldCountry.fromCode("Bel").iso3166oneAlpha2,
              items: WorldCountry.list
                  .map((country) => DropdownMenuItem(
                        child: Text(
                          "${country.emoji} ${country.name.common}",
                          style: Theme.of(context).textTheme.bodyLarge!,
                        ),
                        value: country.iso3166oneAlpha2,
                      ))
                  .toList(),
            ),
            FormBuilderTextField(
              decoration: InputDecoration(
                  labelText: l10n.addSubscriptionFormPostalCode),
              name: "postalCode",
              initialValue: widget.initialData?["postalCode"] ?? "",
              validator: FormBuilderValidators.required(),
              textInputAction: TextInputAction.next,
            ),
            SolidCtaButton(
              label: l10n.addBusinessInfo,
              onPressed: () async {
                if (widget.businessClientFormKey.currentState!
                    .saveAndValidate()) {
                  final values =
                      widget.businessClientFormKey.currentState?.value;
                  if (values != null) {
                    final clientId =
                        await onboardingRepository.postNewClientData(values);
                    if (clientId != null) {
                      // Client created successfully, refresh the page
                      setState(() {});
                    } else {
                      _showCreateClientFailedDialog(context);
                    }
                  }
                }
              },
            )
          ]
              .map((field) =>
                  Padding(padding: AppPaddings.medium.vertical, child: field))
              .toList(),
        ),
      ),
    );
  }

  Future<void> _showContractPicker(
      BuildContext context, Subscription subscription) async {
    showDialog(
        context: context,
        builder: (_) {
          return Dialog(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: 600,
                maxHeight: MediaQuery.of(context).size.height * 0.8,
              ),
              child: FormulaPickerPage(
                subscription: subscription,
                onContractCreated: () {
                  Navigator.of(context).pop();
                  // Refresh the page to show updated state
                  setState(() {});
                },
              ),
            ),
          );
        });
  }

  void _showCreateClientFailedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(
            OnboardingLocalizations.of(context).addSubscriptionFormFailure,
            style: Theme.of(context).textTheme.bodyLarge),
        actions: [
          SolidCtaButton(label: "Ok", onPressed: () => Navigator.of(ctx).pop())
        ],
      ),
    );
  }
}
