import 'package:batt_kit/api/generated/batt_kit.swagger.dart';
import 'package:batt_onboarding/src/data/api_factory.dart';
import 'package:batt_onboarding/src/util/file_too_large_exception.dart';
import 'package:http/http.dart' hide Client;
import 'package:image_picker/image_picker.dart';

final class OnboardingService {
  BattKit get api => ApiFactory.getMobileApi();

  Future<Onboarding?> getOnboardingProgress() async {
    try {
      print('OnboardingService: Calling api.userV1UsersOnboardingGet()...');
      final response = await api.userV1UsersOnboardingGet();
      print('OnboardingService: Response status code: ${response.statusCode}');
      print('OnboardingService: Response isSuccessful: ${response.isSuccessful}');
      
      // Try to get the raw response body as string to see what the API is actually returning
      try {
        print('OnboardingService: Attempting to get raw response...');
        // The response object might have a way to access raw data
        print('OnboardingService: Response object type: ${response.runtimeType}');
        print('OnboardingService: Response toString: ${response.toString()}');
      } catch (rawError) {
        print('OnboardingService: Could not get raw response: $rawError');
      }
      
      print('OnboardingService: Response body is ${response.body != null ? "not null" : "null"}');
      if (response.body != null) {
        print('OnboardingService: Response body type: ${response.body.runtimeType}');
      }
      return response.body;
    } catch (e, stackTrace) {
      print('OnboardingService: Error in getOnboardingProgress: $e');
      print('OnboardingService: Stack trace: $stackTrace');
      
      // The error is happening during JSON parsing, so the API call itself is successful
      // but the response contains null values where strings are expected
      print('OnboardingService: This appears to be a JSON parsing error');
      print('OnboardingService: The API is likely returning null values for required string fields');
      rethrow;
    }
  }

  Future<bool> postConvictions(OnboardingLegal convictions) async {
    final response = await api.userV1UsersOnboardingLegalPut(body: convictions);
    return response.isSuccessful;
  }

  Future<bool> postIdFiles(Map<String, XFile> documents) async {
    try {
      List<int> backId = await documents["backId"]!.readAsBytes();
      List<int> frontId = await documents["frontId"]!.readAsBytes();
      List<int> backDriverLicense =
          await documents["backDriverLicense"]!.readAsBytes();
      List<int> frontDriverLicense =
          await documents["frontDriverLicense"]!.readAsBytes();
      final response = await api.userV1UsersOnboardingDocumentsPut(
        backId:
            MultipartFile.fromBytes("backId", backId, filename: 'backId.jpg'),
        frontId: MultipartFile.fromBytes("frontId", frontId,
            filename: 'frontId.jpg'),
        backDriverLicense: MultipartFile.fromBytes(
            "backDriverLicense", backDriverLicense,
            filename: 'backDriverLicense.jpg'),
        frontDriverLicense: MultipartFile.fromBytes(
            "frontDriverLicense", frontDriverLicense,
            filename: 'frontDriverLicense.jpg'),
      );

      if (response.statusCode == 413) {
        throw const FileTooLargeException("Files are too large");
      }

      return response.isSuccessful;
    } catch (e, _) {
      if (e is FileTooLargeException) {
        rethrow;
      }
      return false;
    }
  }

  Future<bool> postPersonalData(OnboardingPersonal personalData) async {
    try {
      final response =
          await api.userV1UsersOnboardingPersonalPut(body: personalData);
      return response.isSuccessful;
    } catch (e, _) {
      return false;
    }
  }

  Future<bool> postPhoneNumber(String phone) async {
    try {
      final response = await api.userV1UsersOnboardingPhonePut(
          body: OnboardingPhone(phoneNumber: phone));
      return response.isSuccessful;
    } catch (e, _) {
      return false;
    }
  }

  Future<bool> postVerificationCode(String phone, String code) async {
    try {
      final response = await api.userV1UsersOnboardingPhonePut(
          body: OnboardingPhone(
              phoneNumber: phone, phoneNumberValidationCode: code));
      return response.isSuccessful;
    } catch (e, _) {
      return false;
    }
  }

  Future<Client?> postNewClientData(CreateClient client) async {
    try {
      final response = await api.userV1ClientsPost(body: client);
      return response.body;
    } catch (e, _) {
      return null;
    }
  }

  Future<bool> postNewContractData(int clientId, int? delegatedTrustClientId,
      CreateNewUsageContractRequest contractData) async {
    try {
      final response = await api
          .contractV1ContractsClientsClientIdDelegatedTrustDelegatedTrustClientIdPost(
              clientId: clientId,
              delegatedTrustClientId: delegatedTrustClientId,
              body: contractData);
      return response.isSuccessful;
    } catch (e, _) {
      return false;
    }
  }
}
