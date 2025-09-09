import 'package:batt_kit/api/generated/batt_kit.swagger.dart' as api;
import 'package:batt_onboarding/src/domain/subscription.dart';
import 'package:batt_onboarding/src/domain/subscription_mapper.dart';

final class OnboardingProgress {
  final Map<String, dynamic> legal;
  final Map<String, dynamic> personal;
  final Map<String, dynamic> phone;

  int progress;
  final List<Subscription> subscriptions;

  OnboardingProgress({
    required this.legal,
    required this.personal,
    required this.progress,
    required this.phone,
    required this.subscriptions,
  });

  factory OnboardingProgress.fromContract(api.Onboarding? onboarding) {
    print('OnboardingProgress.fromContract called with onboarding: ${onboarding != null ? "not null" : "null"}');
    
    if (onboarding != null) {
      try {
        print('Processing legal data...');
        final legal = {
          "convictionBloodTestRefusal":
              onboarding.legal?.convictions.convictionBloodTestRefusal,
          "convictionDrunk": onboarding.legal?.convictions.convictionDrunk,
          "convictionHitAndRun":
              onboarding.legal?.convictions.convictionHitAndRun,
          "convictionIntoxicated":
              onboarding.legal?.convictions.convictionIntoxicated,
          "convictionLicenseRevocation":
              onboarding.legal?.convictions.convictionLicenseRevocation,
          "nrOfAccidents": onboarding.legal?.nrOfAccidents,
          "answeredTruthfully": onboarding.progress > 0,
        };
        print('Legal data processed successfully');

        print('Processing personal data...');
        print('onboarding.personal is ${onboarding.personal != null ? "not null" : "null"}');
        if (onboarding.personal != null) {
          print('licenseType is ${onboarding.personal!.licenseType != null ? "not null" : "null"}');
        }
        
        final personal = {
          "box": onboarding.personal?.box,
          "city": onboarding.personal?.city,
          "dateCurrentLicense": onboarding.personal?.dateCurrentLicense,
          "dateLicenseUntil": onboarding.personal?.dateLicenseUntil,
          "dateOfBirth": onboarding.personal?.dateOfBirth,
          "firstName": onboarding.personal?.firstName,
          "houseNumber": onboarding.personal?.houseNumber,
          "lastName": onboarding.personal?.lastName,
          "licenseNumber": onboarding.personal?.licenseNumber,
          "licenseType": onboarding.personal?.licenseType?.value,
          "nationality": onboarding.personal?.nationality,
          "postalCode": onboarding.personal?.postalCode,
          "socialSecurityNumber": onboarding.personal?.socialSecurityNumber,
          "street": onboarding.personal?.street,
        };
        print('Personal data processed successfully');

        print('Processing phone data...');
        final phone = {
          "phoneNumber": onboarding.phone?.phoneNumber,
        };
        print('Phone data processed successfully');

        print('Processing subscriptions...');
        final subscriptions = (onboarding.$client?.subscriptions ??
                List<api.Subscription>.empty())
            .toDomain();
        print('Subscriptions processed successfully');

        print('Processing progress...');
        final progress = onboarding.progress;
        print('Progress: $progress');

        return OnboardingProgress(
          legal: legal,
          personal: personal,
          phone: phone,
          subscriptions: subscriptions,
          progress: progress,
        );
      } catch (e, stackTrace) {
        print('Error in OnboardingProgress.fromContract: $e');
        print('Stack trace: $stackTrace');
        rethrow;
      }
    } else {
      print('onboarding is null, returning empty OnboardingProgress');
      return OnboardingProgress(
        legal: {},
        personal: {},
        phone: {},
        subscriptions: [],
        progress: 0,
      );
    }
  }

  factory OnboardingProgress.none() {
    return OnboardingProgress(
      legal: {},
      personal: {},
      phone: {},
      subscriptions: [],
      progress: 0,
    );
  }
}

extension Progress on api.Onboarding {
  int get progress {
    switch (status) {
      case api.OnboardingStatus.completed:
        return 5;
      case api.OnboardingStatus.phone:
        return 4;
      case api.OnboardingStatus.personal:
        return 3;
      case api.OnboardingStatus.documents:
        return 2;
      case api.OnboardingStatus.conviction:
        return 1;
      default:
        return 0; // Default progress if status is unknown or not applicable
    }
  }
}
