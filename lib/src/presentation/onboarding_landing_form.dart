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
    final theme = ThemeScope.of(context);

    return ThemeScopeWidget.initializeSynchronously(
      MaterialApp(
        themeMode: theme.themeMode,
        theme: ThemeData(
          colorScheme: ColorScheme.light(
              primary: theme.appTheme.themeColorPrimary,
              primaryContainer: theme.appTheme.themeColorPrimaryContainer,
              secondary: theme.appTheme.themeColorSecondary,
              shadow: theme.appTheme.shadowColorLight,
              surface: theme.appTheme.themeColorLight,
              surfaceDim: theme.appTheme.themeColorSecondaryContainer,
              surfaceContainerLowest:
                  theme.appTheme.themeColorSecondaryContainerLowest),
          brightness: Brightness.light,
          extensions: [theme.appTheme],
          appBarTheme: theme.appTheme.appBarThemeLight,
          navigationBarTheme: theme.appTheme.navigationBarThemeLight,
          cardTheme: CardTheme(color: theme.appTheme.themeColorLight),
          textTheme: theme.appTheme.textThemeLight,
          scaffoldBackgroundColor: theme.appTheme.themeColorLight,
          dividerColor: theme.appTheme.themeColorPrimary,
          canvasColor: theme.appTheme.themeColorLight,
          sliderTheme: SliderThemeData(
              activeTrackColor: theme.appTheme.themeColorPrimary,
              inactiveTrackColor:
                  theme.appTheme.themeColorPrimary.withValues(alpha: 0.5),
              thumbColor: theme.appTheme.themeColorPrimary,
              overlayColor:
                  theme.appTheme.themeColorPrimary.withValues(alpha: 0.5)),
          progressIndicatorTheme: ProgressIndicatorThemeData(
            color: theme.appTheme.themeColorPrimary,
          ),
          iconButtonTheme: IconButtonThemeData(
              style: ButtonStyle(
                  foregroundColor:
                      WidgetStatePropertyAll(theme.appTheme.themeColorLight))),
        ),
        darkTheme: ThemeData(
          colorScheme: ColorScheme.dark(
              primary: theme.appTheme.themeColorDark,
              primaryContainer: theme.appTheme.themeColorPrimaryContainer,
              secondary: theme.appTheme.themeColorSecondary,
              shadow: theme.appTheme.shadowColorDark,
              surface: theme.appTheme.themeColorDark,
              surfaceDim: theme.appTheme.themeColorDark,
              surfaceContainerLowest:
                  theme.appTheme.themeColorSecondaryContainerLowest),
          brightness: Brightness.dark,
          extensions: [theme.appTheme],
          appBarTheme: theme.appTheme.appBarThemeDark,
          navigationBarTheme: theme.appTheme.navigationBarThemeDark,
          cardTheme: CardTheme(color: theme.appTheme.themeColorDark),
          textTheme: theme.appTheme.textThemeDark,
          scaffoldBackgroundColor: theme.appTheme.themeColorDark,
          canvasColor: theme.appTheme.themeColorDark,
          dividerColor: theme.appTheme.themeColorPrimary,
          sliderTheme: SliderThemeData(
            activeTrackColor: theme.appTheme.themeColorPrimary,
            inactiveTrackColor:
                theme.appTheme.themeColorPrimary.withValues(alpha: 0.5),
            thumbColor: theme.appTheme.themeColorPrimary,
            overlayColor:
                theme.appTheme.themeColorPrimary.withValues(alpha: 0.5),
          ),
          progressIndicatorTheme: ProgressIndicatorThemeData(
            color: theme.appTheme.themeColorPrimary,
          ),
          iconButtonTheme: IconButtonThemeData(
              style: ButtonStyle(
                  foregroundColor:
                      WidgetStatePropertyAll(theme.appTheme.themeColorLight))),
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
