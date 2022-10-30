class Credentials {
  String? _tokenType;
  int? _expiresIn;
  String? _accessToken;
  String? _refreshToken;

  Credentials.fromJson(Map<String, dynamic> parseJson) {
    _tokenType = parseJson['token_type'];
    _expiresIn = parseJson['expires_in'];
    _accessToken = parseJson['access_token'];
    _refreshToken = parseJson['refresh_token'];
  }

  Map<String, dynamic> toJson() => {
        'token_type': _tokenType,
        'expires_in': _expiresIn,
        'access_token': _accessToken,
        'refresh_token': _refreshToken,
      };

  String? get tokenType => _tokenType;
  int? get expiresIn => _expiresIn;
  String? get accessToken => _accessToken;
  String? get refreshToken => _refreshToken;

  @override
  String toString() {
    return '{type: $tokenType expiresIn: $expiresIn token: $accessToken refreshToken: $refreshToken}';
  }
}
