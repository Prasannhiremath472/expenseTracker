import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/error/failures.dart';
import '../../../../routes/route_names.dart';
import '../../../../shared/widgets/empty_state.dart';
import '../../../../shared/widgets/error_view.dart';
import '../../../../shared/widgets/loading_indicator.dart';
import '../../../project/presentation/providers/project_providers.dart';
import '../providers/report_providers.dart';
import '../widgets/report_card.dart';

class ReportListScreen extends ConsumerWidget {
  const ReportListScreen({super.key});

  void _onProjectSelected(WidgetRef ref, String? projectId) {
    final current = ref.read(reportFilterProvider);
    ref.read(reportFilterProvider.notifier).state =
        current.copyWith(projectId: projectId, clearProjectId: projectId == null);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reportsAsync = ref.watch(reportListProvider);
    final filter = ref.watch(reportFilterProvider);
    final projectsAsync = ref.watch(projectListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Daily Reports')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push(RouteNames.addReport),
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
            child: projectsAsync.when(
              loading: () => const SizedBox.shrink(),
              error: (_, __) => const SizedBox.shrink(),
              data: (projects) {
                final validProjectId =
                    projects.any((p) => p.id == filter.projectId) ? filter.projectId : null;
                return DropdownButtonFormField<String>(
                  initialValue: validProjectId,
                  decoration: const InputDecoration(
                    labelText: 'Filter by project',
                    prefixIcon: Icon(Icons.construction_outlined),
                  ),
                  items: [
                    const DropdownMenuItem<String>(value: null, child: Text('All Projects')),
                    ...projects.map((p) => DropdownMenuItem(value: p.id, child: Text(p.projectName))),
                  ],
                  onChanged: (value) => _onProjectSelected(ref, value),
                );
              },
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: reportsAsync.when(
              loading: () => const LoadingIndicator(),
              error: (error, _) => ErrorView(
                failure: error as Failure,
                onRetry: () => ref.read(reportListProvider.notifier).refresh(),
              ),
              data: (reports) {
                if (reports.isEmpty) {
                  return EmptyState(
                    icon: Icons.assignment_outlined,
                    title: 'No daily reports found',
                    subtitle: 'Add a daily report to track site progress.',
                    actionLabel: 'Add Report',
                    onAction: () => context.push(RouteNames.addReport),
                  );
                }

                return RefreshIndicator(
                  onRefresh: () => ref.read(reportListProvider.notifier).refresh(),
                  child: ListView.separated(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    itemCount: reports.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final report = reports[index];
                      return ReportCard(
                        report: report,
                        onTap: () => context.push(RouteNames.editReportPath(report.id)),
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
