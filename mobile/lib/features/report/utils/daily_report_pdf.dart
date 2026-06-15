import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../../core/utils/formatters.dart';
import '../../project/data/models/project_model.dart';
import '../data/models/report_model.dart';

/// Builds a PDF document summarizing a project's daily site reports for a date range.
class DailyReportPdf {
  DailyReportPdf._();

  static Future<pw.Document> build({
    required ProjectModel project,
    required List<ReportModel> reports,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    final doc = pw.Document();

    final totalWorkers = reports.fold<int>(0, (sum, r) => sum + r.workersCount);

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
          _summarySection(reports.length, totalWorkers),
          pw.SizedBox(height: 16),
          pw.Text('Daily Site Reports', style: pw.TextStyle(fontSize: 13, fontWeight: pw.FontWeight.bold)),
          pw.SizedBox(height: 8),
          for (final report in reports) ...[
            _reportEntry(report),
            pw.SizedBox(height: 10),
          ],
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
        pw.Text('Daily Site Report', style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold)),
        pw.SizedBox(height: 4),
        pw.Text(project.projectName, style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold)),
        pw.Text('Client: ${project.clientName}', style: const pw.TextStyle(fontSize: 10)),
        pw.Text('Site: ${project.siteAddress}', style: const pw.TextStyle(fontSize: 10)),
        pw.Text('Period: $range', style: const pw.TextStyle(fontSize: 10)),
        pw.Divider(thickness: 1, height: 16),
      ],
    );
  }

  static pw.Widget _summarySection(int count, int totalWorkers) {
    return pw.Container(
      padding: const pw.EdgeInsets.all(12),
      decoration: pw.BoxDecoration(
        color: PdfColors.grey100,
        borderRadius: pw.BorderRadius.circular(6),
      ),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Text('$count daily reports', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
          pw.Text('$totalWorkers total worker-days', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
        ],
      ),
    );
  }

  static pw.Widget _reportEntry(ReportModel report) {
    return pw.Container(
      padding: const pw.EdgeInsets.all(10),
      decoration: pw.BoxDecoration(
        border: pw.Border.all(color: PdfColors.grey300, width: 0.5),
        borderRadius: pw.BorderRadius.circular(4),
      ),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text(Formatters.date(report.date), style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 11)),
              pw.Text('${report.workersCount} workers', style: const pw.TextStyle(fontSize: 10)),
            ],
          ),
          if (report.workCompleted != null && report.workCompleted!.isNotEmpty) ...[
            pw.SizedBox(height: 4),
            _field('Work Completed', report.workCompleted!),
          ],
          if (report.materialsUsed != null && report.materialsUsed!.isNotEmpty) ...[
            pw.SizedBox(height: 4),
            _field('Materials Used', report.materialsUsed!),
          ],
          if (report.issuesFaced != null && report.issuesFaced!.isNotEmpty) ...[
            pw.SizedBox(height: 4),
            _field('Issues Faced', report.issuesFaced!),
          ],
          if (report.notes != null && report.notes!.isNotEmpty) ...[
            pw.SizedBox(height: 4),
            _field('Notes', report.notes!),
          ],
          if (report.sitePhotoUrls.isNotEmpty) ...[
            pw.SizedBox(height: 4),
            pw.Text(
              '${report.sitePhotoUrls.length} site photo(s) attached (view in app)',
              style: const pw.TextStyle(fontSize: 8, color: PdfColors.grey600, fontStyle: pw.FontStyle.italic),
            ),
          ],
        ],
      ),
    );
  }

  static pw.Widget _field(String label, String value) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(label, style: pw.TextStyle(fontSize: 8, fontWeight: pw.FontWeight.bold, color: PdfColors.grey700)),
        pw.Text(value, style: const pw.TextStyle(fontSize: 9)),
      ],
    );
  }
}
