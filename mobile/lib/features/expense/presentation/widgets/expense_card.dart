import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../shared/widgets/app_card.dart';
import '../../data/models/expense_model.dart';

class ExpenseCard extends StatelessWidget {
  const ExpenseCard({super.key, required this.expense, this.onTap, this.showProjectName = true});

  final ExpenseModel expense;
  final VoidCallback? onTap;
  final bool showProjectName;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.accent.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.receipt_long_outlined, color: AppColors.accent),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  showProjectName && expense.project != null
                      ? expense.project!.projectName
                      : Formatters.categoryLabel(expense.category),
                  style: AppTextStyles.bodyMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  '${Formatters.categoryLabel(expense.category)}'
                  '${expense.vendorName != null ? ' • ${expense.vendorName}' : ''}'
                  ' • ${Formatters.date(expense.date)}',
                  style: AppTextStyles.bodySmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(Formatters.currency(expense.amount), style: AppTextStyles.titleMedium),
              if (expense.billImageUrl != null) ...[
                const SizedBox(height: 2),
                const Icon(Icons.attach_file, size: 14, color: AppColors.textSecondary),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
