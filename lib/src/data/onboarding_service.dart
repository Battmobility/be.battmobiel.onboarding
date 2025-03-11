import 'package:batt_onboarding/api/generated/mobile_api.swagger.dart';
import 'package:batt_onboarding/src/data/api_factory.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';

final class OnboardingService {
  MobileApi get api => ApiFactory.getMobileApi();

  Future<ContractsOnboarding?> getOnboardingProgress() async {
    final response = await api.userV1UsersOnboardingGet();
    return response.body;
  }

  Future<bool> postConvictions(ContractsOnboardingLegal convictions) async {
    final response = await api.userV1UsersOnboardingLegalPut(body: convictions);
    return response.isSuccessful;
  }

  Future<bool> postDocsHttp(Map<String, XFile> documents) async {
    try {
      List<int> backDriverLicense =
          await documents["backDriverLicense"]!.readAsBytes();
      List<int> frontDriverLicense =
          await documents["frontDriverLicense"]!.readAsBytes();
      List<int> backId = await documents["backId"]!.readAsBytes();
      List<int> frontId = await documents["frontId"]!.readAsBytes();

      final response = await api.userV1UsersOnboardingDocumentsPut(
          backDriverLicense: MultipartFile.fromBytes(
              "backDriverLicense", backDriverLicense,
              filename: 'backDriverLicense.jpg'),
          frontDriverLicense: MultipartFile.fromBytes(
              "frontDriverLicense", frontDriverLicense,
              filename: 'frontDriverLicense.jpg'),
          backId:
              MultipartFile.fromBytes("backId", backId, filename: 'backId.jpg'),
          frontId: MultipartFile.fromBytes("frontId", frontId,
              filename: 'frontId.jpg'));

      return response.isSuccessful;
    } catch (e, _) {
      return false;
    }
  }

  Future<bool> postPersonalData(
      ContractsOnboardingPersonal personalData) async {
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
          body: ContractsOnboardingPhone(phoneNumber: phone));
      return response.isSuccessful;
    } catch (e, _) {
      return false;
    }
  }

  Future<bool> postVerificationCode(String phone, String code) async {
    try {
      final response = await api.userV1UsersOnboardingPhonePut(
          body: ContractsOnboardingPhone(
              phoneNumber: phone, phoneNumberValidationCode: code));
      return response.isSuccessful;
    } catch (e, _) {
      return false;
    }
  }

  Future<int?> postNewClientData(ContractsCreateClient client) async {
    try {
      final response = await api.userV1ClientsPost(body: client);
      return response.body?.id;
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
