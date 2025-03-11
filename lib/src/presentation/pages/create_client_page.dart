import 'package:batt_ds/batt_ds.dart';
import 'package:batt_onboarding/l10n/onboarding_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'onboarding_page.dart';

final class CreateClientPage extends OnboardingPage {
  CreateClientPage({
    super.key,
    required super.formKey,
    required super.onAction,
    super.initialData,
  });

  @override
  CreateClientPageState createState() => CreateClientPageState();
}

class CreateClientPageState extends State<CreateClientPage> {
  bool _later = false;

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
                FormBuilderCheckbox(
                  name: "later",
                  title: Text(l10n.addSubscriptionFormLaterLabel,
                      style: Theme.of(context).textTheme.bodyLarge),
                  onChanged: (value) {
                    setState(() {
                      _later = value ?? false;
                    });
                  },
                ),
                Divider(),
                Padding(
                  padding: AppPaddings.medium.vertical,
                  child: Text(l10n.addSubscriptionFormMessage,
                      style: Theme.of(context).textTheme.titleMedium),
                ),
                FormBuilderTextField(
                    decoration: InputDecoration(
                        labelText: l10n.addSubscriptionFormName),
                    name: "name",
                    initialValue:
                        "${widget.initialData?["firstName"] ?? ""} ${widget.initialData?["lastName"] ?? ""}",
                    validator: FormBuilderValidators.skipWhen(
                        (_) => _later == true,
                        FormBuilderValidators.required())),
                FormBuilderTextField(
                    decoration: InputDecoration(
                        labelText: l10n.addSubscriptionFormEmail),
                    name: "email",
                    initialValue: widget.initialData?["email"] ?? "",
                    validator: FormBuilderValidators.skipWhen(
                        (_) => _later == true, FormBuilderValidators.email())),
                FormBuilderTextField(
                    decoration: InputDecoration(
                        labelText: l10n.addSubscriptionFormStreet),
                    name: "street",
                    initialValue: widget.initialData?["street"] ?? "",
                    validator: FormBuilderValidators.skipWhen(
                        (_) => _later == true,
                        FormBuilderValidators.required())),
                FormBuilderTextField(
                    decoration: InputDecoration(
                        labelText: l10n.addSubscriptionFormHouseNumber),
                    name: "houseNumber",
                    initialValue:
                        "${widget.initialData?["houseNumber"] ?? ""} ${widget.initialData?["box"] ?? ""}",
                    validator: FormBuilderValidators.skipWhen(
                        (_) => _later == true,
                        FormBuilderValidators.required())),
                FormBuilderTextField(
                    decoration: InputDecoration(
                        labelText: l10n.addSubscriptionFormPostalCode),
                    name: "postalCode",
                    initialValue: widget.initialData?["postalCode"] ?? "",
                    validator: FormBuilderValidators.skipWhen(
                        (_) => _later == true,
                        FormBuilderValidators.required())),
                FormBuilderTextField(
                    decoration: InputDecoration(
                        labelText: l10n.addSubscriptionFormCity),
                    name: "city",
                    initialValue: widget.initialData?["city"] ?? "",
                    validator: FormBuilderValidators.skipWhen(
                        (_) => _later == true,
                        FormBuilderValidators.required())),
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
              ].map((child) => Flexible(child: child)).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
