import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:batt_ds/batt_ds.dart';

import '../../../l10n/onboarding_localizations.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({
    super.key,
  });

  @override
  IntroPageState createState() {
    return IntroPageState();
  }
}

class IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(60.0),
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 800, maxHeight: 800),
            child: Column(
              children: [
                Text(OnboardingLocalizations.of(context).formTitle,
                    style: context.typographyTheme.largeTitle),
              ],
            )),
      ),
    );
  }
}
