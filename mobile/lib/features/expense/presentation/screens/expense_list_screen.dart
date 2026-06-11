import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../routes/route_names.dart';
import '../../../../shared/widgets/empty_state.dart';
import '../../../../shared/widgets/error_view.dart';
import '../../../../shared/widgets/loading_indicator.dart';
import '../providers/expense_providers.dart';
import '../widgets/category_filter_chip.dart';
import '../widgets/expense_card.dart';

class ExpenseListScreen extends ConsumerStatefulWidget {
  const ExpenseListScreen({super.key});

  @override
  ConsumerState<ExpenseListScreen> createState() => _ExpenseListScreenState();
}

class _ExpenseListScreenState extends ConsumerState<ExpenseListScreen> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    final current = ref.read(expenseFilterProvider);
    ref.read(expenseFilterProvider.notifier).state =
        current.copyWith(search: value, clearSearch: value.isEmpty);
  }

  void _onCategorySelected(String? category) {
    final current = ref.read(expenseFilterProvider);
    ref.read(expenseFilterProvider.notifier).state =
        current.copyWith(category: category, clearCategory: category == null);
  }

  @override
  Widget build(BuildContext context) {
    final expensesAsync = ref.watch(expenseListProvider);
    final filter = ref.watch(expenseFilterProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Expenses')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push(RouteNames.addExpense),
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Search by vendor or description',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: _onSearchChanged,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CategoryFilterChip(
                    label: 'All',
                    selected: filter.category == null,
                    onSelected: () => _onCategorySelected(null),
                  ),
                  const SizedBox(width: 8),
                  ...AppConstants.expenseCategories.map(
                    (category) => Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: CategoryFilterChip(
                        label: Formatters.categoryLabel(category),
                        selected: filter.category == category,
                        onSelected: () => _onCategorySelected(category),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: expensesAsync.when(
              loading: () => const LoadingIndicator(),
              error: (error, _) => ErrorView(
                failure: error as Failure,
                onRetry: () => ref.read(expenseListProvider.notifier).refresh(),
              ),
              data: (expenses) {
                if (expenses.isEmpty) {
                  return EmptyState(
                    icon: Icons.receipt_long_outlined,
                    title: 'No expenses found',
                    subtitle: 'Add an expense to start tracking site costs.',
                    actionLabel: 'Add Expense',
                    onAction: () => context.push(RouteNames.addExpense),
                  );
                }

                return RefreshIndicator(
                  onRefresh: () => ref.read(expenseListProvider.notifier).refresh(),
                  child: ListView.separated(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    itemCount: expenses.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final expense = expenses[index];
                      return ExpenseCard(
                        expense: expense,
                        onTap: () => context.push(RouteNames.editExpensePath(expense.id)),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
