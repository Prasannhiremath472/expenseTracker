import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../routes/route_names.dart';
import '../../../../shared/widgets/empty_state.dart';
import '../../../../shared/widgets/error_view.dart';
import '../../../../shared/widgets/loading_indicator.dart';
import '../providers/project_providers.dart';
import '../widgets/project_card.dart';

class ProjectListScreen extends ConsumerStatefulWidget {
  const ProjectListScreen({super.key});

  @override
  ConsumerState<ProjectListScreen> createState() => _ProjectListScreenState();
}

class _ProjectListScreenState extends ConsumerState<ProjectListScreen> {
  String? _selectedStatus;

  @override
  Widget build(BuildContext context) {
    final projectsAsync = ref.watch(projectListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Projects')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push(RouteNames.addProject),
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _StatusFilterChip(
                    label: 'All',
                    selected: _selectedStatus == null,
                    onSelected: () => _onStatusSelected(null),
                  ),
                  const SizedBox(width: 8),
                  ...AppConstants.projectStatuses.map(
                    (status) => Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: _StatusFilterChip(
                        label: Formatters.statusLabel(status),
                        selected: _selectedStatus == status,
                        onSelected: () => _onStatusSelected(status),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: projectsAsync.when(
              loading: () => const LoadingIndicator(),
              error: (error, _) => ErrorView(
                failure: error as dynamic,
                onRetry: () => ref.read(projectListProvider.notifier).refresh(),
              ),
              data: (projects) {
                if (projects.isEmpty) {
                  return EmptyState(
                    icon: Icons.construction_outlined,
                    title: 'No projects yet',
                    subtitle: 'Create your first project to start tracking expenses and reports.',
                    actionLabel: 'Add Project',
                    onAction: () => context.push(RouteNames.addProject),
                  );
                }

                return RefreshIndicator(
                  onRefresh: () => ref.read(projectListProvider.notifier).refresh(),
                  child: ListView.separated(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    itemCount: projects.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final project = projects[index];
                      return ProjectCard(
                        project: project,
                        onTap: () => context.push(RouteNames.projectDetailsPath(project.id)),
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

  void _onStatusSelected(String? status) {
    setState(() => _selectedStatus = status);
    ref.read(projectListProvider.notifier).loadProjects(status: status);
  }
}

class _StatusFilterChip extends StatelessWidget {
  const _StatusFilterChip({required this.label, required this.selected, required this.onSelected});

  final String label;
  final bool selected;
  final VoidCallback onSelected;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(label),
      selected: selected,
      onSelected: (_) => onSelected(),
    );
  }
}
