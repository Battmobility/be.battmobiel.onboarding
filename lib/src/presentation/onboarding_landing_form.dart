import 'package:batt_ds/batt_ds.dart';
import 'package:batt_ds/theme/app_theme.dart';
import 'package:batt_onboarding/src/data/token_service.dart';
import 'package:batt_onboarding/src/presentation/pages/convictions_page.dart';
import 'package:batt_onboarding/src/presentation/pages/identity_page.dart';
import 'package:batt_onboarding/src/presentation/pages/intro_page.dart';
import 'package:flutter/material.dart';
import '../../l10n/onboarding_localizations.dart';

class OnboardingLandingForm extends StatefulWidget {
  final String accessToken;
  final Function(Object) onAuthenticationError;
  final Function(int) onStepStarted;
  final Function(int) onStepCompleted;
  final Function(bool) onSubmitted;

  const OnboardingLandingForm({
    super.key,
    required this.accessToken,
    required this.onAuthenticationError,
    required this.onStepStarted,
    required this.onStepCompleted,
    required this.onSubmitted,
  });

  @override
  OnboardingLandingFormState createState() {
    TokenService(accessToken);
    return OnboardingLandingFormState();
  }
}

class OnboardingLandingFormState extends State<OnboardingLandingForm> {
  final _controller = PageController(
      initialPage: 0); // TODO: not if resuming from earlier state
  int _step = 0;
  bool _canContinue = false;

