class RouteNames {
  RouteNames._();

  // Auth
  static const String splash = '/splash';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';

  // Shell / main
  static const String dashboard = '/dashboard';
  static const String projects = '/projects';
  static const String projectDetails = '/projects/:id';
  static const String addProject = '/projects/add';
  static const String editProject = '/projects/:id/edit';

  static const String expenses = '/expenses';
  static const String addExpense = '/expenses/add';
  static const String editExpense = '/expenses/:id/edit';

  static const String reports = '/reports';
  static const String addReport = '/reports/add';
  static const String editReport = '/reports/:id/edit';

  static const String profile = '/profile';

  static String projectDetailsPath(String id) => '/projects/$id';
  static String editProjectPath(String id) => '/projects/$id/edit';
  static String editExpensePath(String id) => '/expenses/$id/edit';
  static String editReportPath(String id) => '/reports/$id/edit';
}
