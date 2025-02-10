import 'package:flutter/material.dart';
import 'package:batt_ds/batt_ds.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:sealed_countries/sealed_countries.dart';

import '../../../l10n/onboarding_localizations.dart';
import 'onboarding_page.dart';

final class IntroPage extends OnboardingPage {
  IntroPage({
    super.key,
    required super.formKey,
    required super.onAction,
    super.initialData,
  });

  @override
  IntroPageState createState() => IntroPageState();
}

class IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onAction({});
    });
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(60.0),
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 800, maxHeight: 800),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: AppPaddings.medium.bottom,
                  child: Text(OnboardingLocalizations.of(context).formTitle,
                      style: context.typographyTheme.largeTitle),
                ),
                Flexible(
                  flex: 9,
                  child: Text(
                    OnboardingLocalizations.of(context)
                        .introPageNeededDocuments,
                    style: context.typographyTheme.smallTitle,
                    maxLines: 99,
                  ),
                ),
                Spacer(),
                Flexible(
                  flex: 1,
                  child: OrangeSimpleTextButton(
                    label: OnboardingLocalizations.of(context)
                        .introPageCancelButtonText,
                    onPressed: () {
                      widget.onAction({});
                    },
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
