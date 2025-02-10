import 'onboarding_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class OnboardingLocalizationsFr extends OnboardingLocalizations {
  OnboardingLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get formTitle => 'Deviens Batt';

  @override
  String get introPageNeededDocuments => 'Welcome to Batt! Before continuing, make sure that you have the following documents nearby: \n\n• Identity document (Belgian Eid, Proof of residence, ...)\n\n• Drivers license';

  @override
  String get introPageCancelButtonText => 'Continue later';

  @override
  String stepIndicatorText(Object step, Object totalSteps) {
    return 'Step $step of $totalSteps';
  }

  @override
  String get previousButtonText => 'Previous';

  @override
  String get nextButtonText => 'Next';

  @override
  String get fillOutBeforeContinuing => 'Please fill out all fields before continuing';

  @override
  String get convictionsPageTitle => 'Convictions page title';

  @override
  String get convictionsPageMessage => 'For insurance reasons, we need to ask you to provide information about any previous convictions.';

  @override
  String get convictionsPageFooter => 'By checking this box, I declare the information entered on this page to be truthful and to accept any liability in the case it is not.';

  @override
  String get convictionTypeDrunk => 'Driving under the influence of alcohol';

  @override
  String get convictionTypeIntoxication => 'Driving under the influence of narcotics';

  @override
  String get convictionTypeTestRefusal => 'Refusal to take a drug test';

  @override
  String get convictionTypeHitAndRun => 'Fleeing the scene of an accident (\"hit and run\")';

  @override
  String get convictionTypeLicenseRevocation => 'Revocation of license';

  @override
  String get convictionTypeNoOfAccidents => 'Amount of accidents where you were at fault';

  @override
  String get identityPageTitle => 'Identity';

  @override
  String get identityPageMessage => 'We need to collect some identifying data. These will only be shared with our insurer if necessary. Please read our privacy policy to learn more about how we use your information: https://www.battmobility.be/privacy-voorwaarden/';

  @override
  String get identityPageFileRequired => 'Please upload a file.';

  @override
  String get idCardFieldTitle => 'Identity document';

  @override
  String get idCardFieldFront => 'Front';

  @override
  String get idCardFieldBack => 'Back';

  @override
  String get driversLicenseFieldTitle => 'Drivers license';

  @override
  String get driversLicenseFieldFront => 'Front';

  @override
  String get driversLicenseFieldBack => 'Back';

  @override
  String get imagePickerLabelPickPhoto => 'Choose from library';

  @override
  String get imagePickerLabelOr => 'or';

  @override
  String get imagePickerLabelTakePhoto => 'Take a photo';

  @override
  String get imageCropperTitle => 'Crop and rotate';

  @override
  String get imageCropperActionCrop => 'Crop';

  @override
  String get imageCropperActionDelete => 'Delete';

  @override
  String get imageCropperDone => 'Done';

  @override
  String get imageCropperCancel => 'Cancel';

  @override
  String get identifyingDataTitle => 'Identité';

  @override
  String get firstNameFieldTitle => 'Prénom';

  @override
  String get lastNameFieldTitle => 'Nom';

  @override
  String get rrnFieldTitle => 'National identity number';

  @override
  String get birthDateFieldTitle => 'Date of birth';

  @override
  String get driversLicenseNumber => 'Drivers license number';

  @override
  String get driversLicenseIssuedDate => 'Drivers license issued';

  @override
  String get driversLicenseExpiresDate => 'Drivers license expires';

  @override
  String get address => 'Adresse';

  @override
  String get addressStreet => 'Street';

  @override
  String get addressNumber => 'House number';

  @override
  String get addressAddition => 'Addition';

  @override
  String get addressZip => 'Zip code';

  @override
  String get addressCity => 'City';

  @override
  String get numberHint => 'Numbers only, no spaces or special characters.';

  @override
  String get phoneFieldTitle => 'Téléphone';

  @override
  String get errorPostingMessage => 'We encountered an error processing your data, please try again later';
}
