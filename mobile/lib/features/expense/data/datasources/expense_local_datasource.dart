import '../../../../core/constants/hive_constants.dart';
import '../../../../core/storage/hive_service.dart';
import '../models/expense_model.dart';

class ExpenseLocalDataSource {
  ExpenseLocalDataSource(this._hiveService);

  final HiveService _hiveService;

  Future<void> cacheExpenses(List<ExpenseModel> expenses) async {
    await _hiveService.replaceAll(
      HiveBoxes.expenses,
      expenses.map((e) => e.toJson()).toList(),
      (json) => json['id'] as String,
    );
  }

  List<ExpenseModel> getCachedExpenses() {
    return _hiveService
        .getAll(HiveBoxes.expenses)
        .map((json) => ExpenseModel.fromJson(json))
        .toList();
  }

  Future<void> cacheExpense(ExpenseModel expense) async {
    await _hiveService.put(HiveBoxes.expenses, expense.id, expense.toJson());
  }

  Future<void> removeCachedExpense(String id) async {
    await _hiveService.delete(HiveBoxes.expenses, id);
  }
}
