import 'package:batt_ds/batt_ds.dart';
import 'package:batt_onboarding/l10n/onboarding_localizations.dart';
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
    super.initialData,
    super.analyticsAction = AnalyticsAction.createClient,
  });

  @override
  CreateClientPageState createState() => CreateClientPageState();
}

class CreateClientPageState extends State<CreateClientPage> {
  @override
  Widget build(BuildContext context) {
    final l10n = OnboardingLocalizations.of(context);
    return Padding(
      padding: AppPaddings.large.trailing,
      child: SingleChildScrollView(
        child: FormBuilder(
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
                  child: Text(l10n.addSubscriptionFormMessage,
                      style: Theme.of(context).textTheme.titleMedium),
                ),
                DefaultSimpleTextButton(
                  label: l10n.addSubscriptionFormLaterLabel,
                  onPressed: () => widget.onAction({}),
                ),
                FormBuilderTextField(
                    decoration: InputDecoration(
                        labelText: l10n.addSubscriptionFormName),
                    name: "name",
                    initialValue:
                        "${widget.initialData?["firstName"] ?? ""} ${widget.initialData?["lastName"] ?? ""}",
                    validator: FormBuilderValidators.required()),
                FormBuilderTextField(
                    decoration: InputDecoration(
                        labelText: l10n.addSubscriptionFormEmail),
                    name: "email",
                    initialValue: widget.initialData?["email"] ?? "",
                    validator: FormBuilderValidators.email()),
                FormBuilderTextField(
                    decoration: InputDecoration(
                        labelText: l10n.addSubscriptionFormStreet),
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
                    decoration: InputDecoration(
                        labelText: l10n.addSubscriptionFormCity),
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
              ]
                  .map((field) => Padding(
                      padding: AppPaddings.medium.vertical, child: field))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
