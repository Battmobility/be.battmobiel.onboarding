import 'package:batt_ds/batt_ds.dart';
import 'package:batt_onboarding/l10n/onboarding_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'onboarding_page.dart';
import 'package:sealed_countries/sealed_countries.dart';

final class IdentityPage extends OnboardingPage {
  IdentityPage({
    super.key,
    required super.formKey,
    required super.onAction,
    super.initialData,
  });

  @override
  IdentityPageState createState() => IdentityPageState();
}

class IdentityPageState extends State<IdentityPage> {
  @override
  Widget build(BuildContext context) {
    final l10n = OnboardingLocalizations.of(context);
    return SingleChildScrollView(
      child: FormBuilder(
        key: widget.formKey,
        child: Column(
          children: [
            Text(l10n.identityPageTitle,
                style: Theme.of(context).textTheme.titleLarge),
            Padding(
              padding: AppPaddings.medium.vertical,
              child: Text(l10n.identityPageMessage,
                  style: Theme.of(context).textTheme.titleMedium),
            ),
            Text(l10n.identifyingDataTitle,
                style: Theme.of(context).textTheme.titleSmall),
            FormBuilderTextField(
              name: 'firstname',
              initialValue: widget.initialData?["firstname"] ?? '',
              validator: FormBuilderValidators.firstName(),
              decoration: InputDecoration(labelText: l10n.firstNameFieldTitle),
            ),
            FormBuilderTextField(
              name: 'lastname',
              initialValue: widget.initialData?["lastname"] ?? '',
              validator: FormBuilderValidators.lastName(),
              decoration: InputDecoration(labelText: l10n.lastNameFieldTitle),
            ),
            FormBuilderTextField(
              name: 'rrn',
              initialValue: widget.initialData?["rrn"] ?? '',
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.numeric(),
                FormBuilderValidators.minLength(11)
              ]),
              decoration: InputDecoration(
                  labelText: l10n.rrnFieldTitle,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: l10n.numberHint),
            ),
            FormBuilderDateTimePicker(
              name: 'birthdate',
              initialValue: widget.initialData?["birthdate"],
              firstDate: DateTime.now().subtract(Duration(days: 43800)),
              lastDate: DateTime.now().subtract(Duration(days: 5840)),
              inputType: InputType.date,
              decoration: InputDecoration(labelText: l10n.birthDateFieldTitle),
            ),
            Text(l10n.driversLicenseFieldTitle,
                style: Theme.of(context).textTheme.titleMedium),
            FormBuilderTextField(
              name: 'driverslicensenumber',
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.numeric(),
                FormBuilderValidators.minLength(10)
              ]),
              decoration: InputDecoration(labelText: l10n.driversLicenseNumber),
            ),
            FormBuilderDateTimePicker(
              name: 'dateCurrentLicense',
              lastDate: DateTime.now(),
              inputType: InputType.date,
              decoration:
                  InputDecoration(labelText: l10n.driversLicenseIssuedDate),
            ),
            FormBuilderDateTimePicker(
              name: 'dateLicenseUntil',
              firstDate: DateTime.now(),
              inputType: InputType.date,
              decoration:
                  InputDecoration(labelText: l10n.driversLicenseExpiresDate),
            ),
            Text(l10n.address, style: Theme.of(context).textTheme.titleSmall),
            Wrap(
              children: [
                Row(
                  children: [
                    Flexible(
                      flex: 5,
                      child: Text(l10n.convictionTypeNoOfAccidents,
                          maxLines: 2,
                          style: Theme.of(context).textTheme.bodyLarge),
                    ),
                    Flexible(
                      flex: 1,
                      child: FormBuilderDropdown(
                          validator: FormBuilderValidators.required(),
                          name: "country",
                          initialValue: WorldCountry.fromCode("Bel"),
                          items: WorldCountry.list
                              .map((country) => DropdownMenuItem(
                                    child: Text(
                                      "${country.emoji} ${country.name.common}",
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
                                    value: country,
                                  ))
                              .toList()),
                    ),
                  ],
                ),
                FormBuilderTextField(
                  name: 'street',
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(),
                    ],
                  ),
                  decoration: InputDecoration(labelText: l10n.addressStreet),
                ),
                FormBuilderTextField(
                  name: 'houseNumber',
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(),
                    ],
                  ),
                  decoration: InputDecoration(labelText: l10n.addressNumber),
                ),
                FormBuilderTextField(
                  name: 'box',
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(),
                    ],
                  ),
                  decoration: InputDecoration(labelText: l10n.addressAddition),
                ),
              ]
                  .map((field) => Padding(
                      padding: AppPaddings.medium.vertical, child: field))
                  .toList(),
            ),
            Row(children: [
              Flexible(
                flex: 4,
                child: FormBuilderTextField(
                  name: 'city',
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(),
                    ],
                  ),
                  decoration: InputDecoration(labelText: l10n.addressCity),
                ),
              ),
              Flexible(
                flex: 2,
                child: Padding(
                  padding: AppPaddings.medium.leading,
                  child: FormBuilderTextField(
                    name: 'postalCode',
                    validator: FormBuilderValidators.compose(
                      [
                        FormBuilderValidators.required(),
                      ],
                    ),
                    decoration: InputDecoration(labelText: l10n.addressZip),
                  ),
                ),
              )
            ])
          ]
              .map((field) =>
                  Padding(padding: AppPaddings.medium.vertical, child: field))
              .toList(),
        ),
      ),
    );
  }
}
