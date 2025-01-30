import 'onboarding_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class OnboardingLocalizationsNl extends OnboardingLocalizations {
  OnboardingLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get formTitle => 'Word Batt';

  @override
  String get firstNameFieldTitle => 'Voornaam';

  @override
  String get lastNameFieldTitle => 'Achternaam';

  @override
  String get emailFieldTitle => 'Email';

  @override
  String get phoneFieldTitle => 'Telefoon';

  @override
  String get submitButtonText => 'Verzenden';
}
