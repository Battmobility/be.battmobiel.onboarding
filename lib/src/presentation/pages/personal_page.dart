import 'package:batt_ds/batt_ds.dart';
import 'package:batt_onboarding/l10n/onboarding_localizations.dart';
import 'package:batt_onboarding/src/presentation/widgets/document_form_field.dart';
import 'package:batt_onboarding/src/util/analytics/analytics_events.dart';
import 'package:batt_onboarding/src/util/mrz_reader.dart';
import 'package:batt_onboarding/src/util/rrn_birthday_parser.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart' hide TextDirection;
import 'onboarding_page.dart';

final class PersonalPage extends OnboardingPage {
  PersonalPage({
    super.key,
    required super.formKey,
    required super.onAction,
    super.initialData,
    super.analyticsAction = AnalyticsAction.editPersonalData,
  });

  @override
  PersonalPageState createState() => PersonalPageState();
}

class PersonalPageState extends State<PersonalPage> {
  @override
  Widget build(BuildContext context) {
    String? rrn;
    String? surName;
    String? firstName;

    final l10n = OnboardingLocalizations.of(context);
    return SingleChildScrollView(
      child: Padding(
        padding: AppPaddings.large.trailing,
        child: FormBuilder(
          key: widget.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(l10n.identityPageTitle,
                  style: Theme.of(context).textTheme.headlineLarge),
              Padding(
                padding: AppPaddings.medium.vertical,
                child: Text(l10n.identityPageMessage,
                    style: Theme.of(context).textTheme.titleMedium),
              ),
              if (!kIsWeb) ...[
                DefaultOutlinedTextButton(
                    label: l10n.scanBackIdButtonLabel,
                    leading: (iconColor) => Icon(
                          Icons.camera,
                          color: iconColor,
                        ),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              child: Padding(
                                padding: AppPaddings.large.all,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    DocumentFormField(
                                      fieldName: "backId",
                                      displayName: l10n.scanBackIdFieldLabel,
                                      prefilled: true,
                                      onDataFound: (rrn, surName, firstName) {
                                        rrn = rrn;
                                        surName = surName;
                                        firstName = firstName;
                                      },
                                    ),
                                    Padding(
                                      padding: AppPaddings.medium.vertical,
                                      child: DefaultSolidTextButton(
                                          label: l10n.doneButtonText,
                                          onPressed: () {
                                            _updateFormData(
                                                rrn, surName, firstName);
                                            Navigator.of(context).pop();
                                          }),
                                    ),
                                    Padding(
                                      padding: AppPaddings.medium.bottom,
                                      child: DefaultOutlinedTextButton(
                                          label: l10n.cancelButtonText,
                                          onPressed: () {
                                            rrn = null;
                                            surName = null;
                                            firstName = null;
                                            Navigator.of(context).pop();
                                          }),
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                    }),
              ],
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
                initialValue: widget.initialData?["dateOfBirth"],
                inputType: InputType.date,
                decoration: InputDecoration(
                  labelText: l10n.birthDateFieldTitle,
                  suffixIcon: Icon(Icons.calendar_today),
                ),
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
                      validator: FormBuilderValidators.compose(
                          [FormBuilderValidators.minLength(8)]),
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
                format: DateFormat("dd/MM/yyyy"),
                helpText: l10n.driversLicenseIssuedDate,
                initialValue: widget.initialData?["dateCurrentLicense"],
                firstDate: DateTime.now().subtract(Duration(days: 365 * 90)),
                lastDate: DateTime.now(),
                inputType: InputType.date,
                decoration:
                    InputDecoration(labelText: l10n.driversLicenseIssuedDate),
              ),
              FormBuilderDateTimePicker(
                name: 'dateLicenseUntil',
                initialValue: widget.initialData?["dateLicenseUntil"],
                firstDate: DateTime.now(),
                inputType: InputType.date,
                decoration: InputDecoration(
                  labelText: l10n.driversLicenseExpiresDate,
                  suffixIcon: Icon(Icons.calendar_today),
                ),
              ),
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

  void _updateFormData(String? rrn, String? surname, String? firstName) {
    rrn != null
        ? widget.formKey.currentState?.patchValue({"socialSecurityNumber": rrn})
        : {};
    surname != null
        ? widget.formKey.currentState?.patchValue({"lastName": surname})
        : {};
    firstName != null
        ? widget.formKey.currentState?.patchValue({"firstName": firstName})
        : {};

    if (rrn != null) {
      final birthDate = RrnBirthdayParser.birthdayFromRrn(rrn);
      if (birthDate != null) {
        final formattedDate = DateFormat("dd-MM-yyyy").format(birthDate);
        widget.formKey.currentState?.patchValue({"dateOfBirth": formattedDate});
      }
    }
  }
}
