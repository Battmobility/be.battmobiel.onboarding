class TokenService {
  late String accessToken;

  static final TokenService instance = TokenService._internal();

  TokenService._internal();

  factory TokenService(String accessToken) {
    instance.accessToken = accessToken;
    return instance;
  }
}
