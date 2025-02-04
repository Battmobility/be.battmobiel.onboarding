import 'onboarding_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class OnboardingLocalizationsNl extends OnboardingLocalizations {
  OnboardingLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get formTitle => 'Word Batt';

  @override
  String get previousButtonText => 'Vorige';

  @override
  String get nextButtonText => 'Volgende';

  @override
  String get fillOutBeforeContinuing => 'Vul alle velden in om verder te gaan';

  @override
  String get convictionsPageTitle => 'Misdrijven of veroordelingen';

  @override
  String get convictionsPageMessage => 'Om verzekeringsredenen zijn wij verplicht u een aantal vragen rond eerdere misdrijven of veroordelingen in het verkeer te stellen.';

  @override
  String get convictionsPageFooter => 'Door dit vak aan te kruisen verklaar ik dat alle op deze pagina ingevulde informatie waar is en aanvaard ik de aansprakelijkheid indien dit niet zo is.';

  @override
  String get convictionTypeDrunk => 'Besturen van een voertuig onder de invloed van alcohol';

  @override
  String get convictionTypeIntoxication => 'Besturen van een voertuig onder de invloed van andere verdovende stoffen';

  @override
  String get convictionTypeTestRefusal => 'Het weigeren van een drugtest';

  @override
  String get convictionTypeHitAndRun => 'Het verlaten van de plaats van een ongeval dat ik veroorzaakt heb (vluchtmisdrijf)';

  @override
  String get convictionTypeLicenseRevocation => 'Intrekken van rijbewijs';

  @override
  String get firstNameFieldTitle => 'Voornaam';

  @override
  String get lastNameFieldTitle => 'Achternaam';

  @override
  String get emailFieldTitle => 'Email';

  @override
  String get phoneFieldTitle => 'Telefoon';
}
