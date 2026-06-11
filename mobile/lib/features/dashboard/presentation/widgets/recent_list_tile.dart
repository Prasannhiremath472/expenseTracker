import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/formatters.dart';

class RecentExpenseTile extends StatelessWidget {
  const RecentExpenseTile({
    super.key,
    required this.projectName,
    required this.category,
    required this.amount,
    required this.date,
    this.vendorName,
  });

  final String projectName;
  final String category;
  final double amount;
  final DateTime date;
  final String? vendorName;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.accent.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Icon(Icons.receipt_long_outlined, color: AppColors.accent),
      ),
      title: Text(projectName, style: AppTextStyles.bodyMedium, maxLines: 1, overflow: TextOverflow.ellipsis),
      subtitle: Text(
        '${Formatters.categoryLabel(category)}${vendorName != null ? ' • $vendorName' : ''} • ${Formatters.date(date)}',
        style: AppTextStyles.bodySmall,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Text(Formatters.currency(amount), style: AppTextStyles.titleMedium),
    );
  }
}

class RecentReportTile extends StatelessWidget {
  const RecentReportTile({
    super.key,
    required this.projectName,
    required this.workersCount,
    required this.date,
  });

  final String projectName;
  final int workersCount;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.info.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Icon(Icons.assignment_outlined, color: AppColors.info),
      ),
      title: Text(projectName, style: AppTextStyles.bodyMedium, maxLines: 1, overflow: TextOverflow.ellipsis),
      subtitle: Text(Formatters.date(date), style: AppTextStyles.bodySmall),
      trailing: Text('$workersCount workers', style: AppTextStyles.bodySmall),
    );
  }
}
