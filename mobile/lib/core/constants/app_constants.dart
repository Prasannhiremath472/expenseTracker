class AppConstants {
  AppConstants._();

  static const String appName = 'Site Expense Tracker';

  static const List<String> projectStatuses = ['ACTIVE', 'COMPLETED', 'ON_HOLD'];

  static const List<String> expenseCategories = [
    'MATERIAL',
    'LABOUR',
    'TRANSPORT',
    'MACHINERY',
    'DIESEL',
    'ELECTRICITY',
    'FOOD',
    'MISCELLANEOUS',
  ];

  static const List<String> paymentModes = [
    'CASH',
    'UPI',
    'BANK_TRANSFER',
    'CHEQUE',
    'CARD',
  ];
}
