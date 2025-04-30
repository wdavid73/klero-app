/// Defines the API endpoints for the application.
///
/// Provides static strings for each endpoint.
class ApiEndpoint {
  /// The endpoint for authentication.
  static String auth = '/auth';
  static String authLogin = '$auth/login';
  static String authCheckStatus = '$auth/check-status';

  /// The endpoint for products. (Example)
  static String products = '/products';
}