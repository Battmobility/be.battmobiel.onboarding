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
  Future<Response<User>> _userV1UsersMePut(
      {required Map<String, String> body}) {
    final Uri $url = Uri.parse('/user/v1/users/me');
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
    return client.send<User, User>(
      $request,
      requestConverter: FormUrlEncodedConverter.requestFactory,
    );
  }
}
