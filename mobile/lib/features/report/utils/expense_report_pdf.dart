import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../../core/utils/formatters.dart';
import '../../expense/data/models/expense_model.dart';
import '../../project/data/models/project_model.dart';

/// Builds a PDF document summarizing a project's expenses for a date range.
class ExpenseReportPdf {
  ExpenseReportPdf._();

  static Future<pw.Document> build({
    required ProjectModel project,
    required List<ExpenseModel> expenses,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    final doc = pw.Document();

    final total = expenses.fold<double>(0, (sum, e) => sum + e.amount);

    final byCategory = <String, double>{};
    for (final expense in expenses) {
      byCategory.update(expense.category, (value) => value + expense.amount,
          ifAbsent: () => expense.amount);
    }

    doc.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(32),
        header: (context) => _header(project, startDate, endDate),
        footer: (context) => pw.Container(
          alignment: pw.Alignment.centerRight,
          margin: const pw.EdgeInsets.only(top: 8),
          child: pw.Text(
            'Page ${context.pageNumber} of ${context.pagesCount}',
            style: const pw.TextStyle(fontSize: 9, color: PdfColors.grey600),
          ),
        ),
        build: (context) => [
          pw.SizedBox(height: 12),
          _summarySection(total, expenses.length, byCategory),
          pw.SizedBox(height: 16),
          pw.Text('Expense Details', style: pw.TextStyle(fontSize: 13, fontWeight: pw.FontWeight.bold)),
          pw.SizedBox(height: 8),
          _expenseTable(expenses, total),
        ],
      ),
    );

    return doc;
  }

  static pw.Widget _header(ProjectModel project, DateTime? startDate, DateTime? endDate) {
    final range = startDate != null && endDate != null
        ? '${Formatters.date(startDate)} - ${Formatters.date(endDate)}'
        : 'All time';

    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text('Expense Report', style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold)),
        pw.SizedBox(height: 4),
        pw.Text(project.projectName, style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold)),
        pw.Text('Client: ${project.clientName}', style: const pw.TextStyle(fontSize: 10)),
        pw.Text('Site: ${project.siteAddress}', style: const pw.TextStyle(fontSize: 10)),
        pw.Text('Period: $range', style: const pw.TextStyle(fontSize: 10)),
        pw.Divider(thickness: 1, height: 16),
      ],
    );
  }

  static pw.Widget _summarySection(double total, int count, Map<String, double> byCategory) {
    return pw.Container(
      padding: const pw.EdgeInsets.all(12),
      decoration: pw.BoxDecoration(
        color: PdfColors.grey100,
        borderRadius: pw.BorderRadius.circular(6),
      ),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text('Total Expenses', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
              pw.Text(Formatters.currencyForPdf(total), style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            ],
          ),
          pw.Text('$count entries', style: const pw.TextStyle(fontSize: 9, color: PdfColors.grey600)),
          if (byCategory.isNotEmpty) ...[
            pw.SizedBox(height: 8),
            pw.Text('By Category', style: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 4),
            ...byCategory.entries.map(
              (entry) => pw.Padding(
                padding: const pw.EdgeInsets.symmetric(vertical: 1),
                child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(Formatters.categoryLabel(entry.key), style: const pw.TextStyle(fontSize: 9)),
                    pw.Text(Formatters.currencyForPdf(entry.value), style: const pw.TextStyle(fontSize: 9)),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  static pw.Widget _expenseTable(List<ExpenseModel> expenses, double total) {
    final headers = ['Date', 'Category', 'Vendor', 'Payment', 'Amount'];

    return pw.TableHelper.fromTextArray(
      headers: headers,
      data: [
        for (final expense in expenses)
          [
            Formatters.date(expense.date),
            Formatters.categoryLabel(expense.category),
            expense.vendorName ?? '-',
            Formatters.categoryLabel(expense.paymentMode),
            Formatters.currencyForPdf(expense.amount),
          ],
        ['', '', '', 'Total', Formatters.currencyForPdf(total)],
      ],
      headerStyle: pw.TextStyle(fontSize: 9, fontWeight: pw.FontWeight.bold, color: PdfColors.white),
      headerDecoration: const pw.BoxDecoration(color: PdfColors.blueGrey800),
      cellStyle: const pw.TextStyle(fontSize: 9),
      cellAlignments: {
        0: pw.Alignment.centerLeft,
        1: pw.Alignment.centerLeft,
        2: pw.Alignment.centerLeft,
        3: pw.Alignment.centerLeft,
        4: pw.Alignment.centerRight,
      },
      cellPadding: const pw.EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      border: pw.TableBorder.all(color: PdfColors.grey300, width: 0.5),
      cellHeight: 24,
      oddRowDecoration: const pw.BoxDecoration(color: PdfColors.grey50),
    );
  }
}
