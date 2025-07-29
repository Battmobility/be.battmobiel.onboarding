// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'onboarding_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class OnboardingLocalizationsFr extends OnboardingLocalizations {
  OnboardingLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get formTitle => 'Deviens membre de Battmobility';

  @override
  String get moreInfoButtonLabel => 'Pourquoi demandons-nous cela ?';

  @override
  String get introPageNeededDocuments =>
      'Avant de continuer, assurez-vous davoir les documents suivants à portée de main : \n\n• Document didentité (eID belge, preuve de résidence, ...)\n\n• Permis de conduire';

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
  String get convictionsPageTitle => 'Information légale';

  @override
  String get convictionsPageMessage =>
      'Pour des raisons dassurance, nous devons vous demander de fournir des informations sur déventuelles condamnations antérieures.';

  @override
  String get convictionsPageFooter =>
      'En cochant cette case, je déclare que les informations saisies sur cette page sont véridiques et j\'accepte toute responsabilité en cas de fausse déclaration.';

  @override
  String get convictionTypeDrunk => 'Conduite sous linfluence de lalcool';

  @override
  String get convictionTypeIntoxication =>
      'Conduite sous l\'influence de stupéfiants';

  @override
  String get convictionTypeTestRefusal =>
      'Refus de se soumettre à un test de dépistage';

  @override
  String get convictionTypeHitAndRun =>
      'Fuite de la scène d\'un accident (\"hit and run\")';

  @override
  String get convictionTypeLicenseRevocation => 'évocation de permis';

  @override
  String get convictionTypeNoOfAccidents =>
      'Combien d\'accidents où vous étiez en faute avez-vous eus?';

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
      'Il faut que nous recueillons certaines données d\'identification. Celles-ci ne seront partagées avec notre assureur que si nécessaire.';

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
  String get addressPageTitle => 'What is your home address?';

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
      'Échec de l\'envoi du code de vérification. Votre numéro de téléphone est-il correct ? Veuillez réessayer plus tard.';

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
  String get phoneFieldTitle => 'Téléphone';

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
  String get addSubscriptionFormTitle => 'Billing';

  @override
  String get addSubscriptionFormLabelExistingContracts => 'Votre contracts';

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
      'Si vous voulez utiliser BattMobility pour votre entreprise, veuillez fournir les informations suivantes ou sauter cette étape.';

  @override
  String get addSubscriptionFormLabelBusinessUse =>
      'Pick a contract for business use:';

  @override
  String get addSubscriptionFormLaterLabel => 'Ill do this later';

  @override
  String get addSubscriptionFormName => 'Nom de l\'entreprise';

  @override
  String get addSubscriptionFormEmail => 'Email de l\'entreprise (facturation)';

  @override
  String get addSubscriptionFormAddress => 'Adresse de l\'entreprise';

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
  String get addSubscriptionFormEnterBusinessData => 'Enter business data';

  @override
  String get addSubscriptionFormConfirm => 'Choisir formule et confirmer';

  @override
  String addSubscriptionFormSuccess(String subscription) {
    return 'Abonnement $subscription toegevoegd!';
  }

  @override
  String get addSubscriptionFormFailure =>
      'Adding subscription failed, try again or contact support if the problem persists';

  @override
  String get addSubscriptionFormLoadingFailure =>
      'Data konden niet worden geladen, probeer het alstublieft opnieuw.';

  @override
  String get createContractTitle => 'Nieuw contract';

  @override
  String get createContractPickFormulaLabel => 'Kies een formule';

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
  String get createContractConfirmButtonTitle => 'Maak contract';

  @override
  String get createContractSuccessMessage => 'Contract maken geslaagd!';

  @override
  String get createContractFailureMessage =>
      'Échec de la création du contrat ! Réessayez ou contactez le service client si le problème persiste.';

  @override
  String get onboardingCompletedTitle => 'Intégration Terminée !';

  @override
  String get onboardingCompletedMessage =>
      'Vous pouvez télécharger l\'application BattMobility mais nous devrons vérifier vos documents avant que vous puissiez commencer à l\'utiliser.Vous recevrez un e-mail avec des instructions pour le paiement de la garantie si nécessaire.';

  @override
  String get onboardingCompletedAppStoreMessage =>
      'Téléchargez votre application Batt.';

  @override
  String get onboardingCompletedAppStoreLink =>
      'Télécharger depuis l\'App Store';

  @override
  String get onboardingCompletedPlayStoreLink =>
      'Télécharger depuis le Play Store';

  @override
  String get formulaBattFunDescription =>
      'Flotte de confort sans frais d\'abonnement';

  @override
  String get formulaBattFunPlusDLDescription =>
      'Flotte de luxe, pas de coût fixe, garantie organisée par votre employeur.';

  @override
  String get formulaBattFanDescription =>
      'Flotte de confort + prépayé fixe mensuel, 25% de réduction.';

  @override
  String get formulaBattFunPlusDescription =>
      'Flotte de luxe sans frais d\'abonnement';

  @override
  String get formulaBattFanPlusDescription =>
      'Flotte de luxe + prépayé fixe mensuel, 25% de réduction.';

  @override
  String get formulaBattForBusinessDescription =>
      'Pour les entreprises : flotte de luxe à 25% de réduction';

  @override
  String get noFormulasAvailable =>
      'Aucune formule disponible pour cet abonnement';

  @override
  String warrantyAmount(Object amount) {
    return 'Garantie : €$amount';
  }

  @override
  String minimumCommitment(Object amount) {
    return 'Engagement minimum : €$amount';
  }

  @override
  String get commitmentAmount => 'Montant d\'engagement';

  @override
  String get enterAmount => 'Saisir le montant';

  @override
  String commitmentMinimumError(Object amount) {
    return 'L\'engagement doit être d\'au moins €$amount';
  }

  @override
  String minimumPrefix(Object amount) {
    return 'Minimum : €$amount';
  }

  @override
  String get onboardingStepIntro => 'Bienvenue';

  @override
  String get onboardingStepPersonal => 'Informations personnelles';

  @override
  String get onboardingStepAddress => 'Adresse';

  @override
  String get onboardingStepPhone => 'Numéro de téléphone';

  @override
  String get onboardingStepPhoneVerification => 'Vérification du téléphone';

  @override
  String get onboardingStepDocumentsExplainer => 'Documents';

  @override
  String get onboardingStepIdDocuments => 'Télécharger les documents';

  @override
  String get onboardingStepLegal => 'Informations légales';

  @override
  String get onboardingStepCreateClient => 'Informations de facturation';

  @override
  String get contractVerificationInProgress =>
      'Contract verification is in progress. You will receive an email with instructions for the warranty payment.';

  @override
  String get createClientEmployeeFamilyMessage =>
      'Si votre employeur ou votre famille a déjà un plan Battmobility, vous pouvez vous arrêter ici. Faites-le nous savoir à info@battmobility.be et nous vous ajouterons au bon compte.';

  @override
  String get convictionsPageSubtitle =>
      'Have you ever been convicted for the following:';

  @override
  String get formulaPickerBattFunTitle => 'BattFun';

  @override
  String get formulaPickerBattFunDescription => 'Pas de coûts d\'abonnement';

  @override
  String get formulaPickerBattFanTitle => 'BattFan';

  @override
  String get formulaPickerBattFanDescription =>
      'Prépayé fixe mensuel, 25% de réduction';

  @override
  String get formulaPickerUseLuxuryFleet => 'Utiliser la flotte de luxe';

  @override
  String get documentsFileTooLargeError =>
      'Les fichiers téléchargés sont trop volumineux. Veuillez réduire la taille des fichiers et réessayer.';

  @override
  String validationMessageMinlength(Object minLength) {
    return 'Min. $minLength caractères';
  }

  @override
  String get skip => 'Passer';

  @override
  String get addBusinessInfo => 'Données entreprise';
}
