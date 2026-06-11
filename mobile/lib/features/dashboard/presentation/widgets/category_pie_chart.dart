import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../shared/widgets/app_card.dart';
import '../../../../shared/widgets/empty_state.dart';
import '../../../../core/constants/app_constants.dart';
import '../../data/models/dashboard_model.dart';

class CategoryPieChart extends StatelessWidget {
  const CategoryPieChart({super.key, required this.data});

  final List<CategoryExpense> data;

  @override
  Widget build(BuildContext context) {
    final filtered = data.where((d) => d.total > 0).toList();

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Expenses by Category', style: AppTextStyles.titleMedium),
          const SizedBox(height: 16),
          if (filtered.isEmpty)
            const SizedBox(
              height: 160,
              child: EmptyState(icon: Icons.pie_chart_outline, title: 'No expense data yet'),
            )
          else ...[
            SizedBox(
              height: 180,
              child: PieChart(
                PieChartData(
                  sections: _buildSections(filtered),
                  sectionsSpace: 2,
                  centerSpaceRadius: 40,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 12,
              runSpacing: 8,
              children: filtered.asMap().entries.map((entry) {
                final index = entry.key;
                final item = entry.value;
                final color = AppColors.categoryColors[
                    AppConstants.expenseCategories.indexOf(item.category) % AppColors.categoryColors.length];
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(width: 10, height: 10, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
                    const SizedBox(width: 6),
                    Text(
                      '${Formatters.categoryLabel(item.category)} (${Formatters.currency(item.total)})',
                      style: AppTextStyles.bodySmall,
                    ),
                  ],
                );
              }).toList(),
            ),
          ],
        ],
      ),
    );
  }

  List<PieChartSectionData> _buildSections(List<CategoryExpense> filtered) {
    final total = filtered.fold<double>(0, (sum, item) => sum + item.total);

    return filtered.map((item) {
      final color = AppColors.categoryColors[
          AppConstants.expenseCategories.indexOf(item.category) % AppColors.categoryColors.length];
      final percentage = total == 0 ? 0 : (item.total / total) * 100;

      return PieChartSectionData(
        value: item.total,
        color: color,
        title: '${percentage.toStringAsFixed(0)}%',
        radius: 60,
        titleStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
      );
    }).toList();
  }
}
