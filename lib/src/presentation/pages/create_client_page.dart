import 'package:batt_ds/batt_ds.dart';
import 'package:batt_onboarding/batt_onboarding.dart';
import 'package:batt_onboarding/l10n/onboarding_localizations.dart';
import 'package:batt_onboarding/src/domain/onboarding_repository_provider.dart';
import 'package:batt_onboarding/src/domain/subscription.dart';
import 'package:batt_onboarding/src/presentation/pages/formula_picker_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:sealed_countries/sealed_countries.dart';

import '../../util/analytics/analytics_events.dart';
import 'onboarding_page.dart';

final class CreateClientPage extends OnboardingPage {
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
  bool _isBusinessUse = true;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: onboardingRepository.getOnboardingProgress(),
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: CircularProgressIndicator());
          }
          OnboardingProgress progress = snapshot.data!;
          return Padding(
            padding: AppPaddings.large.trailing,
            child: SingleChildScrollView(
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: _formChildren(progress.subscriptions)),
            ),
          );
        });
  }

  List<Widget> _formChildren(List<Subscription> subscriptions) {
    final l10n = OnboardingLocalizations.of(context);

    if (subscriptions.length == 1) {
      // Offer VAT
      if (subscriptions.first.clientId == null) {
        _isBusinessUse = true;
        return [_businessClientForm(subscriptions.first)];
      } else {
        return [SizedBox.shrink()];
      }
    } else if (!_isBusinessUse) {
      // Create client and show formula picker
      return [_standardClientForm(subscriptions.first)];
    } else {
      // Show created client(s)?
      return [
        SolidCtaButton(
          label: l10n.doneButtonText,
          onPressed: () async {
            widget.onAction({});
          },
        )
      ];
    }
  }

  Widget _businessClientForm(Subscription subscription) {
    final l10n = OnboardingLocalizations.of(context);

    return FormBuilder(
      key: widget.formKey,
      child: Padding(
        padding: AppPaddings.medium.vertical,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(l10n.addSubscriptionFormTitle,
                style: Theme.of(context).textTheme.headlineLarge),
            Padding(
              padding: AppPaddings.medium.vertical,
              child: Text(l10n.addSubscriptionFormMessageBusinessUse,
                  style: Theme.of(context).textTheme.titleMedium),
            ),
            DefaultSimpleTextButton(
              label: l10n.addSubscriptionFormNoBusinessButton,
              onPressed: () {
                setState(() {
                  _isBusinessUse = false;
                });
              },
            ),
            FormBuilderTextField(
                decoration:
                    InputDecoration(labelText: l10n.addSubscriptionFormName),
                name: "name",
                initialValue:
                    "${widget.initialData?["firstName"] ?? ""} ${widget.initialData?["lastName"] ?? ""}",
                validator: FormBuilderValidators.required()),
            FormBuilderTextField(
                decoration:
                    InputDecoration(labelText: l10n.addSubscriptionFormEmail),
                name: "email",
                initialValue: widget.initialData?["email"] ?? "",
                validator: FormBuilderValidators.email()),
            FormBuilderTextField(
                decoration:
                    InputDecoration(labelText: l10n.addSubscriptionFormStreet),
                name: "street",
                initialValue: widget.initialData?["street"] ?? "",
                validator: FormBuilderValidators.required()),
            FormBuilderTextField(
                decoration: InputDecoration(
                    labelText: l10n.addSubscriptionFormHouseNumber),
                name: "houseNumber",
                initialValue:
                    "${widget.initialData?["houseNumber"] ?? ""} ${widget.initialData?["box"] ?? ""}",
                validator: FormBuilderValidators.required()),
            FormBuilderTextField(
                decoration:
                    InputDecoration(labelText: l10n.addSubscriptionFormCity),
                name: "city",
                initialValue: widget.initialData?["city"] ?? "",
                validator: FormBuilderValidators.required()),
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
                validator: FormBuilderValidators.required()),
            Divider(),
            Padding(
              padding: AppPaddings.medium.vertical,
              child: Text(l10n.addSubscriptionFormBusiness,
                  style: Theme.of(context).textTheme.titleMedium),
            ),
            FormBuilderTextField(
              decoration:
                  InputDecoration(labelText: l10n.addSubscriptionFormVAT),
              name: "vatNumber",
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.skipWhen((value) {
                  return value == null || value.isEmpty;
                }, FormBuilderValidators.minLength(9)),
                FormBuilderValidators.skipWhen((value) {
                  return value == null || value.isEmpty;
                }, FormBuilderValidators.maxLength(15)),
              ]),
            ),
            SolidCtaButton(
              label: l10n.addSubscriptionFormConfirm,
              onPressed: () async {
                if (widget.formKey.currentState!.saveAndValidate()) {
                  final values = widget.formKey.currentState?.value;
                  if (values != null) {
                    final clientId =
                        await onboardingRepository.postNewClientData(values);
                    if (clientId != null) {
                      _showContractPicker(context, clientId, subscription);
                      setState(() {
                        _isBusinessUse = false;
                      });
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

  Widget _standardClientForm(Subscription subscription) {
    final l10n = OnboardingLocalizations.of(context);

    return FormBuilder(
      key: widget.formKey,
      child: Padding(
        padding: AppPaddings.medium.vertical,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(l10n.addSubscriptionFormTitle,
                style: Theme.of(context).textTheme.headlineLarge),
            Padding(
              padding: AppPaddings.medium.vertical,
              child: Text(l10n.addSubscriptionFormMessagePersonalUse,
                  style: Theme.of(context).textTheme.titleMedium),
            ),
            DefaultSimpleTextButton(
              label: l10n.addSubscriptionFormLaterLabel,
              onPressed: () => widget.onAction({}),
            ),
            FormBuilderTextField(
                decoration:
                    InputDecoration(labelText: l10n.addSubscriptionFormName),
                name: "name",
                initialValue:
                    "${widget.initialData?["firstName"] ?? ""} ${widget.initialData?["lastName"] ?? ""}",
                validator: FormBuilderValidators.required()),
            FormBuilderTextField(
                decoration:
                    InputDecoration(labelText: l10n.addSubscriptionFormEmail),
                name: "email",
                initialValue: widget.initialData?["email"] ?? "",
                validator: FormBuilderValidators.email()),
            FormBuilderTextField(
                decoration:
                    InputDecoration(labelText: l10n.addSubscriptionFormStreet),
                name: "street",
                initialValue: widget.initialData?["street"] ?? "",
                validator: FormBuilderValidators.required()),
            FormBuilderTextField(
                decoration: InputDecoration(
                    labelText: l10n.addSubscriptionFormHouseNumber),
                name: "houseNumber",
                initialValue:
                    "${widget.initialData?["houseNumber"] ?? ""} ${widget.initialData?["box"] ?? ""}",
                validator: FormBuilderValidators.required()),
            FormBuilderTextField(
                decoration:
                    InputDecoration(labelText: l10n.addSubscriptionFormCity),
                name: "city",
                initialValue: widget.initialData?["city"] ?? "",
                validator: FormBuilderValidators.required()),
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
                validator: FormBuilderValidators.required()),
            SolidCtaButton(
              label: l10n.addSubscriptionFormConfirm,
              onPressed: () async {
                if (widget.formKey.currentState!.saveAndValidate()) {
                  final values = widget.formKey.currentState?.value;
                  if (values != null) {
                    final clientId =
                        await onboardingRepository.postNewClientData(values);
                    if (clientId != null) {
                      _showContractPicker(context, clientId, subscription);
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
      BuildContext context, int clientId, Subscription subscription) async {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return FormulaPickerPage(
            clientId: clientId,
            delegatedTrustClientId: subscription.delegatedTrustClientId,
            onContractCreated: () {
              Navigator.of(context).pop();
              setState(() {
                // refresh, should show next contract
              });
            },
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
