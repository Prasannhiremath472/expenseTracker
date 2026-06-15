import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:printing/printing.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../shared/widgets/app_button.dart';
import '../../../../shared/widgets/app_card.dart';
import '../../../expense/presentation/providers/expense_providers.dart';
import '../../../project/presentation/providers/project_providers.dart';
import '../../utils/daily_report_pdf.dart';
import '../../utils/expense_report_pdf.dart';
import '../providers/report_providers.dart';

class ReportListScreen extends ConsumerStatefulWidget {
  const ReportListScreen({super.key});

  @override
  ConsumerState<ReportListScreen> createState() => _ReportListScreenState();
}

class _ReportListScreenState extends ConsumerState<ReportListScreen> {
  String? _projectId;
  DateTime? _startDate;
  DateTime? _endDate;

  bool _generatingExpense = false;
  bool _generatingDaily = false;

  Future<void> _pickDateRange() async {
    final now = DateTime.now();
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      initialDateRange: _startDate != null && _endDate != null
          ? DateTimeRange(start: _startDate!, end: _endDate!)
          : DateTimeRange(start: DateTime(now.year, now.month, 1), end: now),
    );
    if (picked != null) {
      setState(() {
        _startDate = picked.start;
        _endDate = picked.end;
      });
    }
  }

  void _clearDateRange() {
    setState(() {
      _startDate = null;
      _endDate = null;
    });
  }

  Future<void> _generateExpenseReport() async {
    if (_projectId == null) {
      _showMessage('Please select a project first');
      return;
    }

    setState(() => _generatingExpense = true);
    try {
      final project = await ref.read(projectDetailsProvider(_projectId!).future);
      final expenses = await ref.read(expensesForExportProvider(
        (projectId: _projectId!, startDate: _startDate, endDate: _endDate),
      ).future);

      final doc = await ExpenseReportPdf.build(
        project: project,
        expenses: expenses,
        startDate: _startDate,
        endDate: _endDate,
      );

      await Printing.sharePdf(
        bytes: await doc.save(),
        filename: 'expense-report-${project.projectName}.pdf',
      );
    } catch (e) {
      if (mounted) _showMessage('Failed to generate report: $e');
    } finally {
      if (mounted) setState(() => _generatingExpense = false);
    }
  }

  Future<void> _generateDailyReport() async {
    if (_projectId == null) {
      _showMessage('Please select a project first');
      return;
    }

    setState(() => _generatingDaily = true);
    try {
      final project = await ref.read(projectDetailsProvider(_projectId!).future);
      final reports = await ref.read(reportsForExportProvider(
        (projectId: _projectId!, startDate: _startDate, endDate: _endDate),
      ).future);

      final doc = await DailyReportPdf.build(
        project: project,
        reports: reports,
        startDate: _startDate,
        endDate: _endDate,
      );

      await Printing.sharePdf(
        bytes: await doc.save(),
        filename: 'daily-site-report-${project.projectName}.pdf',
      );
    } catch (e) {
      if (mounted) _showMessage('Failed to generate report: $e');
    } finally {
      if (mounted) setState(() => _generatingDaily = false);
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reports')),
      body: ref.watch(projectListProvider).when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, _) => Center(child: Text('Failed to load projects: $error')),
            data: (projects) {
              return ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  Text('Filters', style: AppTextStyles.titleMedium),
                  const SizedBox(height: 8),
                  AppCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DropdownButtonFormField<String>(
                          initialValue: projects.any((p) => p.id == _projectId) ? _projectId : null,
                          decoration: const InputDecoration(
                            labelText: 'Project',
                            prefixIcon: Icon(Icons.construction_outlined),
                          ),
                          items: projects
                              .map((p) => DropdownMenuItem(value: p.id, child: Text(p.projectName)))
                              .toList(),
                          onChanged: (value) => setState(() => _projectId = value),
                        ),
                        const SizedBox(height: 12),
                        InkWell(
                          onTap: _pickDateRange,
                          child: InputDecorator(
                            decoration: InputDecoration(
                              labelText: 'Date Range (optional)',
                              prefixIcon: const Icon(Icons.date_range_outlined),
                              suffixIcon: _startDate != null
                                  ? IconButton(
                                      icon: const Icon(Icons.clear, size: 18),
                                      onPressed: _clearDateRange,
                                    )
                                  : null,
                            ),
                            child: Text(
                              _startDate != null && _endDate != null
                                  ? '${Formatters.date(_startDate!)} - ${Formatters.date(_endDate!)}'
                                  : 'All time',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text('Generate Reports', style: AppTextStyles.titleMedium),
                  const SizedBox(height: 8),
                  AppCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
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
                                  Text('Expense Report', style: AppTextStyles.bodyMedium),
                                  Text(
                                    'Itemized expenses with category totals',
                                    style: AppTextStyles.bodySmall,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        AppButton(
                          label: 'Generate & Download PDF',
                          icon: Icons.picture_as_pdf_outlined,
                          isLoading: _generatingExpense,
                          onPressed: _generateExpenseReport,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  AppCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
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
                                  Text('Daily Site Report', style: AppTextStyles.bodyMedium),
                                  Text(
                                    'Site progress, workers, materials & issues',
                                    style: AppTextStyles.bodySmall,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        AppButton(
                          label: 'Generate & Download PDF',
                          icon: Icons.picture_as_pdf_outlined,
                          isLoading: _generatingDaily,
                          onPressed: _generateDailyReport,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
    );
  }
}
