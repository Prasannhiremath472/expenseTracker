import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../shared/widgets/app_card.dart';
import '../../../../shared/widgets/empty_state.dart';
import '../../../../shared/widgets/error_view.dart';
import '../../../../shared/widgets/loading_indicator.dart';
import '../providers/dashboard_provider.dart';
import '../widgets/category_pie_chart.dart';
import '../widgets/monthly_bar_chart.dart';
import '../widgets/recent_list_tile.dart';
import '../widgets/stat_card.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardAsync = ref.watch(dashboardProvider);

    return Scaffold(
      appBar: AppBar(title: const Text(AppConstants.appName)),
      body: dashboardAsync.when(
        loading: () => const LoadingIndicator(),
        error: (error, _) => ErrorView(
          failure: error as Failure,
          onRetry: () => ref.invalidate(dashboardProvider),
        ),
        data: (dashboard) {
          return RefreshIndicator(
            onRefresh: () async => ref.invalidate(dashboardProvider),
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 1.5,
                  children: [
                    StatCard(
                      label: 'Total Projects',
                      value: '${dashboard.totalProjects}',
                      icon: Icons.construction_outlined,
                      color: AppColors.primary,
                    ),
                    StatCard(
                      label: 'Active Projects',
                      value: '${dashboard.activeProjects}',
                      icon: Icons.bolt_outlined,
                      color: AppColors.statusActive,
                    ),
                    StatCard(
                      label: 'Total Expenses',
                      value: Formatters.currency(dashboard.totalExpenses),
                      icon: Icons.account_balance_wallet_outlined,
                      color: AppColors.accent,
                    ),
                    StatCard(
                      label: "Today's Expenses",
                      value: Formatters.currency(dashboard.todaysExpenses),
                      icon: Icons.today_outlined,
                      color: AppColors.info,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                StatCard(
                  label: 'This Month\'s Expenses',
                  value: Formatters.currency(dashboard.monthlyExpenses),
                  icon: Icons.calendar_month_outlined,
                  color: AppColors.warning,
                ),
                const SizedBox(height: 16),
                CategoryPieChart(data: dashboard.expenseByCategory),
                const SizedBox(height: 16),
                MonthlyBarChart(data: dashboard.expenseByMonth),
                const SizedBox(height: 16),
                AppCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Recent Expenses', style: AppTextStyles.titleMedium),
                      const SizedBox(height: 8),
                      if (dashboard.recentExpenses.isEmpty)
                        const EmptyState(icon: Icons.receipt_long_outlined, title: 'No expenses recorded yet')
                      else
                        ...dashboard.recentExpenses.map(
                          (expense) => RecentExpenseTile(
                            projectName: expense.project.projectName,
                            category: expense.category,
                            amount: expense.amount,
                            date: expense.date,
                            vendorName: expense.vendorName,
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                AppCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Recent Site Reports', style: AppTextStyles.titleMedium),
                      const SizedBox(height: 8),
                      if (dashboard.recentReports.isEmpty)
                        const EmptyState(icon: Icons.assignment_outlined, title: 'No reports submitted yet')
                      else
                        ...dashboard.recentReports.map(
                          (report) => RecentReportTile(
                            projectName: report.project.projectName,
                            workersCount: report.workersCount,
                            date: report.date,
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          );
        },
      ),
    );
  }
}
