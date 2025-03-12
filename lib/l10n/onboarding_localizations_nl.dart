// ignore: unused_import
import 'package:intl/intl.dart' as intl;
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
  String get closeButtonText => 'Close';

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
  String get documentsPageTitle => 'Documents';

  @override
  String get documentsPageMessage => 'Add pictures of the front and back of your identity document and drivers license below. Make sure the images are right side up and cropped to show just the document.';

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
  String get addressCountry => 'Land';

  @override
  String get numberHint => 'Enkel cijfers, geen spaties of speciale tekens.';

  @override
  String get verificationPageTitle => 'Verifieer telefoonnummer';

  @override
  String get verificationPageMessage => 'Selecteer je landcode en geef het nummer in waarop je een code wil ontvangen.';

  @override
  String get verificationPageVerifyButtonTitle => 'Stuur code';

  @override
  String verificationPageEnterCodeMessage(Object phoneNumber) {
    return 'Voer hieronder de code in die verstuurd werd naar $phoneNumber';
  }

  @override
  String get verificationPageConfirmButtonTitle => 'Bevestig code';

  @override
  String get verificationPageBusyPhone => 'Code versturen';

  @override
  String get verificationPageBusyCode => 'Code controleren...';

  @override
  String get verificationPageSendCodeFailed => 'Code versturen mislukt. Probeer het later opnieuw.';

  @override
  String get verificationPageCheckPhoneFailed => 'Code verifiëren mislukt. Probeer het later opnieuw.';

  @override
  String get verificationPageVerificationSuccessMessage => 'Verificatie geslaagd!';

  @override
  String get verificationPageVerificationFailureMessage => 'Verificatie mislukt!';

  @override
  String get verificationPageVerificationResend => 'Verstuur code opnieuw';

  @override
  String get phoneFieldTitle => 'Telefoon';

  @override
  String get errorPostingMessage => 'We konden je gegevens niet verwerken, gelieve het later opnieuw te proberen.';

  @override
  String get donePageTitle => 'Klaar!';

  @override
  String get donePageMessage => 'Je hebt alle gegevens ingegeven, welkom bij Batt!';

  @override
  String get donePageButtonTitle => 'Sluit dit venster';

  @override
  String get addSubscriptionFormTitle => 'Facturatie';

  @override
  String get addSubscriptionFormMessage => 'Geef hieronder je facturatiegegevens in.';

  @override
  String get addSubscriptionFormLaterLabel => 'Ik doe dit later.';

  @override
  String get addSubscriptionFormName => 'Naam';

  @override
  String get addSubscriptionFormEmail => 'Email';

  @override
  String get addSubscriptionFormAddress => 'Adres';

  @override
  String get addSubscriptionFormStreet => 'Straat';

  @override
  String get addSubscriptionFormHouseNumber => 'Huisnummer (+ toevoegingen)';

  @override
  String get addSubscriptionFormPostalCode => 'Postcode';

  @override
  String get addSubscriptionFormCity => 'Gemeente';

  @override
  String get addSubscriptionFormCountry => 'Land';

  @override
  String get addSubscriptionFormBusiness => 'Voor bedrijven';

  @override
  String get addSubscriptionFormVAT => 'BTW-nummer (optioneel)';

  @override
  String get addSubscriptionFormConfirm => 'Kies een contract';

  @override
  String addSubscriptionFormSuccess(String subscription) {
    return 'Abonnement $subscription toegevoegd!';
  }

  @override
  String get addSubscriptionFormFailure => 'Adding subscription failed, try again or contact support if the problem persists';

  @override
  String get addSubscriptionFormLoadingFailure => 'Data konden niet worden geladen, probeer het alstublieft opnieuw.';

  @override
  String get createContractTitle => 'Nieuw contract';

  @override
  String get createContractPickFormulaLabel => 'Kies een formule';

  @override
  String get createContractFormulaBattFunExplanation => 'Een wagen gebruiken waar en wanneer jij wil, zonder instapkosten.';

  @override
  String get createContractFormulaBattFanExplanation => 'Betaal je gepland maandelijks rijtegoed vooraf (min. €75/maand) en rij 25% goedkoper.';

  @override
  String get createContractFormulaBattMaxExplanation => 'Voordelig leasen via BattMobility. Deel en verdien tot 50% terug.';

  @override
  String get createContractCommitmentExplanation => 'Copy om commitment aan gebruikers uit te leggen';

  @override
  String get createContractMinimumCommitmentErrorMessage => 'Commitment must be at least €75';

  @override
  String get createContractConfirmButtonTitle => 'Maak contract';

  @override
  String get createContractSuccessMessage => 'Contract maken geslaagd!';

  @override
  String get createContractFailureMessage => 'Contract maken mislukt! Probeer het opnieuw of neem contact op met de klantendienst.';
}
