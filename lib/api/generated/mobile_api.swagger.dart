// ignore_for_file: type=lint

import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';
import 'dart:convert';

import 'mobile_api.models.swagger.dart';
import 'package:chopper/chopper.dart';

import 'client_mapping.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:http/http.dart' show MultipartFile;
import 'package:chopper/chopper.dart' as chopper;
import 'mobile_api.enums.swagger.dart' as enums;
export 'mobile_api.enums.swagger.dart';
export 'mobile_api.models.swagger.dart';

part 'mobile_api.swagger.chopper.dart';

// **************************************************************************
// SwaggerChopperGenerator
// **************************************************************************

@ChopperApi()
abstract class MobileApi extends ChopperService {
  static MobileApi create({
    ChopperClient? client,
    http.Client? httpClient,
    Authenticator? authenticator,
    ErrorConverter? errorConverter,
    Converter? converter,
    Uri? baseUrl,
    List<Interceptor>? interceptors,
  }) {
    if (client != null) {
      return _$MobileApi(client);
    }

    final newClient = ChopperClient(
        services: [_$MobileApi()],
        converter: converter ?? $JsonSerializableConverter(),
        interceptors: interceptors ?? [],
        client: httpClient,
        authenticator: authenticator,
        errorConverter: errorConverter,
        baseUrl: baseUrl ?? Uri.parse('http://'));
    return _$MobileApi(newClient);
  }

  ///Get information about your own user
  Future<chopper.Response<User>> userV1UsersMeGet() {
    generatedMapping.putIfAbsent(User, () => User.fromJsonFactory);

    return _userV1UsersMeGet();
  }

  ///Get information about your own user
  @Get(path: '/user/v1/users/me')
  Future<chopper.Response<User>> _userV1UsersMeGet();

  ///Get the onboarding status of your own user
  Future<chopper.Response<ContractsOnboarding>> userV1UsersOnboardingGet() {
    generatedMapping.putIfAbsent(
        ContractsOnboarding, () => ContractsOnboarding.fromJsonFactory);

    return _userV1UsersOnboardingGet();
  }

  ///Get the onboarding status of your own user
  @Get(path: '/user/v1/users/onboarding')
  Future<chopper.Response<ContractsOnboarding>> _userV1UsersOnboardingGet();

  ///Upload your own documents
  Future<chopper.Response<ContractsOnboarding>>
      userV1UsersOnboardingDocumentsPut({
    MultipartFile? backDriverLicense,
    MultipartFile? backId,
    MultipartFile? damageStatistic,
    MultipartFile? frontDriverLicense,
    MultipartFile? frontId,
    MultipartFile? selfie,
  }) {
    generatedMapping.putIfAbsent(
        ContractsOnboarding, () => ContractsOnboarding.fromJsonFactory);

    return _userV1UsersOnboardingDocumentsPut(
        backDriverLicense: backDriverLicense,
        backId: backId,
        damageStatistic: damageStatistic,
        frontDriverLicense: frontDriverLicense,
        frontId: frontId,
        selfie: selfie);
  }

  ///Upload your own documents
  @Put(
    path: '/user/v1/users/onboarding/documents',
    optionalBody: true,
  )
  @Multipart()
  Future<chopper.Response<ContractsOnboarding>>
      _userV1UsersOnboardingDocumentsPut({
    @PartFile() MultipartFile? backDriverLicense,
    @PartFile() MultipartFile? backId,
    @PartFile() MultipartFile? damageStatistic,
    @PartFile() MultipartFile? frontDriverLicense,
    @PartFile() MultipartFile? frontId,
    @PartFile() MultipartFile? selfie,
  });

  ///Upload your legal information
  Future<chopper.Response<ContractsOnboarding>> userV1UsersOnboardingLegalPut(
      {required ContractsOnboardingLegal? body}) {
    generatedMapping.putIfAbsent(
        ContractsOnboarding, () => ContractsOnboarding.fromJsonFactory);

    return _userV1UsersOnboardingLegalPut(body: body);
  }

  ///Upload your legal information
  @Put(
    path: '/user/v1/users/onboarding/legal',
    optionalBody: true,
  )
  Future<chopper.Response<ContractsOnboarding>> _userV1UsersOnboardingLegalPut(
      {@Body() required ContractsOnboardingLegal? body});

  ///Update your information
  Future<chopper.Response<ContractsOnboarding>>
      userV1UsersOnboardingPersonalPut(
          {required ContractsOnboardingPersonal? body}) {
    generatedMapping.putIfAbsent(
        ContractsOnboarding, () => ContractsOnboarding.fromJsonFactory);

    return _userV1UsersOnboardingPersonalPut(body: body);
  }

  ///Update your information
  @Put(
    path: '/user/v1/users/onboarding/personal',
    optionalBody: true,
  )
  Future<chopper.Response<ContractsOnboarding>>
      _userV1UsersOnboardingPersonalPut(
          {@Body() required ContractsOnboardingPersonal? body});

  ///Register or verify your phone number
  Future<chopper.Response<ContractsOnboarding>> userV1UsersOnboardingPhonePut(
      {required ContractsOnboardingPhone? body}) {
    generatedMapping.putIfAbsent(
        ContractsOnboarding, () => ContractsOnboarding.fromJsonFactory);

    return _userV1UsersOnboardingPhonePut(body: body);
  }

  ///Register or verify your phone number
  @Put(
    path: '/user/v1/users/onboarding/phone',
    optionalBody: true,
  )
  Future<chopper.Response<ContractsOnboarding>> _userV1UsersOnboardingPhonePut(
      {@Body() required ContractsOnboardingPhone? body});
}

typedef $JsonFactory<T> = T Function(Map<String, dynamic> json);

class $CustomJsonDecoder {
  $CustomJsonDecoder(this.factories);

  final Map<Type, $JsonFactory> factories;

  dynamic decode<T>(dynamic entity) {
    if (entity is Iterable) {
      return _decodeList<T>(entity);
    }

    if (entity is T) {
      return entity;
    }

    if (isTypeOf<T, Map>()) {
      return entity;
    }

    if (isTypeOf<T, Iterable>()) {
      return entity;
    }

    if (entity is Map<String, dynamic>) {
      return _decodeMap<T>(entity);
    }

    return entity;
  }

  T _decodeMap<T>(Map<String, dynamic> values) {
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! $JsonFactory<T>) {
      return throw "Could not find factory for type $T. Is '$T: $T.fromJsonFactory' included in the CustomJsonDecoder instance creation in bootstrapper.dart?";
    }

    return jsonFactory(values);
  }

  List<T> _decodeList<T>(Iterable values) =>
      values.where((v) => v != null).map<T>((v) => decode<T>(v) as T).toList();
}

class $JsonSerializableConverter extends chopper.JsonConverter {
  @override
  FutureOr<chopper.Response<ResultType>> convertResponse<ResultType, Item>(
      chopper.Response response) async {
    if (response.bodyString.isEmpty) {
      // In rare cases, when let's say 204 (no content) is returned -
      // we cannot decode the missing json with the result type specified
      return chopper.Response(response.base, null, error: response.error);
    }

    if (ResultType == String) {
      return response.copyWith();
    }

    if (ResultType == DateTime) {
      return response.copyWith(
          body: DateTime.parse((response.body as String).replaceAll('"', ''))
              as ResultType);
    }

    final jsonRes = await super.convertResponse(response);
    return jsonRes.copyWith<ResultType>(
        body: $jsonDecoder.decode<Item>(jsonRes.body) as ResultType);
  }
}

final $jsonDecoder = $CustomJsonDecoder(generatedMapping);
