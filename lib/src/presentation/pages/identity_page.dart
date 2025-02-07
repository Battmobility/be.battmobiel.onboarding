import 'package:batt_ds/batt_ds.dart';
import 'package:batt_onboarding/l10n/onboarding_localizations.dart';
import 'package:batt_onboarding/src/presentation/widgets/image_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'onboarding_page.dart';

final class IdentityPage extends OnboardingPage {
  IdentityPage({
    super.key,
    required super.onValidated,
    super.initialData,
  });

  @override
  IdentityPageState createState() => IdentityPageState();
}

class IdentityPageState extends State<IdentityPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final l10n = OnboardingLocalizations.of(context);
    return SingleChildScrollView(
      child: FormBuilder(
        key: _formKey,
        onChanged: () {
          if (_formKey.currentState!.validate()) {
            final data = _formKey.currentState!.value as Map<String, String>;
            widget.onValidated(data);
          }
        },
        child: Column(
          children: [
            // TODO: localize
            Text(l10n.identityPageTitle,
                style: context.typographyTheme.largeTitle),
            Padding(
              padding: AppPaddings.medium.vertical,
              child: Text(l10n.identityPageMessage,
                  style: context.typographyTheme.largeText),
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: AppPaddings.xxsmall.vertical,
                child: Text(l10n.idCardFieldTitle,
                    style: context.typographyTheme.largeText),
              ),
              Flex(
                direction: MediaQuery.of(context).size.width >
                        MediaQuery.of(context).size.height
                    ? Axis.horizontal
                    : Axis.vertical,
                children: [
                  // FRONT
                  Expanded(
                    child: Padding(
                        padding: AppPaddings.small.trailing,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: AppPaddings.small.vertical,
                              child: Text(l10n.idCardFieldFront,
                                  style: context.typographyTheme.largeText),
                            ),
                            AspectRatio(
                              aspectRatio: 2,
                              child: ImagePickerWidget(
                                onPicked: (_) => {},
                                onDataFound: null,
                              ),
                            ),
                          ],
                        )),
                  ),
                  Expanded(
                    child: Padding(
                      padding: AppPaddings.small.leading,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: AppPaddings.small.vertical,
                            child: Text(l10n.idCardFieldBack,
                                style: context.typographyTheme.largeText),
                          ),
                          AspectRatio(
                            aspectRatio: 2,
                            child: ImagePickerWidget(
                              onPicked: (_) => {},
                              onDataFound: (rrn, surName, firstName) =>
                                  _updateFormData(rrn, surName, firstName),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ]),

            FormBuilderTextField(
              name: 'firstname',
              validator: FormBuilderValidators.firstName(),
              decoration: InputDecoration(labelText: l10n.firstNameFieldTitle),
            ),
            FormBuilderTextField(
              name: 'lastname',
              validator: FormBuilderValidators.lastName(),
              decoration: InputDecoration(labelText: l10n.lastNameFieldTitle),
            ),
            FormBuilderTextField(
              name: 'rrn',
              validator: FormBuilderValidators.numeric(),
              decoration: InputDecoration(labelText: l10n.rrnFieldTitle),
            ),
            FormBuilderTextField(
              name: 'email',
              validator: FormBuilderValidators.email(),
              decoration: InputDecoration(labelText: l10n.emailFieldTitle),
            ),
            FormBuilderTextField(
              name: 'phone',
              validator: FormBuilderValidators.phoneNumber(),
              decoration: InputDecoration(labelText: l10n.phoneFieldTitle),
            ),
          ]
              .map((field) =>
                  Padding(padding: AppPaddings.medium.vertical, child: field))
              .toList(),
        ),
      ),
    );
  }

  void _updateFormData(String? rrn, String? surname, String? firstName) {
    rrn != null ? _formKey.currentState?.patchValue({"rrn": rrn}) : {};
    surname != null
        ? _formKey.currentState?.patchValue({"lastname": surname})
        : {};
    firstName != null
        ? _formKey.currentState?.patchValue({"firstname": firstName})
        : {};
  }
}
