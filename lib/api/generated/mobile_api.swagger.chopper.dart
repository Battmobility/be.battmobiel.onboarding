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
  Future<Response<ContractsOnboarding>> _userV1UsersOnboardingPut(
      {required ContractsOnboardingPersonal? body}) {
    final Uri $url = Uri.parse('/user/v1/users/onboarding');
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
  Future<Response<ContractsOnboarding>> _userV1UsersOnboardingDocumentsPost({
    List<int>? backDriverLicense,
    List<int>? backId,
    List<int>? damageStatistic,
    List<int>? frontDriverLicense,
    List<int>? frontId,
    List<int>? selfie,
  }) {
    final Uri $url = Uri.parse('/user/v1/users/onboarding/documents');
    final List<PartValue> $parts = <PartValue>[
      PartValueFile<List<int>?>(
        'backDriverLicense',
        backDriverLicense,
      ),
      PartValueFile<List<int>?>(
        'backId',
        backId,
      ),
      PartValueFile<List<int>?>(
        'damageStatistic',
        damageStatistic,
      ),
      PartValueFile<List<int>?>(
        'frontDriverLicense',
        frontDriverLicense,
      ),
      PartValueFile<List<int>?>(
        'frontId',
        frontId,
      ),
      PartValueFile<List<int>?>(
        'selfie',
        selfie,
      ),
    ];
    final Request $request = Request(
      'POST',
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