  @override
  Widget build(BuildContext context) {
    final l10n = OnboardingLocalizations.of(context);

    final pages = [
      IntroPage(onValidated: (_) {
        _step++;

        _canContinue = true;
        setState(() {});
      }),
      ConvictionsPage(onValidated: (_) {
        // TODO: post data
        _step++;

        setState(() {});
      }),
      IdentityPage(onValidated: (_) {
        // TODO: post data
        _step++;
        // _controller.jumpToPage(1);
        setState(() {});
      })
    ];

    final appTheme = switch (MediaQuery.platformBrightnessOf(context)) {
      Brightness.dark => AppTheme.light(),
      Brightness.light => AppTheme.dark(),
    };
    WidgetsFlutterBinding.ensureInitialized();

    return ThemeScopeWidget.initializeSynchronously(
      MaterialApp(
        themeMode: ThemeScope.of(context).themeMode,
        theme: ThemeData(
          colorScheme: ColorScheme.light(
              primary: ThemeScope.of(context).appTheme.themeColorPrimary,
              primaryContainer:
                  ThemeScope.of(context).appTheme.themeColorPrimaryContainer,
              secondary: ThemeScope.of(context).appTheme.themeColorSecondary,
              shadow: ThemeScope.of(context).appTheme.shadowColorLight,
              surface: ThemeScope.of(context).appTheme.themeColorLight,
              surfaceDim:
                  ThemeScope.of(context).appTheme.themeColorSecondaryContainer,
              surfaceContainerLowest: ThemeScope.of(context)
                  .appTheme
                  .themeColorSecondaryContainerLowest),
          brightness: Brightness.light,
          extensions: [ThemeScope.of(context).appTheme],
          appBarTheme: ThemeScope.of(context).appTheme.appBarThemeLight,
          navigationBarTheme:
              ThemeScope.of(context).appTheme.navigationBarThemeLight,
          cardTheme:
              CardTheme(color: ThemeScope.of(context).appTheme.themeColorLight),
          textTheme: ThemeScope.of(context).appTheme.textThemeLight,
          scaffoldBackgroundColor:
              ThemeScope.of(context).appTheme.themeColorLight,
          dividerColor: ThemeScope.of(context).appTheme.themeColorPrimary,
          canvasColor: ThemeScope.of(context).appTheme.themeColorLight,
          sliderTheme: SliderThemeData(
              activeTrackColor:
                  ThemeScope.of(context).appTheme.themeColorPrimary,
              inactiveTrackColor: ThemeScope.of(context)
                  .appTheme
                  .themeColorPrimary
                  .withValues(alpha: 0.5),
              thumbColor: ThemeScope.of(context).appTheme.themeColorPrimary,
              overlayColor: ThemeScope.of(context)
                  .appTheme
                  .themeColorPrimary
                  .withValues(alpha: 0.5)),
          progressIndicatorTheme: ProgressIndicatorThemeData(
            color: ThemeScope.of(context).appTheme.themeColorPrimary,
          ),
          iconButtonTheme: IconButtonThemeData(
              style: ButtonStyle(
                  foregroundColor: WidgetStatePropertyAll(
                      ThemeScope.of(context).appTheme.themeColorLight))),
        ),
        darkTheme: ThemeData(
          colorScheme: ColorScheme.dark(
              primary: ThemeScope.of(context).appTheme.themeColorDark,
              primaryContainer:
                  ThemeScope.of(context).appTheme.themeColorPrimaryContainer,
              secondary: ThemeScope.of(context).appTheme.themeColorSecondary,
              shadow: ThemeScope.of(context).appTheme.shadowColorDark,
              surface: ThemeScope.of(context).appTheme.themeColorDark,
              surfaceDim: ThemeScope.of(context).appTheme.themeColorDark,
              surfaceContainerLowest: ThemeScope.of(context)
                  .appTheme
                  .themeColorSecondaryContainerLowest),
          brightness: Brightness.dark,
          extensions: [ThemeScope.of(context).appTheme],
          appBarTheme: ThemeScope.of(context).appTheme.appBarThemeDark,
          navigationBarTheme:
              ThemeScope.of(context).appTheme.navigationBarThemeDark,
          cardTheme:
              CardTheme(color: ThemeScope.of(context).appTheme.themeColorDark),
          textTheme: ThemeScope.of(context).appTheme.textThemeDark,
          scaffoldBackgroundColor:
              ThemeScope.of(context).appTheme.themeColorDark,
          canvasColor: ThemeScope.of(context).appTheme.themeColorDark,
          dividerColor: ThemeScope.of(context).appTheme.themeColorPrimary,
          sliderTheme: SliderThemeData(
            activeTrackColor: ThemeScope.of(context).appTheme.themeColorPrimary,
            inactiveTrackColor: ThemeScope.of(context)
                .appTheme
                .themeColorPrimary
                .withValues(alpha: 0.5),
            thumbColor: ThemeScope.of(context).appTheme.themeColorPrimary,
            overlayColor: ThemeScope.of(context)
                .appTheme
                .themeColorPrimary
                .withValues(alpha: 0.5),
          ),
          progressIndicatorTheme: ProgressIndicatorThemeData(
            color: ThemeScope.of(context).appTheme.themeColorPrimary,
          ),
          iconButtonTheme: IconButtonThemeData(
              style: ButtonStyle(
                  foregroundColor: WidgetStatePropertyAll(
                      ThemeScope.of(context).appTheme.themeColorLight))),
        ),
        home: Scaffold(
          body: Container(
            padding: AppPaddings.xxlarge.all,
            alignment: Alignment.topCenter,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 800, maxHeight: 800),
              child: Column(
                children: [
                  PageView.builder(
                      itemBuilder: (context, index) => pages[index],
                      itemCount: 3),
                  Row(
                    children: [
                      OrangeOutlinedBattButton(
                          label: l10n.previousButtonText,
                          onPressed: () {
                            _controller.jumpToPage(_step--);
                            _canContinue = false;
                          }),
                      Expanded(child: SizedBox()),
                      _canContinue
                          ? OrangeOutlinedBattButton(
                              label: l10n.nextButtonText,
                              onPressed: () {
                                _canContinue = true;
                                _controller.jumpToPage(_step++);
                              })
                          : Opacity(
                              opacity: 0.66,
                              child: OrangeOutlinedBattButton(
                                label: l10n.nextButtonText,
                                onPressed: () => showDialog(
                                  context: context,
                                  builder: (_) => AlertDialog(
                                    title: Text(l10n.fillOutBeforeContinuing),
                                  ),
                                ),
                              ),
                            )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      ThemeMode.system,
    );
  }
}
