import 'onboarding_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class OnboardingLocalizationsNl extends OnboardingLocalizations {
  OnboardingLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get formTitle => 'Word Batt';

  @override
  String get introPageNeededDocuments => 'Welkom bij Batt! Voor je verder gaat, zorg zeker dat je volgende documenten in de buurt hebt: \n\n• Identiteitsdocument (Belgische eId, elektronische vreemdelingenkaart ...)\n\n• Rijbewijs';

  @override
  String get introPageCancelButtonText => 'Ga een andere keer verder';

  @override
  String stepIndicatorText(Object step, Object totalSteps) {
    return 'Stap $step van $totalSteps';
  }

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
  String get convictionTypeNoOfAccidents => 'Aantal ongevallen waar u in fout was';

  @override
  String get identityPageTitle => 'Identiteit';

  @override
  String get identityPageMessage => 'We hebben enkele van je persoonsgegevens nodig. Deze worden enkel met onze verzekeraar gedeeld indien nodig. Lees meer over ons privacybeleid en hoe we met je gegevens omgaan op https://www.battmobility.be/privacy-voorwaarden/';

  @override
  String get identityPageFileRequired => 'Kies een bestand.';

  @override
  String get idCardFieldTitle => 'Identiteitsdocument';

  @override
  String get idCardFieldFront => 'Voorzijde';

  @override
  String get idCardFieldBack => 'Achterzijde';

  @override
  String get driversLicenseFieldTitle => 'Rijbewijs';

  @override
  String get driversLicenseFieldFront => 'Voorzijde';

  @override
  String get driversLicenseFieldBack => 'Achterzijde';

  @override
  String get imagePickerLabelPickPhoto => 'Kies uit bibliotheek';

  @override
  String get imagePickerLabelOr => 'of';

  @override
  String get imagePickerLabelTakePhoto => 'Neem een foto';

  @override
  String get imageCropperTitle => 'Snij bij en roteer';

  @override
  String get imageCropperActionCrop => 'Snij bij';

  @override
  String get imageCropperActionDelete => 'Wis';

  @override
  String get imageCropperDone => 'Klaar';

  @override
  String get imageCropperCancel => 'Annuleer';

  @override
  String get identifyingDataTitle => 'Identiteit';

  @override
  String get firstNameFieldTitle => 'Voornaam';

  @override
  String get lastNameFieldTitle => 'Achternaam';

  @override
  String get rrnFieldTitle => 'RRN';

  @override
  String get birthDateFieldTitle => 'Geboortedatum';

  @override
  String get driversLicenseNumber => 'Rijbewijsnummer';

  @override
  String get driversLicenseIssuedDate => 'Datum afgifte';

  @override
  String get driversLicenseExpiresDate => 'Vervaldatum';

  @override
  String get address => 'Adres';

  @override
  String get addressStreet => 'Straat';

  @override
  String get addressNumber => 'Huisnummer';

  @override
  String get addressAddition => 'Toevoeging';

  @override
  String get addressZip => 'Postcode';

  @override
  String get addressCity => 'Gemeente';

  @override
  String get numberHint => 'Enkel cijfers, geen spaties of speciale tekens.';

  @override
  String get phoneFieldTitle => 'Telefoon';

  @override
  String get errorPostingMessage => 'We konden je gegevens niet verwerken, gelieve het later opnieuw te proberen.';
}
