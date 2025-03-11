// dart format width=80
//Generated code

part of 'mobile_api.swagger.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$MobileApi extends MobileApi {
  _$MobileApi([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = MobileApi;

  @override
  Future<Response<ClientContractDtoApiDataResponse>>
      _contractV1ContractsClientsClientIdDelegatedTrustDelegatedTrustClientIdPost({
    required int? clientId,
    required int? delegatedTrustClientId,
    required CreateNewUsageContractRequest? body,
  }) {
    final Uri $url = Uri.parse(
        '/contract/v1/contracts/clients/${clientId}/delegatedTrust/${delegatedTrustClientId}');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<ClientContractDtoApiDataResponse,
        ClientContractDtoApiDataResponse>($request);
  }

  @override
  Future<Response<User>> _userV1UsersMeGet() {
    final Uri $url = Uri.parse('/user/v1/users/me');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<User, User>($request);
  }

  @override
  Future<Response<ContractsOnboarding>> _userV1UsersOnboardingGet() {
    final Uri $url = Uri.parse('/user/v1/users/onboarding');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<ContractsOnboarding, ContractsOnboarding>($request);
  }

  @override
  Future<Response<ContractsOnboarding>> _userV1UsersOnboardingDocumentsPut({
    MultipartFile? backDriverLicense,
    MultipartFile? backId,
    MultipartFile? damageStatistic,
    MultipartFile? frontDriverLicense,
    MultipartFile? frontId,
    MultipartFile? selfie,
  }) {
    final Uri $url = Uri.parse('/user/v1/users/onboarding/documents');
    final List<PartValue> $parts = <PartValue>[
      PartValueFile<MultipartFile?>(
        'backDriverLicense',
        backDriverLicense,
      ),
      PartValueFile<MultipartFile?>(
        'backId',
        backId,
      ),
      PartValueFile<MultipartFile?>(
        'damageStatistic',
        damageStatistic,
      ),
      PartValueFile<MultipartFile?>(
        'frontDriverLicense',
        frontDriverLicense,
      ),
      PartValueFile<MultipartFile?>(
        'frontId',
        frontId,
      ),
      PartValueFile<MultipartFile?>(
        'selfie',
        selfie,
      ),
    ];
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      parts: $parts,
      multipart: true,
    );
    return client.send<ContractsOnboarding, ContractsOnboarding>($request);
  }

  @override
  Future<Response<ContractsOnboarding>> _userV1UsersOnboardingLegalPut(
      {required ContractsOnboardingLegal? body}) {
    final Uri $url = Uri.parse('/user/v1/users/onboarding/legal');
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<ContractsOnboarding, ContractsOnboarding>($request);
  }

  @override
  Future<Response<ContractsOnboarding>> _userV1UsersOnboardingPersonalPut(
      {required ContractsOnboardingPersonal? body}) {
    final Uri $url = Uri.parse('/user/v1/users/onboarding/personal');
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<ContractsOnboarding, ContractsOnboarding>($request);
  }

  @override
  Future<Response<ContractsOnboarding>> _userV1UsersOnboardingPhonePut(
      {required ContractsOnboardingPhone? body}) {
    final Uri $url = Uri.parse('/user/v1/users/onboarding/phone');
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<ContractsOnboarding, ContractsOnboarding>($request);
  }
}
