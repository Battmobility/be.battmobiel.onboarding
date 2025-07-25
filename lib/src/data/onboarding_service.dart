import 'package:batt_kit/api/generated/batt_kit.swagger.dart';
import 'package:batt_onboarding/src/data/api_factory.dart';
import 'package:http/http.dart' hide Client;
import 'package:image_picker/image_picker.dart';

final class OnboardingService {
  BattKit get api => ApiFactory.getMobileApi();

  Future<Onboarding?> getOnboardingProgress() async {
    final response = await api.userV1UsersOnboardingGet();
    return response.body;
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

      return response.isSuccessful;
    } catch (e, _) {
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
