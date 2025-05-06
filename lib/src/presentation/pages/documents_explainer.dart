import 'package:flutter/material.dart';
import 'package:batt_ds/batt_ds.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../l10n/onboarding_localizations.dart';
import '../../util/analytics/analytics_events.dart';
import 'onboarding_page.dart';

final class DocumentsExplainerPage extends OnboardingPage {
  DocumentsExplainerPage({
    super.key,
    required super.formKey,
    required super.onAction,
    super.initialData,
    super.analyticsAction = AnalyticsAction.payDeposit,
  });

  @override
  DocumentsExplainerPageState createState() => DocumentsExplainerPageState();
}

class DocumentsExplainerPageState extends State<DocumentsExplainerPage> {
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
                child: Text(
                    OnboardingLocalizations.of(context)
                        .documentsExplainerPageTitle,
                    style: Theme.of(context).textTheme.headlineLarge),
              ),
              Text(
                OnboardingLocalizations.of(context)
                    .documentsExplainerPageMessage,
                style: Theme.of(context).textTheme.titleMedium,
                maxLines: 99,
              ),
              DefaultSolidTextButton(
                label: OnboardingLocalizations.of(context)
                    .documentsExplainerPageInfoButtonlabel,
                onPressed: () {
                  // TODO: show popover
                },
              ),
              Padding(
                padding: AppPaddings.large.top,
                child: FaIcon(FontAwesomeIcons.idCard,
                    size: 100, color: AppColors.defaultBlue),
              ),
            ],
          )),
    );
  }
}
