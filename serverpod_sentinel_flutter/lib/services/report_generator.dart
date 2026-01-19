import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class ReportGenerator {
  /// Generate a PDF report from incident data
  static Future<void> generateAndDownload(
    Map<String, dynamic> reportData,
    String incidentTitle,
  ) async {
    final pdf = pw.Document();

    final summary = reportData['summary'] ?? {};
    final generatedAt = reportData['generatedAt'] ?? DateTime.now().toString();

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (context) => [
          _buildHeader(incidentTitle, generatedAt),
          pw.SizedBox(height: 20),
          _buildSummarySection(summary),
          pw.SizedBox(height: 20),
          _buildMetricsSection(summary),
          pw.SizedBox(height: 20),
          if (reportData['rca'] != null) ...[
            pw.Text(
              'Root Cause Analysis',
              style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
            ),
            pw.Divider(),
            pw.Text(reportData['rca'] ?? 'No RCA provided.'),
            pw.SizedBox(height: 20),
          ],
          _buildFooter(),
        ],
      ),
    );

    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
      name:
          'Incident_Report_${incidentTitle.replaceAll(' ', '_')}_$generatedAt.pdf',
    );
  }

  static pw.Widget _buildHeader(String title, String date) {
    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
      children: [
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(
              'Serverpod Sentinel',
              style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold),
            ),
            pw.Text(
              'Incident Post-Mortem Report',
              style: const pw.TextStyle(fontSize: 14, color: PdfColors.grey),
            ),
          ],
        ),
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.end,
          children: [
            pw.Text('Date: $date', style: const pw.TextStyle(fontSize: 10)),
            pw.Text(
              'Status: GENERATED',
              style: const pw.TextStyle(fontSize: 10, color: PdfColors.blue),
            ),
          ],
        ),
      ],
    );
  }

  static pw.Widget _buildSummarySection(Map<String, dynamic> summary) {
    return pw.Container(
      padding: const pw.EdgeInsets.all(10),
      decoration: pw.BoxDecoration(
        border: pw.Border.all(color: PdfColors.grey300),
        borderRadius: pw.BorderRadius.circular(4),
      ),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            'Executive Summary',
            style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),
          ),
          pw.SizedBox(height: 10),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              _buildStatItem(
                'Total Services',
                '${summary['totalServices'] ?? 0}',
              ),
              _buildStatItem('Operational', '${summary['operational'] ?? 0}'),
              _buildStatItem('Degraded', '${summary['degraded'] ?? 0}'),
              _buildStatItem('Outages', '${summary['outage'] ?? 0}'),
            ],
          ),
        ],
      ),
    );
  }

  static pw.Widget _buildStatItem(String label, String value) {
    return pw.Column(
      children: [
        pw.Text(
          value,
          style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
        ),
        pw.Text(
          label,
          style: const pw.TextStyle(fontSize: 10, color: PdfColors.grey600),
        ),
      ],
    );
  }

  static pw.Widget _buildMetricsSection(Map<String, dynamic> summary) {
    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
      children: [
        _buildMetricCard(
          'Health Score',
          '${(summary['healthScore'] ?? 0.0).toStringAsFixed(1)}%',
        ),
        _buildMetricCard('Maintenance Mode', '${summary['maintenance'] ?? 0}'),
      ],
    );
  }

  static pw.Widget _buildMetricCard(String label, String value) {
    return pw.Expanded(
      child: pw.Container(
        margin: const pw.EdgeInsets.symmetric(horizontal: 5),
        padding: const pw.EdgeInsets.all(12),
        color: PdfColors.grey100,
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(label, style: const pw.TextStyle(fontSize: 10)),
            pw.Text(
              value,
              style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  static pw.Widget _buildFooter() {
    return pw.Column(
      children: [
        pw.Divider(),
        pw.SizedBox(height: 10),
        pw.Text(
          'Generated by Serverpod Sentinel AI',
          style: const pw.TextStyle(fontSize: 8, color: PdfColors.grey),
        ),
      ],
    );
  }
}
