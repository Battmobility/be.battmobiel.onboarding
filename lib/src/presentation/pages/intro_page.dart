import 'package:flutter/material.dart';
import 'package:batt_ds/batt_ds.dart';

import '../../../l10n/onboarding_localizations.dart';
import 'onboarding_page.dart';

final class IntroPage extends OnboardingPage {
  IntroPage({
    super.key,
    required super.onValidated,
    super.initialData,
  });

  @override
  IntroPageState createState() => IntroPageState();
}

class IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onValidated({});
    });
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
