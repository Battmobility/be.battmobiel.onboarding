import 'package:batt_kit/batt_kit.dart';
import 'package:batt_kit/utils/logger.dart';
import 'package:chopper/chopper.dart';
import 'auth_interceptor.dart';
import 'token_service.dart';

class ApiFactory {
  String? apiUri;

  ApiFactory._internal();

  static void init({required String? apiUri}) {
    instance.apiUri = apiUri;
  }

  static final ApiFactory instance = ApiFactory._internal();
  static BattKit getMobileApi() {
    List<Interceptor> interceptors = [
      AuthInterceptor(TokenService.instance.accessToken)
    ];

    if (instance.apiUri == null) {
      logger.w("WARNING: apiUri is not set. Using default value");
    }
    return BattKit.create(
        baseUrl:
            Uri.parse(instance.apiUri ?? "https://api-staging.battmobility.be"),
        interceptors: interceptors);
  }
}
