import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'onboarding_localizations_en.dart';
import 'onboarding_localizations_fr.dart';
import 'onboarding_localizations_nl.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of OnboardingLocalizations
/// returned by `OnboardingLocalizations.of(context)`.
///
/// Applications need to include `OnboardingLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/onboarding_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: OnboardingLocalizations.localizationsDelegates,
///   supportedLocales: OnboardingLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the OnboardingLocalizations.supportedLocales
/// property.
abstract class OnboardingLocalizations {
  OnboardingLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static OnboardingLocalizations of(BuildContext context) {
    return Localizations.of<OnboardingLocalizations>(
        context, OnboardingLocalizations)!;
  }

  static const LocalizationsDelegate<OnboardingLocalizations> delegate =
      _OnboardingLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('fr'),
    Locale('nl')
  ];

  /// No description provided for @formTitle.
  ///
  /// In en, this message translates to:
  /// **'Become Batt'**
  String get formTitle;

  /// No description provided for @moreInfoButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Why do we ask you this?'**
  String get moreInfoButtonLabel;

  /// No description provided for @introPageNeededDocuments.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Batt! Before continuing, make sure that you have the following documents nearby: \n\n• Identity document (Belgian eId, Proof of residence, ...)\n\n• Drivers license'**
  String get introPageNeededDocuments;

  /// No description provided for @introPageCancelButtonText.
  ///
  /// In en, this message translates to:
  /// **'Continue later'**
  String get introPageCancelButtonText;

  /// No description provided for @stepIndicatorText.
  ///
  /// In en, this message translates to:
  /// **'Step {step} of {totalSteps}'**
  String stepIndicatorText(Object step, Object totalSteps);

  /// No description provided for @closeButtonText.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get closeButtonText;

  /// No description provided for @cancelButtonText.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancelButtonText;

  /// No description provided for @previousButtonText.
  ///
  /// In en, this message translates to:
  /// **'Previous'**
  String get previousButtonText;

  /// No description provided for @nextButtonText.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get nextButtonText;

  /// No description provided for @laterButtonText.
  ///
  /// In en, this message translates to:
  /// **'I\'\'ll do this later'**
  String get laterButtonText;

  /// No description provided for @doneButtonText.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get doneButtonText;

  /// No description provided for @continueLaterDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Continue later?'**
  String get continueLaterDialogTitle;

  /// No description provided for @continueLaterDialogMessage.
  ///
  /// In en, this message translates to:
  /// **'Do you want to continue at a later point? You can always resume this process later, your data will be there.'**
  String get continueLaterDialogMessage;

  /// No description provided for @continueLaterDialogOptionContinueLater.
  ///
  /// In en, this message translates to:
  /// **'Continue later'**
  String get continueLaterDialogOptionContinueLater;

  /// No description provided for @continueLaterDialogOptionContinueNow.
  ///
  /// In en, this message translates to:
  /// **'Continue now'**
  String get continueLaterDialogOptionContinueNow;

  /// No description provided for @scanBackIdButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Get values from ID card'**
  String get scanBackIdButtonLabel;

  /// No description provided for @scanBackIdFieldLabel.
  ///
  /// In en, this message translates to:
  /// **'Back of identity card'**
  String get scanBackIdFieldLabel;

  /// No description provided for @fillOutBeforeContinuing.
  ///
  /// In en, this message translates to:
  /// **'Please fill out all fields before continuing'**
  String get fillOutBeforeContinuing;

  /// No description provided for @convictionsPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Previous convictions'**
  String get convictionsPageTitle;

  /// No description provided for @convictionsPageMessage.
  ///
  /// In en, this message translates to:
  /// **'For insurance reasons, we need to ask you to provide information about any previous convictions.'**
  String get convictionsPageMessage;

  /// No description provided for @convictionsPageFooter.
  ///
  /// In en, this message translates to:
  /// **'By checking this box, I declare the information entered on this page to be truthful and to accept any liability in the case it is not.'**
  String get convictionsPageFooter;

  /// No description provided for @convictionTypeDrunk.
  ///
  /// In en, this message translates to:
  /// **'Driving under the influence of alcohol'**
  String get convictionTypeDrunk;

  /// No description provided for @convictionTypeIntoxication.
  ///
  /// In en, this message translates to:
  /// **'Driving under the influence of narcotics'**
  String get convictionTypeIntoxication;

  /// No description provided for @convictionTypeTestRefusal.
  ///
  /// In en, this message translates to:
  /// **'Refusal to take a drug test'**
  String get convictionTypeTestRefusal;

  /// No description provided for @convictionTypeHitAndRun.
  ///
  /// In en, this message translates to:
  /// **'Fleeing the scene of an accident (\"hit and run\")'**
  String get convictionTypeHitAndRun;

  /// No description provided for @convictionTypeLicenseRevocation.
  ///
  /// In en, this message translates to:
  /// **'Revocation of license'**
  String get convictionTypeLicenseRevocation;

  /// No description provided for @convictionTypeNoOfAccidents.
  ///
  /// In en, this message translates to:
  /// **'Amount of accidents where you were at fault'**
  String get convictionTypeNoOfAccidents;

  /// No description provided for @documentsExplainerPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Documents'**
  String get documentsExplainerPageTitle;

  /// No description provided for @documentsExplainerPageMessage.
  ///
  /// In en, this message translates to:
  /// **'To complete your registration, we\'\'ll need a few documents'**
  String get documentsExplainerPageMessage;

  /// No description provided for @documentsExplainerPageInfoButtonlabel.
  ///
  /// In en, this message translates to:
  /// **'Why do we need this?'**
  String get documentsExplainerPageInfoButtonlabel;

  /// No description provided for @documentsExplainerPageInfoMessage.
  ///
  /// In en, this message translates to:
  /// **'Placeholder explainer for why we need these documents'**
  String get documentsExplainerPageInfoMessage;

  /// No description provided for @idDocumentsPageTitle.
  ///
  /// In en, this message translates to:
  /// **'ID Documents'**
  String get idDocumentsPageTitle;

  /// No description provided for @idDocumentsPageMessage.
  ///
  /// In en, this message translates to:
  /// **'Add pictures of the front and back of your identity document below. Make sure the images are right side up and cropped to show just the document.'**
  String get idDocumentsPageMessage;

  /// No description provided for @driversLicensePageTitle.
  ///
  /// In en, this message translates to:
  /// **'Documents'**
  String get driversLicensePageTitle;

  /// No description provided for @driversLicensePageMessage.
  ///
  /// In en, this message translates to:
  /// **'Add pictures of the front and back of your drivers license below. Make sure the images are right side up and cropped to show just the document.'**
  String get driversLicensePageMessage;

  /// No description provided for @identityPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Identity'**
  String get identityPageTitle;

  /// No description provided for @identityPageMessage.
  ///
  /// In en, this message translates to:
  /// **'We need to collect some identifying data. These will only be shared with our insurer if necessary. Please read our privacy policy to learn more about how we use your information: https://www.battmobility.be/privacy-voorwaarden/'**
  String get identityPageMessage;

  /// No description provided for @identityPageFileRequired.
  ///
  /// In en, this message translates to:
  /// **'Please upload a file.'**
  String get identityPageFileRequired;

  /// No description provided for @idCardFieldTitle.
  ///
  /// In en, this message translates to:
  /// **'Identity document'**
  String get idCardFieldTitle;

  /// No description provided for @idCardFieldFront.
  ///
  /// In en, this message translates to:
  /// **'Front'**
  String get idCardFieldFront;

  /// No description provided for @idCardFieldBack.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get idCardFieldBack;

  /// No description provided for @driversLicenseFieldTitle.
  ///
  /// In en, this message translates to:
  /// **'Drivers license'**
  String get driversLicenseFieldTitle;

  /// No description provided for @driversLicenseFieldFront.
  ///
  /// In en, this message translates to:
  /// **'Front'**
  String get driversLicenseFieldFront;

  /// No description provided for @driversLicenseFieldBack.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get driversLicenseFieldBack;

  /// No description provided for @imagePickerLabelPickPhoto.
  ///
  /// In en, this message translates to:
  /// **'Choose from library'**
  String get imagePickerLabelPickPhoto;

  /// No description provided for @imagePickerLabelOr.
  ///
  /// In en, this message translates to:
  /// **'or'**
  String get imagePickerLabelOr;

  /// No description provided for @imagePickerLabelTakePhoto.
  ///
  /// In en, this message translates to:
  /// **'Take a photo'**
  String get imagePickerLabelTakePhoto;

  /// No description provided for @imageCropperTitle.
  ///
  /// In en, this message translates to:
  /// **'Crop and rotate'**
  String get imageCropperTitle;

  /// No description provided for @imageCropperActionCrop.
  ///
  /// In en, this message translates to:
  /// **'Crop'**
  String get imageCropperActionCrop;

  /// No description provided for @imageCropperActionDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get imageCropperActionDelete;

  /// No description provided for @imageCropperDone.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get imageCropperDone;

  /// No description provided for @imageCropperCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get imageCropperCancel;

  /// No description provided for @identifyingDataTitle.
  ///
  /// In en, this message translates to:
  /// **'Identity'**
  String get identifyingDataTitle;

  /// No description provided for @firstNameFieldTitle.
  ///
  /// In en, this message translates to:
  /// **'First name'**
  String get firstNameFieldTitle;

  /// No description provided for @lastNameFieldTitle.
  ///
  /// In en, this message translates to:
  /// **'Last name'**
  String get lastNameFieldTitle;

  /// No description provided for @rrnFieldTitle.
  ///
  /// In en, this message translates to:
  /// **'National identity number'**
  String get rrnFieldTitle;

  /// No description provided for @birthDateFieldTitle.
  ///
  /// In en, this message translates to:
  /// **'Date of birth'**
  String get birthDateFieldTitle;

  /// No description provided for @driversLicenseNumber.
  ///
  /// In en, this message translates to:
  /// **'Drivers license number'**
  String get driversLicenseNumber;

  /// No description provided for @driversLicenseIssuedDate.
  ///
  /// In en, this message translates to:
  /// **'Drivers license issued'**
  String get driversLicenseIssuedDate;

  /// No description provided for @driversLicenseExpiresDate.
  ///
  /// In en, this message translates to:
  /// **'Drivers license expires'**
  String get driversLicenseExpiresDate;

  /// No description provided for @addressPageTitle.
  ///
  /// In en, this message translates to:
  /// **'What is your home address?'**
  String get addressPageTitle;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Adress'**
  String get address;

  /// No description provided for @addressStreet.
  ///
  /// In en, this message translates to:
  /// **'Street'**
  String get addressStreet;

  /// No description provided for @addressNumber.
  ///
  /// In en, this message translates to:
  /// **'House number'**
  String get addressNumber;

  /// No description provided for @addressAddition.
  ///
  /// In en, this message translates to:
  /// **'Addition'**
  String get addressAddition;

  /// No description provided for @addressZip.
  ///
  /// In en, this message translates to:
  /// **'Zip code'**
  String get addressZip;

  /// No description provided for @addressCity.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get addressCity;

  /// No description provided for @addressCountry.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get addressCountry;

  /// No description provided for @numberHint.
  ///
  /// In en, this message translates to:
  /// **'Numbers only, no spaces or special characters.'**
  String get numberHint;

  /// No description provided for @phoneEntryPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Enter phone'**
  String get phoneEntryPageTitle;

  /// No description provided for @verificationPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Verify phone'**
  String get verificationPageTitle;

  /// No description provided for @verificationPageMessage.
  ///
  /// In en, this message translates to:
  /// **'Select your country code and phone number to verify it.'**
  String get verificationPageMessage;

  /// No description provided for @verificationPageVerifyButtonTitle.
  ///
  /// In en, this message translates to:
  /// **'Send code'**
  String get verificationPageVerifyButtonTitle;

  /// No description provided for @verificationPageEnterCodeMessage.
  ///
  /// In en, this message translates to:
  /// **'Please enter the confirmation code that was sent to {phoneNumber}'**
  String verificationPageEnterCodeMessage(Object phoneNumber);

  /// No description provided for @verificationPageConfirmButtonTitle.
  ///
  /// In en, this message translates to:
  /// **'Confirm code'**
  String get verificationPageConfirmButtonTitle;

  /// No description provided for @verificationPageBusyPhone.
  ///
  /// In en, this message translates to:
  /// **'Sending code...'**
  String get verificationPageBusyPhone;

  /// No description provided for @verificationPageBusyCode.
  ///
  /// In en, this message translates to:
  /// **'Checking code...'**
  String get verificationPageBusyCode;

  /// No description provided for @verificationPageSendCodeFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to send verification code. Please try again later.'**
  String get verificationPageSendCodeFailed;

  /// No description provided for @verificationPageCheckPhoneFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to check phone number. Please try again later.'**
  String get verificationPageCheckPhoneFailed;

  /// No description provided for @verificationPageVerificationSuccessMessage.
  ///
  /// In en, this message translates to:
  /// **'Verification successful!'**
  String get verificationPageVerificationSuccessMessage;

  /// No description provided for @verificationPageVerificationFailureMessage.
  ///
  /// In en, this message translates to:
  /// **'Verification failed!'**
  String get verificationPageVerificationFailureMessage;

  /// No description provided for @verificationPageVerificationResend.
  ///
  /// In en, this message translates to:
  /// **'Resend code'**
  String get verificationPageVerificationResend;

  /// No description provided for @phoneFieldTitle.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get phoneFieldTitle;

  /// No description provided for @errorPostingMessage.
  ///
  /// In en, this message translates to:
  /// **'We encountered an error processing your data, please try again later'**
  String get errorPostingMessage;

  /// No description provided for @donePageTitle.
  ///
  /// In en, this message translates to:
  /// **'All done!'**
  String get donePageTitle;

  /// No description provided for @donePageMessage.
  ///
  /// In en, this message translates to:
  /// **'You completed the onboarding process, welcome to Batt!'**
  String get donePageMessage;

  /// No description provided for @donePageButtonTitle.
  ///
  /// In en, this message translates to:
  /// **'Close this window'**
  String get donePageButtonTitle;

  /// No description provided for @addSubscriptionFormTitle.
  ///
  /// In en, this message translates to:
  /// **'Facturatie'**
  String get addSubscriptionFormTitle;

  /// No description provided for @addSubscriptionFormMessage.
  ///
  /// In en, this message translates to:
  /// **'Geef hieronder je facturatiegegevens in.'**
  String get addSubscriptionFormMessage;

  /// No description provided for @addSubscriptionFormLaterLabel.
  ///
  /// In en, this message translates to:
  /// **'Ik doe dit later.'**
  String get addSubscriptionFormLaterLabel;

  /// No description provided for @addSubscriptionFormName.
  ///
  /// In en, this message translates to:
  /// **'Naam'**
  String get addSubscriptionFormName;

  /// No description provided for @addSubscriptionFormEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get addSubscriptionFormEmail;

  /// No description provided for @addSubscriptionFormAddress.
  ///
  /// In en, this message translates to:
  /// **'Adres'**
  String get addSubscriptionFormAddress;

  /// No description provided for @addSubscriptionFormStreet.
  ///
  /// In en, this message translates to:
  /// **'Straat'**
  String get addSubscriptionFormStreet;

  /// No description provided for @addSubscriptionFormHouseNumber.
  ///
  /// In en, this message translates to:
  /// **'Huisnummer (+ toevoegingen)'**
  String get addSubscriptionFormHouseNumber;

  /// No description provided for @addSubscriptionFormPostalCode.
  ///
  /// In en, this message translates to:
  /// **'Postcode'**
  String get addSubscriptionFormPostalCode;

  /// No description provided for @addSubscriptionFormCity.
  ///
  /// In en, this message translates to:
  /// **'Gemeente'**
  String get addSubscriptionFormCity;

  /// No description provided for @addSubscriptionFormCountry.
  ///
  /// In en, this message translates to:
  /// **'Land'**
  String get addSubscriptionFormCountry;

  /// No description provided for @addSubscriptionFormBusiness.
  ///
  /// In en, this message translates to:
  /// **'Voor bedrijven'**
  String get addSubscriptionFormBusiness;

  /// No description provided for @addSubscriptionFormVAT.
  ///
  /// In en, this message translates to:
  /// **'BTW-nummer (optioneel)'**
  String get addSubscriptionFormVAT;

  /// No description provided for @addSubscriptionFormConfirm.
  ///
  /// In en, this message translates to:
  /// **'Kies een contract'**
  String get addSubscriptionFormConfirm;

  /// No description provided for @addSubscriptionFormSuccess.
  ///
  /// In en, this message translates to:
  /// **'Abonnement {subscription} toegevoegd!'**
  String addSubscriptionFormSuccess(String subscription);

  /// No description provided for @addSubscriptionFormFailure.
  ///
  /// In en, this message translates to:
  /// **'Adding subscription failed, try again or contact support if the problem persists'**
  String get addSubscriptionFormFailure;

  /// No description provided for @addSubscriptionFormLoadingFailure.
  ///
  /// In en, this message translates to:
  /// **'Data konden niet worden geladen, probeer het alstublieft opnieuw.'**
  String get addSubscriptionFormLoadingFailure;

  /// No description provided for @createContractTitle.
  ///
  /// In en, this message translates to:
  /// **'Nieuw contract'**
  String get createContractTitle;

  /// No description provided for @createContractPickFormulaLabel.
  ///
  /// In en, this message translates to:
  /// **'Kies een formule'**
  String get createContractPickFormulaLabel;

  /// No description provided for @createContractFormulaBattFunExplanation.
  ///
  /// In en, this message translates to:
  /// **'Een wagen gebruiken waar en wanneer jij wil, zonder instapkosten.'**
  String get createContractFormulaBattFunExplanation;

  /// No description provided for @createContractFormulaBattFanExplanation.
  ///
  /// In en, this message translates to:
  /// **'Betaal je gepland maandelijks rijtegoed vooraf (min. €75/maand) en rij 25% goedkoper.'**
  String get createContractFormulaBattFanExplanation;

  /// No description provided for @createContractFormulaBattMaxExplanation.
  ///
  /// In en, this message translates to:
  /// **'Voordelig leasen via BattMobility. Deel en verdien tot 50% terug.'**
  String get createContractFormulaBattMaxExplanation;

  /// No description provided for @createContractCommitmentExplanation.
  ///
  /// In en, this message translates to:
  /// **'Copy om commitment aan gebruikers uit te leggen'**
  String get createContractCommitmentExplanation;

  /// No description provided for @createContractMinimumCommitmentErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'Commitment must be at least €75'**
  String get createContractMinimumCommitmentErrorMessage;

  /// No description provided for @createContractConfirmButtonTitle.
  ///
  /// In en, this message translates to:
  /// **'Create contract'**
  String get createContractConfirmButtonTitle;

  /// No description provided for @createContractSuccessMessage.
  ///
  /// In en, this message translates to:
  /// **'Contract created successfully!'**
  String get createContractSuccessMessage;

  /// No description provided for @createContractFailureMessage.
  ///
  /// In en, this message translates to:
  /// **'Failed to create contract! Try again or contact customer service if the problem persists.'**
  String get createContractFailureMessage;
}

class _OnboardingLocalizationsDelegate
    extends LocalizationsDelegate<OnboardingLocalizations> {
  const _OnboardingLocalizationsDelegate();

  @override
  Future<OnboardingLocalizations> load(Locale locale) {
    return SynchronousFuture<OnboardingLocalizations>(
        lookupOnboardingLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'fr', 'nl'].contains(locale.languageCode);

  @override
  bool shouldReload(_OnboardingLocalizationsDelegate old) => false;
}

OnboardingLocalizations lookupOnboardingLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return OnboardingLocalizationsEn();
    case 'fr':
      return OnboardingLocalizationsFr();
    case 'nl':
      return OnboardingLocalizationsNl();
  }

  throw FlutterError(
      'OnboardingLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
