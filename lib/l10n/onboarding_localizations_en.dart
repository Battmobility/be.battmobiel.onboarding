// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'onboarding_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class OnboardingLocalizationsEn extends OnboardingLocalizations {
  OnboardingLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get formTitle => 'Become Batt';

  @override
  String get moreInfoButtonLabel => 'Why do we ask you this?';

  @override
  String get introPageNeededDocuments =>
      'Welcome to Batt! Before continuing, make sure that you have the following documents nearby: \n\n• Identity document (Belgian eId, Proof of residence, ...)\n\n• Drivers license';

  @override
  String get introPageCancelButtonText => 'Continue later';

  @override
  String stepIndicatorText(Object step, Object totalSteps) {
    return 'Step $step of $totalSteps';
  }

  @override
  String get closeButtonText => 'Close';

  @override
  String get cancelButtonText => 'Cancel';

  @override
  String get previousButtonText => 'Previous';

  @override
  String get nextButtonText => 'Next';

  @override
  String get laterButtonText => 'I\'ll do this later';

  @override
  String get doneButtonText => 'Done';

  @override
  String get continueLaterDialogTitle => 'Continue later?';

  @override
  String get continueLaterDialogMessage =>
      'Do you want to continue at a later point? You can always resume this process later, your data will be there.';

  @override
  String get continueLaterDialogOptionContinueLater => 'Continue later';

  @override
  String get continueLaterDialogOptionContinueNow => 'Continue now';

  @override
  String get scanBackIdButtonLabel => 'Get values from ID card';

  @override
  String get scanBackIdFieldLabel => 'Back of identity card';

  @override
  String get fillOutBeforeContinuing =>
      'Please fill out all fields before continuing';

  @override
  String get convictionsPageTitle => 'Previous convictions';

  @override
  String get convictionsPageMessage =>
      'For insurance reasons, we need to ask you to provide information about any previous convictions.';

  @override
  String get convictionsPageFooter =>
      'By checking this box, I declare the information entered on this page to be truthful and to accept any liability in the case it is not.';

  @override
  String get convictionTypeDrunk => 'Driving under the influence of alcohol';

  @override
  String get convictionTypeIntoxication =>
      'Driving under the influence of narcotics';

  @override
  String get convictionTypeTestRefusal => 'Refusal to take a drug test';

  @override
  String get convictionTypeHitAndRun =>
      'Fleeing the scene of an accident (\"hit and run\")';

  @override
  String get convictionTypeLicenseRevocation => 'Revocation of license';

  @override
  String get convictionTypeNoOfAccidents =>
      'Amount of accidents where you were at fault';

  @override
  String get documentsExplainerPageTitle => 'Documents';

  @override
  String get documentsExplainerPageMessage =>
      'To complete your registration, we\'ll need a few documents';

  @override
  String get documentsExplainerPageInfoButtonlabel => 'Why do we need this?';

  @override
  String get documentsExplainerPageInfoMessage =>
      'Placeholder explainer for why we need these documents';

  @override
  String get idDocumentsPageTitle => 'ID Documents';

  @override
  String get idDocumentsPageMessage =>
      'Add pictures of the front and back of your identity document below. Make sure the images are right side up and cropped to show just the document.';

  @override
  String get driversLicensePageTitle => 'Documents';

  @override
  String get driversLicensePageMessage =>
      'Add pictures of the front and back of your drivers license below. Make sure the images are right side up and cropped to show just the document.';

  @override
  String get identityPageTitle => 'Identity';

  @override
  String get identityPageMessage =>
      'We need to collect some identifying data. These will only be shared with our insurer if necessary. Please read our privacy policy to learn more about how we use your information: https://www.battmobility.be/privacy-voorwaarden/';

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
  String get identifyingDataTitle => 'Identity';

  @override
  String get firstNameFieldTitle => 'First name';

  @override
  String get lastNameFieldTitle => 'Last name';

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
  String get addressPageTitle => 'What is your home address?';

  @override
  String get address => 'Adress';

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
  String get addressCountry => 'Country';

  @override
  String get numberHint => 'Numbers only, no spaces or special characters.';

  @override
  String get phoneEntryPageTitle => 'Enter phone';

  @override
  String get verificationPageTitle => 'Verify phone';

  @override
  String get verificationPageMessage =>
      'Select your country code and phone number to verify it.';

  @override
  String get verificationPageVerifyButtonTitle => 'Send code';

  @override
  String verificationPageEnterCodeMessage(Object phoneNumber) {
    return 'Please enter the confirmation code that was sent to $phoneNumber';
  }

  @override
  String get verificationPageConfirmButtonTitle => 'Confirm code';

  @override
  String get verificationPageBusyPhone => 'Sending code...';

  @override
  String get verificationPageBusyCode => 'Checking code...';

  @override
  String get verificationPageSendCodeFailed =>
      'Failed to send verification code. Please try again later.';

  @override
  String get verificationPageCheckPhoneFailed =>
      'Failed to check phone number. Please try again later.';

  @override
  String get verificationPageVerificationSuccessMessage =>
      'Verification successful!';

  @override
  String get verificationPageVerificationFailureMessage =>
      'Verification failed!';

  @override
  String get verificationPageVerificationResend => 'Resend code';

  @override
  String get phoneFieldTitle => 'Phone number';

  @override
  String get errorPostingMessage =>
      'We encountered an error processing your data, please try again later';

  @override
  String get donePageTitle => 'All done!';

  @override
  String get donePageMessage =>
      'You completed the onboarding process, welcome to Batt!';

  @override
  String get donePageButtonTitle => 'Close this window';

  @override
  String get addSubscriptionFormTitle => 'Facturatie';

  @override
  String get addSubscriptionFormLabelExistingContracts => 'Existing contracts:';

  @override
  String get addSubscriptionFormLabelPersonalUse =>
      'Pick a contract for personal use:';

  @override
  String get addSubscriptionFormLabelNoPersonalUseButton =>
      'I will not be using BattMobility for personal use.';

  @override
  String get addSubscriptionFormNoBusinessButton =>
      'I will not be using BattMobility for business purposes.';

  @override
  String get addSubscriptionFormMessageBusinessUse =>
      'Your billing data for business use:';

  @override
  String get addSubscriptionFormLabelBusinessUse =>
      'Pick a contract for business use:';

  @override
  String get addSubscriptionFormLaterLabel => 'Ik doe dit later.';

  @override
  String get addSubscriptionFormName => 'Name';

  @override
  String get addSubscriptionFormEmail => 'Email';

  @override
  String get addSubscriptionFormAddress => 'Adress';

  @override
  String get addSubscriptionFormStreet => 'Street';

  @override
  String get addSubscriptionFormHouseNumber => 'House number + additions';

  @override
  String get addSubscriptionFormPostalCode => 'Zip code';

  @override
  String get addSubscriptionFormCity => 'City';

  @override
  String get addSubscriptionFormCountry => 'Country';

  @override
  String get addSubscriptionFormBusiness => 'For enterprises';

  @override
  String get addSubscriptionFormVAT => 'VAT-number (optional)';

  @override
  String get addSubscriptionFormEnterBusinessData => 'Enter business data';

  @override
  String get addSubscriptionFormConfirm => 'Pick a contract';

  @override
  String addSubscriptionFormSuccess(String subscription) {
    return 'Subscription $subscription added!';
  }

  @override
  String get addSubscriptionFormFailure =>
      'Adding subscription failed, try again or contact support if the problem persists';

  @override
  String get addSubscriptionFormLoadingFailure =>
      'Data could not be loaded, please try again.';

  @override
  String get createContractTitle => 'New subscription';

  @override
  String get createContractPickFormulaLabel => 'Pick a contract';

  @override
  String get createContractFormulaBattFunExplanation =>
      'Een wagen gebruiken waar en wanneer jij wil, zonder instapkosten.';

  @override
  String get createContractFormulaBattFanExplanation =>
      'Betaal je gepland maandelijks rijtegoed vooraf (min. €75/maand) en rij 25% goedkoper.';

  @override
  String get createContractFormulaBattMaxExplanation =>
      'Voordelig leasen via BattMobility. Deel en verdien tot 50% terug.';

  @override
  String get createContractCommitmentExplanation =>
      'Copy om commitment aan gebruikers uit te leggen';

  @override
  String get createContractMinimumCommitmentErrorMessage =>
      'Commitment must be at least €75';

  @override
  String get createContractConfirmButtonTitle => 'Create contract';

  @override
  String get createContractSuccessMessage => 'Contract created successfully!';

  @override
  String get createContractFailureMessage =>
      'Failed to create contract! Try again or contact customer service if the problem persists.';

  @override
  String get onboardingCompletedTitle => 'Onboarding Complete!';

  @override
  String get onboardingCompletedMessage =>
      'Congratulations! You have successfully completed the onboarding process.';

  @override
  String get onboardingCompletedAppStoreMessage =>
      'Download the Batt mobile app from the App Store to get started.';

  @override
  String get onboardingCompletedAppStoreLink => 'Download from App Store';

  @override
  String get onboardingCompletedPlayStoreLink => 'Download from Play Store';

  @override
  String get formulaBattFunDescription =>
      'Comfort fleet without subscription costs';

  @override
  String get formulaBattFunPlusDLDescription =>
      'Luxury fleet, no fixed cost, warranty arranged by your employer.';

  @override
  String get formulaBattFanDescription =>
      'Comfort fleet + monthly fixed prepaid, 25% discount.';

  @override
  String get formulaBattFunPlusDescription =>
      'Luxury fleet without subscription costs';

  @override
  String get formulaBattFanPlusDescription =>
      'Luxury fleet + monthly fixed prepaid, 25% discount.';

  @override
  String get formulaBattForBusinessDescription =>
      'For businesses: luxury fleet at 25% discount';

  @override
  String get noFormulasAvailable =>
      'No formulas available for this subscription';

  @override
  String warrantyAmount(Object amount) {
    return 'Warranty: €$amount';
  }

  @override
  String minimumCommitment(Object amount) {
    return 'Minimum commitment: €$amount';
  }

  @override
  String get commitmentAmount => 'Commitment Amount';

  @override
  String get enterAmount => 'Enter amount';

  @override
  String commitmentMinimumError(Object amount) {
    return 'Commitment must be at least €$amount';
  }

  @override
  String minimumPrefix(Object amount) {
    return 'Minimum: €$amount';
  }

  @override
  String get onboardingStepIntro => 'Welcome';

  @override
  String get onboardingStepPersonal => 'Personal Information';

  @override
  String get onboardingStepAddress => 'Address';

  @override
  String get onboardingStepPhone => 'Phone Number';

  @override
  String get onboardingStepPhoneVerification => 'Phone Verification';

  @override
  String get onboardingStepDocumentsExplainer => 'Documents';

  @override
  String get onboardingStepIdDocuments => 'Upload Documents';

  @override
  String get onboardingStepLegal => 'Legal Information';

  @override
  String get onboardingStepCreateClient => 'Billing Information';
}
