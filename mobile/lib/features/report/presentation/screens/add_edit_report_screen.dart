import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/utils/validators.dart';
import '../../../../shared/widgets/app_button.dart';
import '../../../../shared/widgets/app_text_field.dart';
import '../../../project/presentation/providers/project_providers.dart';
import '../../data/models/report_model.dart';
import '../providers/report_providers.dart';

class AddEditReportScreen extends ConsumerStatefulWidget {
  const AddEditReportScreen({super.key, this.report});

  /// If provided, the screen edits this report; otherwise creates a new one.
  final ReportModel? report;

  @override
  ConsumerState<AddEditReportScreen> createState() => _AddEditReportScreenState();
}

class _AddEditReportScreenState extends ConsumerState<AddEditReportScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _workersCountController;
  late final TextEditingController _workCompletedController;
  late final TextEditingController _materialsUsedController;
  late final TextEditingController _issuesFacedController;
  late final TextEditingController _notesController;
  late DateTime _date;
  String? _projectId;
  List<String> _existingPhotoUrls = [];
  final List<File> _pickedPhotos = [];

  bool get _isEditing => widget.report != null;

  @override
  void initState() {
    super.initState();
    final report = widget.report;
    _workersCountController = TextEditingController(text: report != null ? report.workersCount.toString() : '');
    _workCompletedController = TextEditingController(text: report?.workCompleted ?? '');
    _materialsUsedController = TextEditingController(text: report?.materialsUsed ?? '');
    _issuesFacedController = TextEditingController(text: report?.issuesFaced ?? '');
    _notesController = TextEditingController(text: report?.notes ?? '');
    _date = report?.date ?? DateTime.now();
    _projectId = report?.projectId;
    _existingPhotoUrls = List<String>.from(report?.sitePhotoUrls ?? []);
  }

  @override
  void dispose() {
    _workersCountController.dispose();
    _workCompletedController.dispose();
    _materialsUsedController.dispose();
    _issuesFacedController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() => _date = picked);
    }
  }

  Future<void> _pickPhotos() async {
    final picker = ImagePicker();
    final picked = await picker.pickMultiImage(imageQuality: 85);
    if (picked.isNotEmpty) {
      setState(() {
        _pickedPhotos.addAll(picked.map((x) => File(x.path)));
      });
    }
  }

  Future<void> _onSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    if (_projectId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a project'), backgroundColor: AppColors.error),
      );
      return;
    }

    final notifier = ref.read(reportFormProvider.notifier);
    final report = await notifier.submit(
      id: widget.report?.id,
      projectId: _projectId!,
      date: _date,
      workersCount: int.parse(_workersCountController.text.trim()),
      workCompleted: _workCompletedController.text.trim().isEmpty ? null : _workCompletedController.text.trim(),
      materialsUsed: _materialsUsedController.text.trim().isEmpty ? null : _materialsUsedController.text.trim(),
      issuesFaced: _issuesFacedController.text.trim().isEmpty ? null : _issuesFacedController.text.trim(),
      notes: _notesController.text.trim().isEmpty ? null : _notesController.text.trim(),
      sitePhotoPaths: _pickedPhotos.map((f) => f.path).toList(),
    );

    if (!mounted) return;

    if (report != null) {
      ref.invalidate(reportListProvider);
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final formState = ref.watch(reportFormProvider);
    final isLoading = formState.isLoading;
    final projectsAsync = ref.watch(projectListProvider);

    ref.listen<AsyncValue<void>>(reportFormProvider, (previous, next) {
      next.whenOrNull(
        error: (error, _) {
          final failure = error as Failure;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(failure.message), backgroundColor: AppColors.error),
          );
        },
      );
    });

    return Scaffold(
      appBar: AppBar(title: Text(_isEditing ? 'Edit Daily Report' : 'Add Daily Report')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                projectsAsync.when(
                  loading: () => const LinearProgressIndicator(),
                  error: (_, __) => const Text('Failed to load projects'),
                  data: (projects) {
                    final validProjectId =
                        projects.any((p) => p.id == _projectId) ? _projectId : null;
                    return DropdownButtonFormField<String>(
                      initialValue: validProjectId,
                      decoration: const InputDecoration(
                        labelText: 'Project',
                        prefixIcon: Icon(Icons.construction_outlined),
                      ),
                      items: projects
                          .map((p) => DropdownMenuItem(value: p.id, child: Text(p.projectName)))
                          .toList(),
                      onChanged: (value) => setState(() => _projectId = value),
                      validator: (value) => value == null ? 'Project is required' : null,
                    );
                  },
                ),
                const SizedBox(height: 16),
                AppTextField(
                  label: 'Date',
                  controller: TextEditingController(text: Formatters.date(_date)),
                  prefixIcon: Icons.calendar_today_outlined,
                  readOnly: true,
                  onTap: _pickDate,
                ),
                const SizedBox(height: 16),
                AppTextField(
                  label: 'Number of Workers',
                  controller: _workersCountController,
                  prefixIcon: Icons.groups_outlined,
                  keyboardType: TextInputType.number,
                  validator: (value) => Validators.nonNegativeNumber(value, fieldName: 'workers count'),
                ),
                const SizedBox(height: 16),
                AppTextField(
                  label: 'Work Completed (optional)',
                  controller: _workCompletedController,
                  prefixIcon: Icons.task_alt_outlined,
                  maxLines: 3,
                ),
                const SizedBox(height: 16),
                AppTextField(
                  label: 'Materials Used (optional)',
                  controller: _materialsUsedController,
                  prefixIcon: Icons.inventory_2_outlined,
                  maxLines: 3,
                ),
                const SizedBox(height: 16),
                AppTextField(
                  label: 'Issues Faced (optional)',
                  controller: _issuesFacedController,
                  prefixIcon: Icons.report_problem_outlined,
                  maxLines: 3,
                ),
                const SizedBox(height: 16),
                AppTextField(
                  label: 'Notes (optional)',
                  controller: _notesController,
                  prefixIcon: Icons.notes_outlined,
                  maxLines: 3,
                ),
                const SizedBox(height: 16),
                _buildPhotosPicker(),
                const SizedBox(height: 24),
                AppButton(
                  label: _isEditing ? 'Save Changes' : 'Add Report',
                  onPressed: _onSubmit,
                  isLoading: isLoading,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPhotosPicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Site Photos (optional)', style: Theme.of(context).textTheme.labelLarge),
        const SizedBox(height: 8),
        if (_existingPhotoUrls.isNotEmpty || _pickedPhotos.isNotEmpty)
          SizedBox(
            height: 90,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ..._existingPhotoUrls.map(
                  (url) => Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: _PhotoThumbnail(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(url, height: 90, width: 90, fit: BoxFit.cover),
                      ),
                      onRemove: () => setState(() => _existingPhotoUrls.remove(url)),
                    ),
                  ),
                ),
                ..._pickedPhotos.map(
                  (file) => Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: _PhotoThumbnail(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.file(file, height: 90, width: 90, fit: BoxFit.cover),
                      ),
                      onRemove: () => setState(() => _pickedPhotos.remove(file)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        const SizedBox(height: 8),
        OutlinedButton.icon(
          onPressed: _pickPhotos,
          icon: const Icon(Icons.add_a_photo_outlined),
          label: const Text('Add Site Photos'),
        ),
      ],
    );
  }
}

class _PhotoThumbnail extends StatelessWidget {
  const _PhotoThumbnail({required this.child, required this.onRemove});

  final Widget child;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Positioned(
          top: 0,
          right: 0,
          child: GestureDetector(
            onTap: onRemove,
            child: Container(
              decoration: const BoxDecoration(color: Colors.black54, shape: BoxShape.circle),
              padding: const EdgeInsets.all(2),
              child: const Icon(Icons.close, color: Colors.white, size: 16),
            ),
          ),
        ),
      ],
    );
  }
}
