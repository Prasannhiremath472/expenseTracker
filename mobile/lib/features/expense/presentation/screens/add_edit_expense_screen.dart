import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/utils/validators.dart';
import '../../../../shared/widgets/app_button.dart';
import '../../../../shared/widgets/app_text_field.dart';
import '../../../project/presentation/providers/project_providers.dart';
import '../../data/models/expense_model.dart';
import '../providers/expense_providers.dart';

class AddEditExpenseScreen extends ConsumerStatefulWidget {
  const AddEditExpenseScreen({super.key, this.expense});

  /// If provided, the screen edits this expense; otherwise creates a new one.
  final ExpenseModel? expense;

  @override
  ConsumerState<AddEditExpenseScreen> createState() => _AddEditExpenseScreenState();
}

class _AddEditExpenseScreenState extends ConsumerState<AddEditExpenseScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _amountController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _vendorNameController;
  late DateTime _date;
  late String _category;
  late String _paymentMode;
  String? _projectId;
  String? _existingBillImageUrl;
  File? _pickedBillImage;

  bool get _isEditing => widget.expense != null;

  @override
  void initState() {
    super.initState();
    final expense = widget.expense;
    _amountController = TextEditingController(text: expense != null ? expense.amount.toString() : '');
    _descriptionController = TextEditingController(text: expense?.description ?? '');
    _vendorNameController = TextEditingController(text: expense?.vendorName ?? '');
    _date = expense?.date ?? DateTime.now();
    _category = expense?.category ?? AppConstants.expenseCategories.first;
    _paymentMode = expense?.paymentMode ?? AppConstants.paymentModes.first;
    _projectId = expense?.projectId;
    _existingBillImageUrl = expense?.billImageUrl;
  }

  @override
  void dispose() {
    _amountController.dispose();
    _descriptionController.dispose();
    _vendorNameController.dispose();
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

  Future<void> _pickBillImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery, imageQuality: 85);
    if (picked != null) {
      setState(() {
        _pickedBillImage = File(picked.path);
        _existingBillImageUrl = null;
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

    final notifier = ref.read(expenseFormProvider.notifier);
    final expense = await notifier.submit(
      id: widget.expense?.id,
      projectId: _projectId!,
      date: _date,
      category: _category,
      amount: double.parse(_amountController.text.trim()),
      description: _descriptionController.text.trim().isEmpty ? null : _descriptionController.text.trim(),
      vendorName: _vendorNameController.text.trim().isEmpty ? null : _vendorNameController.text.trim(),
      paymentMode: _paymentMode,
      billImagePath: _pickedBillImage?.path,
    );

    if (!mounted) return;

    if (expense != null) {
      ref.invalidate(expenseListProvider);
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final formState = ref.watch(expenseFormProvider);
    final isLoading = formState.isLoading;
    final projectsAsync = ref.watch(projectListProvider);

    ref.listen<AsyncValue<void>>(expenseFormProvider, (previous, next) {
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
      appBar: AppBar(title: Text(_isEditing ? 'Edit Expense' : 'Add Expense')),
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
                DropdownButtonFormField<String>(
                  initialValue: _category,
                  decoration: const InputDecoration(
                    labelText: 'Category',
                    prefixIcon: Icon(Icons.category_outlined),
                  ),
                  items: AppConstants.expenseCategories
                      .map((category) => DropdownMenuItem(value: category, child: Text(Formatters.categoryLabel(category))))
                      .toList(),
                  onChanged: (value) {
                    if (value != null) setState(() => _category = value);
                  },
                ),
                const SizedBox(height: 16),
                AppTextField(
                  label: 'Amount (₹)',
                  controller: _amountController,
                  prefixIcon: Icons.currency_rupee,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  validator: (value) => Validators.amount(value),
                ),
                const SizedBox(height: 16),
                AppTextField(
                  label: 'Vendor Name (optional)',
                  controller: _vendorNameController,
                  prefixIcon: Icons.storefront_outlined,
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  initialValue: _paymentMode,
                  decoration: const InputDecoration(
                    labelText: 'Payment Mode',
                    prefixIcon: Icon(Icons.payments_outlined),
                  ),
                  items: AppConstants.paymentModes
                      .map((mode) => DropdownMenuItem(value: mode, child: Text(Formatters.statusLabel(mode))))
                      .toList(),
                  onChanged: (value) {
                    if (value != null) setState(() => _paymentMode = value);
                  },
                ),
                const SizedBox(height: 16),
                AppTextField(
                  label: 'Description (optional)',
                  controller: _descriptionController,
                  prefixIcon: Icons.notes_outlined,
                  maxLines: 3,
                ),
                const SizedBox(height: 16),
                _buildBillImagePicker(),
                const SizedBox(height: 24),
                AppButton(
                  label: _isEditing ? 'Save Changes' : 'Add Expense',
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

  Widget _buildBillImagePicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Bill Image (optional)', style: Theme.of(context).textTheme.labelLarge),
        const SizedBox(height: 8),
        if (_pickedBillImage != null)
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.file(_pickedBillImage!, height: 160, width: double.infinity, fit: BoxFit.cover),
              ),
              Positioned(
                top: 4,
                right: 4,
                child: IconButton(
                  icon: const Icon(Icons.close, color: Colors.white),
                  style: IconButton.styleFrom(backgroundColor: Colors.black54),
                  onPressed: () => setState(() => _pickedBillImage = null),
                ),
              ),
            ],
          )
        else if (_existingBillImageUrl != null)
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(_existingBillImageUrl!, height: 160, width: double.infinity, fit: BoxFit.cover),
              ),
              Positioned(
                top: 4,
                right: 4,
                child: IconButton(
                  icon: const Icon(Icons.close, color: Colors.white),
                  style: IconButton.styleFrom(backgroundColor: Colors.black54),
                  onPressed: () => setState(() => _existingBillImageUrl = null),
                ),
              ),
            ],
          )
        else
          OutlinedButton.icon(
            onPressed: _pickBillImage,
            icon: const Icon(Icons.add_a_photo_outlined),
            label: const Text('Attach Bill Photo'),
          ),
        if ((_pickedBillImage != null || _existingBillImageUrl != null))
          TextButton.icon(
            onPressed: _pickBillImage,
            icon: const Icon(Icons.refresh),
            label: const Text('Replace photo'),
          ),
      ],
    );
  }
}
