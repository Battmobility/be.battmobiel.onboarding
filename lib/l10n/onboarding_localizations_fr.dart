import 'onboarding_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class OnboardingLocalizationsFr extends OnboardingLocalizations {
  OnboardingLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get formTitle => 'Deviens Batt';

  @override
  String get firstNameFieldTitle => 'Prénom';

  @override
  String get lastNameFieldTitle => 'Nom';

  @override
  String get emailFieldTitle => 'Adresse e-mail';

  @override
  String get phoneFieldTitle => 'Téléphone';

  @override
  String get submitButtonText => 'S inscrire';
}
