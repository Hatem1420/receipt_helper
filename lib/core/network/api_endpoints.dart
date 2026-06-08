// api_endpoints.dart
class ApiEndpoints {
  ApiEndpoints._();

  static const String baseUrl = 'https://api.openai.com';
  static const String responses = '/v1/responses';

  // Auth
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String logout = '/auth/logout';
  static const String refreshToken = '/auth/refresh';

  // User
  static const String profile = '/user/profile';

  // Common
  static String userById(String id) => '/users/$id';
}

