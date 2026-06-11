import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../shared/widgets/app_button.dart';
import '../../../../shared/widgets/app_text_field.dart';
import '../../data/models/project_model.dart';
import '../providers/project_providers.dart';

class AddEditProjectScreen extends ConsumerStatefulWidget {
  const AddEditProjectScreen({super.key, this.project});

  /// If provided, the screen edits this project; otherwise creates a new one.
  final ProjectModel? project;

  @override
  ConsumerState<AddEditProjectScreen> createState() => _AddEditProjectScreenState();
}

class _AddEditProjectScreenState extends ConsumerState<AddEditProjectScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _projectNameController;
  late final TextEditingController _clientNameController;
  late final TextEditingController _siteAddressController;
  late final TextEditingController _budgetController;
  late final TextEditingController _descriptionController;
  late DateTime _startDate;
  late String _status;

  bool get _isEditing => widget.project != null;

  @override
  void initState() {
    super.initState();
    final project = widget.project;
    _projectNameController = TextEditingController(text: project?.projectName ?? '');
    _clientNameController = TextEditingController(text: project?.clientName ?? '');
    _siteAddressController = TextEditingController(text: project?.siteAddress ?? '');
    _budgetController = TextEditingController(text: project != null ? project.estimatedBudget.toString() : '');
    _descriptionController = TextEditingController(text: project?.description ?? '');
    _startDate = project?.startDate ?? DateTime.now();
    _status = project?.status ?? 'ACTIVE';
  }

  @override
  void dispose() {
    _projectNameController.dispose();
    _clientNameController.dispose();
    _siteAddressController.dispose();
    _budgetController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _pickStartDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _startDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() => _startDate = picked);
    }
  }

  Future<void> _onSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    final notifier = ref.read(projectFormProvider.notifier);
    final project = await notifier.submit(
      id: widget.project?.id,
      projectName: _projectNameController.text.trim(),
      clientName: _clientNameController.text.trim(),
      siteAddress: _siteAddressController.text.trim(),
      startDate: _startDate,
      estimatedBudget: double.parse(_budgetController.text.trim()),
      description: _descriptionController.text.trim().isEmpty ? null : _descriptionController.text.trim(),
      status: _status,
    );

    if (!mounted) return;

    if (project != null) {
      ref.read(projectListProvider.notifier).refresh();
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final formState = ref.watch(projectFormProvider);
    final isLoading = formState.isLoading;

    ref.listen<AsyncValue<void>>(projectFormProvider, (previous, next) {
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
      appBar: AppBar(title: Text(_isEditing ? 'Edit Project' : 'Add Project')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTextField(
                  label: 'Project Name',
                  controller: _projectNameController,
                  prefixIcon: Icons.construction_outlined,
                  validator: (value) => Validators.required(value, fieldName: 'Project name'),
                ),
                const SizedBox(height: 16),
                AppTextField(
                  label: 'Client Name',
                  controller: _clientNameController,
                  prefixIcon: Icons.business_outlined,
                  validator: (value) => Validators.required(value, fieldName: 'Client name'),
                ),
                const SizedBox(height: 16),
                AppTextField(
                  label: 'Site Address',
                  controller: _siteAddressController,
                  prefixIcon: Icons.location_on_outlined,
                  maxLines: 2,
                  validator: (value) => Validators.required(value, fieldName: 'Site address'),
                ),
                const SizedBox(height: 16),
                AppTextField(
                  label: 'Start Date',
                  controller: TextEditingController(text: Formatters.date(_startDate)),
                  prefixIcon: Icons.calendar_today_outlined,
                  readOnly: true,
                  onTap: _pickStartDate,
                ),
                const SizedBox(height: 16),
                AppTextField(
                  label: 'Estimated Budget (₹)',
                  controller: _budgetController,
                  prefixIcon: Icons.account_balance_wallet_outlined,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  validator: (value) => Validators.nonNegativeNumber(value, fieldName: 'budget'),
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  initialValue: _status,
                  decoration: const InputDecoration(
                    labelText: 'Status',
                    prefixIcon: Icon(Icons.flag_outlined),
                  ),
                  items: AppConstants.projectStatuses
                      .map((status) => DropdownMenuItem(value: status, child: Text(Formatters.statusLabel(status))))
                      .toList(),
                  onChanged: (value) {
                    if (value != null) setState(() => _status = value);
                  },
                ),
                const SizedBox(height: 16),
                AppTextField(
                  label: 'Description (optional)',
                  controller: _descriptionController,
                  prefixIcon: Icons.notes_outlined,
                  maxLines: 4,
                ),
                const SizedBox(height: 24),
                AppButton(
                  label: _isEditing ? 'Save Changes' : 'Create Project',
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
}
