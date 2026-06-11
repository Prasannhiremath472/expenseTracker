import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../core/error/failures.dart';
import '../shared/widgets/error_view.dart';
import '../shared/widgets/loading_indicator.dart';
import '../features/auth/presentation/providers/auth_provider.dart';
import '../features/auth/presentation/screens/forgot_password_screen.dart';
import '../features/auth/presentation/screens/login_screen.dart';
import '../features/auth/presentation/screens/register_screen.dart';
import '../features/auth/presentation/screens/splash_screen.dart';
import '../features/dashboard/presentation/screens/dashboard_screen.dart';
import '../features/expense/presentation/providers/expense_providers.dart';
import '../features/expense/presentation/screens/add_edit_expense_screen.dart';
import '../features/expense/presentation/screens/expense_list_screen.dart';
import '../features/profile/presentation/screens/profile_screen.dart';
import '../features/project/presentation/providers/project_providers.dart';
import '../features/project/presentation/screens/add_edit_project_screen.dart';
import '../features/project/presentation/screens/project_details_screen.dart';
import '../features/project/presentation/screens/project_list_screen.dart';
import '../features/report/presentation/providers/report_providers.dart';
import '../features/report/presentation/screens/add_edit_report_screen.dart';
import '../features/report/presentation/screens/report_list_screen.dart';
import 'route_names.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final goRouterProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authNotifierProvider);

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: RouteNames.splash,
    refreshListenable: _AuthListenable(ref),
    redirect: (context, state) {
      final location = state.matchedLocation;
      final isAuthRoute = [
        RouteNames.login,
        RouteNames.register,
        RouteNames.forgotPassword,
      ].contains(location);
      final isSplash = location == RouteNames.splash;

      if (authState is AuthInitial || authState is AuthLoading) {
        return isSplash ? null : RouteNames.splash;
      }

      if (authState is AuthAuthenticated) {
        if (isSplash || isAuthRoute) return RouteNames.dashboard;
        return null;
      }

      // Unauthenticated
      if (isSplash || isAuthRoute) return isSplash ? RouteNames.login : null;
      return RouteNames.login;
    },
    routes: [
      GoRoute(path: RouteNames.splash, builder: (context, state) => const SplashScreen()),
      GoRoute(path: RouteNames.login, builder: (context, state) => const LoginScreen()),
      GoRoute(path: RouteNames.register, builder: (context, state) => const RegisterScreen()),
      GoRoute(
        path: RouteNames.forgotPassword,
        builder: (context, state) => const ForgotPasswordScreen(),
      ),
      ShellRoute(
        builder: (context, state, child) => MainShell(location: state.matchedLocation, child: child),
        routes: [
          GoRoute(path: RouteNames.dashboard, builder: (context, state) => const DashboardScreen()),
          GoRoute(path: RouteNames.projects, builder: (context, state) => const ProjectListScreen()),
          GoRoute(path: RouteNames.expenses, builder: (context, state) => const ExpenseListScreen()),
          GoRoute(path: RouteNames.reports, builder: (context, state) => const ReportListScreen()),
          GoRoute(path: RouteNames.profile, builder: (context, state) => const ProfileScreen()),
        ],
      ),
      GoRoute(
        path: RouteNames.addProject,
        builder: (context, state) => const AddEditProjectScreen(),
      ),
      GoRoute(
        path: RouteNames.projectDetails,
        builder: (context, state) => ProjectDetailsScreen(projectId: state.pathParameters['id']!),
      ),
      GoRoute(
        path: RouteNames.editProject,
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return _ProjectEditLoader(projectId: id);
        },
      ),
      GoRoute(
        path: RouteNames.addExpense,
        builder: (context, state) => const AddEditExpenseScreen(),
      ),
      GoRoute(
        path: RouteNames.editExpense,
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return _ExpenseEditLoader(expenseId: id);
        },
      ),
      GoRoute(
        path: RouteNames.addReport,
        builder: (context, state) => const AddEditReportScreen(),
      ),
      GoRoute(
        path: RouteNames.editReport,
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return _ReportEditLoader(reportId: id);
        },
      ),
    ],
  );
});

/// Bridges Riverpod's [authNotifierProvider] to GoRouter's [Listenable]-based
/// refresh mechanism so route redirects re-evaluate on auth state changes.
class _AuthListenable extends ChangeNotifier {
  _AuthListenable(this._ref) {
    _ref.listen<AuthState>(authNotifierProvider, (previous, next) {
      notifyListeners();
    });
  }

  // ignore: unused_field
  final Ref _ref;
}

class MainShell extends ConsumerWidget {
  const MainShell({super.key, required this.location, required this.child});

  final String location;
  final Widget child;

  static const _tabs = [
    RouteNames.dashboard,
    RouteNames.projects,
    RouteNames.expenses,
    RouteNames.reports,
    RouteNames.profile,
  ];

  int get _currentIndex {
    final index = _tabs.indexWhere((tab) => location.startsWith(tab));
    return index == -1 ? 0 : index;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          final route = _tabs[index];
          if (route == RouteNames.projects) {
            ref.read(projectListProvider.notifier).refresh();
          } else if (route == RouteNames.expenses) {
            ref.invalidate(expenseListProvider);
          } else if (route == RouteNames.reports) {
            ref.invalidate(reportListProvider);
          }
          context.go(route);
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.dashboard_outlined), selectedIcon: Icon(Icons.dashboard), label: 'Dashboard'),
          NavigationDestination(icon: Icon(Icons.construction_outlined), selectedIcon: Icon(Icons.construction), label: 'Projects'),
          NavigationDestination(icon: Icon(Icons.receipt_long_outlined), selectedIcon: Icon(Icons.receipt_long), label: 'Expenses'),
          NavigationDestination(icon: Icon(Icons.assignment_outlined), selectedIcon: Icon(Icons.assignment), label: 'Reports'),
          NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

/// Loads a project by id before showing the edit form.
class _ProjectEditLoader extends ConsumerWidget {
  const _ProjectEditLoader({required this.projectId});

  final String projectId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectAsync = ref.watch(projectDetailsProvider(projectId));

    return projectAsync.when(
      loading: () => const Scaffold(body: LoadingIndicator()),
      error: (error, _) => Scaffold(
        appBar: AppBar(title: const Text('Edit Project')),
        body: ErrorView(failure: error as Failure),
      ),
      data: (project) => AddEditProjectScreen(project: project),
    );
  }
}

/// Loads an expense by id before showing the edit form.
class _ExpenseEditLoader extends ConsumerWidget {
  const _ExpenseEditLoader({required this.expenseId});

  final String expenseId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expenseAsync = ref.watch(expenseDetailsProvider(expenseId));

    return expenseAsync.when(
      loading: () => const Scaffold(body: LoadingIndicator()),
      error: (error, _) => Scaffold(
        appBar: AppBar(title: const Text('Edit Expense')),
        body: ErrorView(failure: error as Failure),
      ),
      data: (expense) => AddEditExpenseScreen(expense: expense),
    );
  }
}

/// Loads a daily report by id before showing the edit form.
class _ReportEditLoader extends ConsumerWidget {
  const _ReportEditLoader({required this.reportId});

  final String reportId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reportAsync = ref.watch(reportDetailsProvider(reportId));

    return reportAsync.when(
      loading: () => const Scaffold(body: LoadingIndicator()),
      error: (error, _) => Scaffold(
        appBar: AppBar(title: const Text('Edit Daily Report')),
        body: ErrorView(failure: error as Failure),
      ),
      data: (report) => AddEditReportScreen(report: report),
    );
  }
}
