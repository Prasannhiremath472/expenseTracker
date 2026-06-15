import 'package:intl/intl.dart';

class Formatters {
  Formatters._();

  static final NumberFormat _currencyFormat = NumberFormat.currency(
    locale: 'en_IN',
    symbol: '₹',
    decimalDigits: 2,
  );

  /// Same as [_currencyFormat] but uses "Rs." instead of "₹", since the
  /// default PDF fonts don't include the Rupee glyph.
  static final NumberFormat _pdfCurrencyFormat = NumberFormat.currency(
    locale: 'en_IN',
    symbol: 'Rs. ',
    decimalDigits: 2,
  );

  static final DateFormat _dateFormat = DateFormat('dd MMM yyyy');
  static final DateFormat _dateTimeFormat = DateFormat('dd MMM yyyy, hh:mm a');
  static final DateFormat _monthFormat = DateFormat('MMM yyyy');

  static String currency(num amount) => _currencyFormat.format(amount);

  /// Currency formatting for PDF reports (uses "Rs." since PDF fonts lack the ₹ glyph).
  static String currencyForPdf(num amount) => _pdfCurrencyFormat.format(amount);

  static String date(DateTime date) => _dateFormat.format(date);

  static String dateTime(DateTime date) => _dateTimeFormat.format(date);

  static String monthYear(DateTime date) => _monthFormat.format(date);

  /// Converts a "YYYY-MM" string into a short month label, e.g. "Jan".
  static String monthLabelFromKey(String yearMonth) {
    final parts = yearMonth.split('-');
    if (parts.length != 2) return yearMonth;
    final year = int.tryParse(parts[0]) ?? 0;
    final month = int.tryParse(parts[1]) ?? 1;
    return DateFormat('MMM').format(DateTime(year, month));
  }

  static String categoryLabel(String category) {
    return category
        .split('_')
        .map((word) => word.isEmpty ? '' : '${word[0]}${word.substring(1).toLowerCase()}')
        .join(' ');
  }

  static String statusLabel(String status) {
    return status
        .split('_')
        .map((word) => word.isEmpty ? '' : '${word[0]}${word.substring(1).toLowerCase()}')
        .join(' ');
  }
}
