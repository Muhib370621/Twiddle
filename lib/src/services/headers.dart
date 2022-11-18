class AuthHeaders {
  static getOnlyBearerHeaders(String accessToken) {
    Map<String, String>? authorizationHeader = {
      'Authorization': 'Bearer $accessToken',
    };

    print('Bearer $accessToken');
    return authorizationHeader;
  }

  static getOnlyContentTypeHeaders() {
    Map<String, String>? authorizationHeader = {
      'Content-Type': 'application/json',
    };

    return authorizationHeader;
  }

  static getHeadersWithBearerAndContentType(String accessToken) {
    Map<String, String>? authorizationHeader = {
      'Authorization': 'Bearer $accessToken',
      'Content-Type': 'application/json',
    };
    return authorizationHeader;
  }
}