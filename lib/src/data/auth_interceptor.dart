import 'dart:async';
import 'package:chopper/chopper.dart';

class AuthInterceptor implements Interceptor {
  final String accessToken;
  AuthInterceptor(this.accessToken);

  @override
  FutureOr<Response<BodyType>> intercept<BodyType>(
      Chain<BodyType> chain) async {
    final Map<String, String> headers = {
      'Authorization': 'Bearer $accessToken'
    };

    final request = applyHeaders(chain.request, headers);
    return chain.proceed(request);
  }
}
