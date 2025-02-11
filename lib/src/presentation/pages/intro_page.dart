import 'package:flutter/material.dart';
import 'package:batt_ds/batt_ds.dart';

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
    return Container(
      padding: AppPaddings.xxlarge.vertical.add(AppPaddings.large.horizontal),
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 800, maxHeight: 800),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: AppPaddings.medium.bottom,
                child: Text(OnboardingLocalizations.of(context).formTitle,
                    style: Theme.of(context).textTheme.headlineLarge),
              ),
              Flexible(
                flex: 9,
                child: Text(
                  OnboardingLocalizations.of(context).introPageNeededDocuments,
                  style: Theme.of(context).textTheme.titleMedium,
                  maxLines: 99,
                ),
              ),
            ],
          )),
    );
  }
}
