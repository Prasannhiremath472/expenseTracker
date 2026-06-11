/// API base URL configuration.
///
/// Override at build time with:
/// `flutter run --dart-define=API_BASE_URL=https://your-api.vercel.app/api`
class ApiConstants {
  ApiConstants._();

  static const String baseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'http://10.0.2.2:5000/api',
  );

  static const Duration connectTimeout = Duration(seconds: 15);
  static const Duration receiveTimeout = Duration(seconds: 30);

  // Auth
  static const String register = '/auth/register';
  static const String login = '/auth/login';
  static const String forgotPassword = '/auth/forgot-password';
  static const String resetPassword = '/auth/reset-password';
  static const String me = '/auth/me';

  // Projects
  static const String projects = '/projects';

  // Expenses
  static const String expenses = '/expenses';

  // Reports
  static const String reports = '/reports';

  // Dashboard
  static const String dashboard = '/dashboard';
}
