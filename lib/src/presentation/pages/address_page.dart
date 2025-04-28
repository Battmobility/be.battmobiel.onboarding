import 'package:batt_ds/batt_ds.dart';
import 'package:batt_onboarding/l10n/onboarding_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'onboarding_page.dart';
import 'package:sealed_countries/sealed_countries.dart';

final class AddressPage extends OnboardingPage {
  AddressPage({
    super.key,
    required super.formKey,
    required super.onAction,
    super.initialData,
  });

  @override
  AddressPageState createState() => AddressPageState();
}

class AddressPageState extends State<AddressPage> {
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
              Text(l10n.addressPageTitle,
                  style: Theme.of(context).textTheme.headlineLarge),
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
}
