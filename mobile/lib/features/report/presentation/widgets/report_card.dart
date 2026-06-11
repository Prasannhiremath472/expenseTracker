import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../shared/widgets/app_card.dart';
import '../../data/models/report_model.dart';

class ReportCard extends StatelessWidget {
  const ReportCard({super.key, required this.report, this.onTap, this.showProjectName = true});

  final ReportModel report;
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
              color: AppColors.primary.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.assignment_outlined, color: AppColors.primary),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  showProjectName && report.project != null
                      ? report.project!.projectName
                      : Formatters.date(report.date),
                  style: AppTextStyles.bodyMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  '${Formatters.date(report.date)} • ${report.workersCount} workers',
                  style: AppTextStyles.bodySmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                if (report.workCompleted != null && report.workCompleted!.isNotEmpty) ...[
                  const SizedBox(height: 2),
                  Text(
                    report.workCompleted!,
                    style: AppTextStyles.bodySmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ],
            ),
          ),
          if (report.sitePhotoUrls.isNotEmpty) ...[
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Icon(Icons.photo_library_outlined, size: 18, color: AppColors.textSecondary),
                const SizedBox(height: 2),
                Text('${report.sitePhotoUrls.length}', style: AppTextStyles.bodySmall),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
