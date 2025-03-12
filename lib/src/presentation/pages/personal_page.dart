import 'package:batt_ds/batt_ds.dart';
import 'package:batt_onboarding/l10n/onboarding_localizations.dart';
import 'package:batt_onboarding/src/util/mrz_reader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart' hide TextDirection;
import 'onboarding_page.dart';
import 'package:sealed_countries/sealed_countries.dart';

final class PersonalPage extends OnboardingPage {
  PersonalPage({
    super.key,
    required super.formKey,
    required super.onAction,
    super.initialData,
  });

  @override
  PersonalPageState createState() => PersonalPageState();
}

class PersonalPageState extends State<PersonalPage> {
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
              Text(l10n.identityPageTitle,
                  style: Theme.of(context).textTheme.headlineLarge),
              Padding(
                padding: AppPaddings.medium.vertical,
                child: Text(l10n.identityPageMessage,
                    style: Theme.of(context).textTheme.titleMedium),
              ),
              Text(l10n.identifyingDataTitle,
                  style: Theme.of(context).textTheme.titleSmall),
              FormBuilderTextField(
                name: 'firstName',
                textCapitalization: TextCapitalization.words,
                initialValue: widget.initialData?["firstName"] ?? '',
                validator: FormBuilderValidators.required(),
                decoration:
                    InputDecoration(labelText: l10n.firstNameFieldTitle),
              ),
              FormBuilderTextField(
                name: 'lastName',
                textCapitalization: TextCapitalization.words,
                initialValue: widget.initialData?["lastName"] ?? '',
                validator: FormBuilderValidators.required(),
                decoration: InputDecoration(labelText: l10n.lastNameFieldTitle),
              ),
              FormBuilderTextField(
                name: 'socialSecurityNumber',
                initialValue: widget.initialData?["socialSecurityNumber"] ?? '',
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
                name: 'dateOfBirth',
                format: DateFormat("dd-MM-yyyy"),
                helpText: l10n.birthDateFieldTitle,
                initialValue: widget.initialData?["dateOfBirth"],
                initialDate: widget.initialData?["dateOfBirth"] ??
                    DateTime.now().subtract(Duration(days: 5840)),
                firstDate: DateTime.now().subtract(Duration(days: 43800)),
                lastDate: DateTime.now().subtract(Duration(days: 5840)),
                inputType: InputType.date,
                decoration:
                    InputDecoration(labelText: l10n.birthDateFieldTitle),
              ),
              Text(l10n.driversLicenseFieldTitle,
                  style: Theme.of(context).textTheme.titleSmall),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 4,
                    child: FormBuilderTextField(
                      name: 'licenseNumber',
                      initialValue: widget.initialData?["licenseNumber"] ?? '',
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.numeric(),
                        FormBuilderValidators.minLength(10)
                      ]),
                      decoration:
                          InputDecoration(labelText: l10n.driversLicenseNumber),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Padding(
                      padding: AppPaddings.medium.leading,
                      child: FormBuilderDropdown(
                          isExpanded: true,
                          menuWidth: _getTextWidth("EUROPEAN",
                                  Theme.of(context).textTheme.bodyLarge!) +
                              20,
                          validator: FormBuilderValidators.required(),
                          name: "licenseType",
                          initialValue:
                              widget.initialData?["licenseType"] ?? '',
                          items: ["BELGIAN", "EUROPEAN", "OTHER"]
                              .map((value) => DropdownMenuItem(
                                    child: Text(value.capitalized,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!),
                                    value: value,
                                  ))
                              .toList()),
                    ),
                  ),
                ],
              ),
              FormBuilderDateTimePicker(
                name: 'dateCurrentLicense',
                format: DateFormat("dd-MM-yyyy"),
                helpText: l10n.driversLicenseIssuedDate,
                initialValue: widget.initialData?["dateCurrentLicense"],
                firstDate: widget.initialData?["dateOfBirth"] as DateTime? ??
                    DateTime.now().subtract(Duration(days: 36500)),
                lastDate: DateTime.now(),
                inputType: InputType.date,
                decoration:
                    InputDecoration(labelText: l10n.driversLicenseIssuedDate),
              ),
              FormBuilderDateTimePicker(
                name: 'dateLicenseUntil',
                helpText: l10n.driversLicenseExpiresDate,
                format: DateFormat("dd-MM-yyyy"),
                initialValue: widget.initialData?["dateLicenseUntil"],
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
                        flex: 3,
                        child: Padding(
                          padding: AppPaddings.medium.trailing,
                          child: Text(l10n.addressCountry,
                              maxLines: 2,
                              style: Theme.of(context).textTheme.bodyLarge),
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: FormBuilderDropdown(
                          validator: FormBuilderValidators.required(),
                          name: "nationality",
                          initialValue: widget.initialData?["nationality"] ??
                              WorldCountry.fromCode("Bel").iso3166oneAlpha2,
                          items: WorldCountry.list
                              .map((country) => DropdownMenuItem(
                                    child: Text(
                                      "${country.emoji} ${country.name.common}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!,
                                    ),
                                    value: country.iso3166oneAlpha2,
                                  ))
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                  FormBuilderTextField(
                    name: 'street',
                    textCapitalization: TextCapitalization.words,
                    initialValue: widget.initialData?["street"] ?? '',
                    validator: FormBuilderValidators.compose(
                      [
                        FormBuilderValidators.required(),
                      ],
                    ),
                    decoration: InputDecoration(labelText: l10n.addressStreet),
                  ),
                  FormBuilderTextField(
                    name: 'houseNumber',
                    initialValue: widget.initialData?["houseNumber"] ?? '',
                    validator: FormBuilderValidators.compose(
                      [
                        FormBuilderValidators.required(),
                      ],
                    ),
                    decoration: InputDecoration(labelText: l10n.addressNumber),
                  ),
                  FormBuilderTextField(
                    name: 'box',
                    initialValue: widget.initialData?["box"] ?? '',
                    decoration:
                        InputDecoration(labelText: l10n.addressAddition),
                  ),
                ]
                    .map((field) => Padding(
                        padding: AppPaddings.medium.vertical, child: field))
                    .toList(),
              ),
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Flexible(
                  flex: 2,
                  child: FormBuilderTextField(
                    name: 'postalCode',
                    keyboardType: TextInputType.number,
                    initialValue: widget.initialData?["postalCode"] ?? '',
                    validator: FormBuilderValidators.compose(
                      [
                        FormBuilderValidators.required(),
                      ],
                    ),
                    decoration: InputDecoration(labelText: l10n.addressZip),
                  ),
                ),
                Flexible(
                  flex: 4,
                  child: Padding(
                    padding: AppPaddings.medium.leading,
                    child: FormBuilderTextField(
                      name: 'city',
                      textCapitalization: TextCapitalization.words,
                      initialValue: widget.initialData?["city"] ?? '',
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(),
                        ],
                      ),
                      decoration: InputDecoration(labelText: l10n.addressCity),
                    ),
                  ),
                ),
              ])
            ]
                .map((field) =>
                    Padding(padding: AppPaddings.medium.vertical, child: field))
                .toList(),
          ),
        ),
      ),
    );
  }

  double _getTextWidth(String text, TextStyle style) {
    final textSpan = TextSpan(
      text: text,
      style: style,
    );
    final tp = TextPainter(text: textSpan, textDirection: TextDirection.ltr);
    tp.layout();
    return tp.width;
  }
}
