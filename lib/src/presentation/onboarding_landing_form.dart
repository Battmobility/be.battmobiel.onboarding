import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../../l10n/onboarding_localizations.dart';

class OnboardingLandingForm extends StatefulWidget {
  const OnboardingLandingForm({super.key});

  @override
  OnboardingLandingFormState createState() {
    return OnboardingLandingFormState();
  }
}

class OnboardingLandingFormState extends State<OnboardingLandingForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(60.0),
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 800, maxHeight: 800),
          child: FormBuilder(
            key: _formKey,
            child: Column(
              children: <Widget>[
                FormBuilderTextField(
                  name: "firstName",
                  decoration: InputDecoration(
                      labelText: OnboardingLocalizations.of(context)
                          .firstNameFieldTitle),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.firstName(),
                  ]),
                ),
                FormBuilderTextField(
                  name: "lastName",
                  decoration: InputDecoration(
                      labelText: OnboardingLocalizations.of(context)
                          .lastNameFieldTitle),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.lastName(),
                  ]),
                ),
                FormBuilderTextField(
                  name: "email",
                  decoration: InputDecoration(
                      labelText:
                          OnboardingLocalizations.of(context).emailFieldTitle),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.email(),
                  ]),
                ),
                FormBuilderTextField(
                  name: "phone",
                  decoration: InputDecoration(
                      labelText:
                          OnboardingLocalizations.of(context).phoneFieldTitle),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.phoneNumber(),
                  ]),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    }
                  },
                  child: Text(
                      OnboardingLocalizations.of(context).submitButtonText),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
