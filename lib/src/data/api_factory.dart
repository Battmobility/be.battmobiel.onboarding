import 'package:batt_onboarding/api/generated/mobile_api.swagger.dart';
import 'package:batt_onboarding/src/data/token_service.dart';
import 'package:batt_onboarding/src/data/auth_interceptor.dart';

class ApiFactory {
  static MobileApi getMobileApi() {
    return MobileApi.create(
        baseUrl: Uri.parse('https://api-staging.battmobility.be'),
        interceptors: [AuthInterceptor(TokenService.instance.accessToken)]);
  }
}
