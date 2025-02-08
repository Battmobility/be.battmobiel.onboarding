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
  OnboardingLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static OnboardingLocalizations of(BuildContext context) {
    return Localizations.of<OnboardingLocalizations>(context, OnboardingLocalizations)!;
  }

  static const LocalizationsDelegate<OnboardingLocalizations> delegate = _OnboardingLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
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
  /// **'RRN'**
  String get rrnFieldTitle;

  /// No description provided for @emailFieldTitle.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get emailFieldTitle;

  /// No description provided for @phoneFieldTitle.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get phoneFieldTitle;
}

class _OnboardingLocalizationsDelegate extends LocalizationsDelegate<OnboardingLocalizations> {
  const _OnboardingLocalizationsDelegate();

  @override
  Future<OnboardingLocalizations> load(Locale locale) {
    return SynchronousFuture<OnboardingLocalizations>(lookupOnboardingLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'fr', 'nl'].contains(locale.languageCode);

  @override
  bool shouldReload(_OnboardingLocalizationsDelegate old) => false;
}

OnboardingLocalizations lookupOnboardingLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return OnboardingLocalizationsEn();
    case 'fr': return OnboardingLocalizationsFr();
    case 'nl': return OnboardingLocalizationsNl();
  }

  throw FlutterError(
    'OnboardingLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
