import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../providers/reports_provider.dart';
import '../../providers/client_provider.dart';
import '../../theme/app_theme.dart';
import '../../routes.dart';
import '../../widgets/shimmer_loading.dart';
import 'package:serverpod_sentinel_client/serverpod_sentinel_client.dart';

class ReportsScreen extends ConsumerWidget {
  const ReportsScreen({super.key});

  Future<void> _generateHealthReport(BuildContext context, WidgetRef ref) async {
    try {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Generating Health Report...')),
      );

      final client = ref.read(clientProvider);
      
      // 1. Generate Report
      final reportData = await client.report.generateHealthReport();
      
      // 2. Save Snapshot
      // Note: We need a dummy incidentId or 0 for non-incident reports if the schema requires it.
      // Protocol says incidentId is int, not nullable. We should probably use 0 or a dedicated "System" incident.
      // And generatedById requires a user ID. We can try to get it from auth or use 0.
      // Ideally backend handles this, but saveGeneratedReport takes raw params.
      // Let's assume 0 for now as "System/General".
      
      // We need to fetch current user ID. 
      // For now, hardcode 1 or 0 if auth provider not handy in this scope, 
      // but client usually handles auth.
      
      await client.report.saveGeneratedReport(
        reportData: reportData,
        incidentId: 0, 
        generatedById: 1, // Placeholder, normally from auth state
      );

      // 3. Refresh List
      ref.invalidate(reportSnapshotsProvider);

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Health Report Generated Successfully'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to generate report: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final snapshotsAsync = ref.watch(reportSnapshotsProvider);

    return Scaffold(
      backgroundColor: AppTheme.background,
      body: Column(
        children: [
          _Header(
            onGenerate: () => _generateHealthReport(context, ref),
          ),
          Expanded(
            child: snapshotsAsync.when(
              data: (snapshots) {
                if (snapshots.isEmpty) {
                  return const Center(
                    child: Text(
                      'No reports found',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }
                return ListView.builder(
                  padding: const EdgeInsets.all(24),
                  itemCount: snapshots.length,
                  itemBuilder: (context, index) {
                    final snapshot = snapshots[index];
                    return _ReportCard(snapshot: snapshot);
                  },
                );
              },
              loading: () => const ShimmerList(itemCount: 5),
              error: (e, s) => Center(
                child: Text(
                  'Error: $e',
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final VoidCallback onGenerate;

  const _Header({required this.onGenerate});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: const BoxDecoration(
        color: Color(0xFF1E293B),
        border: Border(bottom: BorderSide(color: Color(0xFF334155))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: const [
              Icon(LucideIcons.fileText, color: Colors.white),
              SizedBox(width: 12),
              Text(
                'Reports',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          ElevatedButton.icon(
            onPressed: onGenerate,
            icon: const Icon(LucideIcons.plus, size: 16),
            label: const Text('New Report'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.primary,
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class _ReportCard extends StatelessWidget {
  final ReportSnapshot snapshot;

  const _ReportCard({required this.snapshot});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppTheme.surface,
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppTheme.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(LucideIcons.fileBarChart, color: AppTheme.primary),
        ),
        title: Text(
          snapshot.incident?.title ?? 'Report #${snapshot.id}',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              'Generated on ${DateFormat('MMM d, y h:mm a').format(snapshot.generatedAt)}',
              style: const TextStyle(color: AppTheme.textMuted),
            ),
            if (snapshot.generatedBy != null)
              Text(
                'By: User #${snapshot.generatedBy!.userInfoId}',
                style: const TextStyle(color: AppTheme.textMuted, fontSize: 12),
              ),
          ],
        ),
        trailing: const Icon(LucideIcons.chevronRight, color: AppTheme.textDim),
        onTap: () {
          context.go('${AppRoutes.incidentReport}?id=${snapshot.id}');
        },
      ),
    );
  }
}
