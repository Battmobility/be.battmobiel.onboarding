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
  Future<Response<ContractsOnboarding>> _userV1UsersOnboardingDocumentsPut(
      {required Map<String, String> body}) {
    final Uri $url = Uri.parse('/user/v1/users/onboarding/documents');
    final Map<String, String> $headers = {
      'content-type': 'application/x-www-form-urlencoded',
    };
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<ContractsOnboarding, ContractsOnboarding>(
      $request,
      requestConverter: FormUrlEncodedConverter.requestFactory,
    );
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
