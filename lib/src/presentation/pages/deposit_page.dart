import 'package:flutter/material.dart';
import 'package:batt_ds/batt_ds.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../l10n/onboarding_localizations.dart';
import '../../util/analytics/analytics_events.dart';
import 'onboarding_page.dart';

final class DepositPage extends OnboardingPage {
  DepositPage({
    super.key,
    required super.formKey,
    required super.onAction,
    super.initialData,
    super.analyticsAction = AnalyticsAction.payDeposit,
  });

  @override
  DepositPageState createState() => DepositPageState();
}

class DepositPageState extends State<DepositPage> {
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
              Padding(
                padding: AppPaddings.large.top,
                child: FaIcon(FontAwesomeIcons.coins,
                    size: 100, color: AppColors.defaultBlue),
              ),
            ],
          )),
    );
  }
}
