import 'onboarding_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class OnboardingLocalizationsEn extends OnboardingLocalizations {
  OnboardingLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get formTitle => 'Become Batt';

  @override
  String get firstNameFieldTitle => 'First name';

  @override
  String get lastNameFieldTitle => 'Last name';

  @override
  String get emailFieldTitle => 'Email';

  @override
  String get phoneFieldTitle => 'Phone number';

  @override
  String get submitButtonText => 'Submit';
}
