import 'package:batt_kit/batt_kit.dart';
import 'package:chopper/chopper.dart';
import 'auth_interceptor.dart';
import 'token_service.dart';

class ApiFactory {
  static BattKit getMobileApi() {
    List<Interceptor> interceptors = [
      AuthInterceptor(TokenService.instance.accessToken)
    ];
    return BattKit.create(
        baseUrl: Uri.parse("https://api-staging.battmobility.be"),
        interceptors: interceptors); // TODO: configurable
  }
}
