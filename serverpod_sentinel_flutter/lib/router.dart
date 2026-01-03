import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Screens
import 'screens/login_screen.dart';
import 'screens/splash/splash_screen.dart';
import 'screens/onboarding/welcome_screen.dart';
import 'screens/onboarding/create_env_screen.dart';
import 'screens/onboarding/register_service_screen.dart';
import 'screens/onboarding/install_agent_screen.dart';
import 'screens/onboarding/define_rules_screen.dart';
import 'screens/dashboard/dashboard_screen.dart';
import 'screens/registry/service_registry_screen.dart';
import 'screens/registry/service_detail_screen.dart';
import 'screens/incidents/incidents_screen.dart';
import 'screens/incidents/incident_detail_screen.dart';
import 'screens/incidents/remediation_request_screen.dart';
import 'screens/livestream/live_stream_screen.dart';
import 'screens/automation/playbooks_screen.dart';
import 'screens/automation/playbook_execution_screen.dart';
import 'screens/intelligence/ai_insights_screen.dart';
import 'screens/reports/incident_report_screen.dart';
import 'screens/settings/settings_screen.dart';
import 'screens/settings/team_members_screen.dart';
import 'screens/settings/integrations_manager_screen.dart';
import 'screens/settings/notification_preferences_screen.dart';
import 'screens/settings/environment_settings_screen.dart';
import 'screens/settings/system_settings_screen.dart';
import 'screens/settings/configure_rule_screen.dart';
import 'screens/settings/audit_log_screen.dart';
import 'widgets/dashboard_shell.dart';
import 'routes.dart'; // Keep for AppRoutes constants

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'shell',
);

final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: AppRoutes.splash,
  debugLogDiagnostics: true,
  routes: [
    // Auth & Splash
    GoRoute(
      path: AppRoutes.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: AppRoutes.login,
      builder: (context, state) => const LoginScreen(),
    ),

    // Onboarding
    GoRoute(
      path: AppRoutes.welcome,
      builder: (context, state) => const WelcomeScreen(),
    ),
    GoRoute(
      path: AppRoutes.createEnv,
      builder: (context, state) => const CreateEnvScreen(),
    ),
    GoRoute(
      path: AppRoutes.registerService,
      builder: (context, state) => const RegisterServiceScreen(),
    ),
    GoRoute(
      path: AppRoutes.installAgent,
      builder: (context, state) => const InstallAgentScreen(),
    ),
    GoRoute(
      path: AppRoutes.defineRules,
      builder: (context, state) => const DefineRulesScreen(),
    ),

    // Dashboard Shell Route
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        // We pass the child to the shell. The Shell renders the Sidebar and the child.
        // We can determine active route from state.uri.toString() if needed for sidebar highlighting,
        // though GoRouter usually handles state.
        return DashboardShell(child: child, state: state);
      },
      routes: [
        GoRoute(
          path: AppRoutes.dashboard, // '/'
          builder: (context, state) => const DashboardScreen(),
        ),
        GoRoute(
          path: AppRoutes.serviceRegistry,
          builder: (context, state) => const ServiceRegistryScreen(),
        ),
        GoRoute(
          path: AppRoutes.serviceDetail,
          builder: (context, state) => const ServiceDetailScreen(),
        ),
        GoRoute(
          path: AppRoutes.liveStream,
          builder: (context, state) => const LiveStreamScreen(),
        ),
        GoRoute(
          path: AppRoutes.incidents,
          builder: (context, state) => const IncidentsScreen(),
        ),
        GoRoute(
          path: AppRoutes.incidentDetail,
          builder: (context, state) => const IncidentDetailScreen(),
        ),
        GoRoute(
          path: AppRoutes.remediationRequest,
          builder: (context, state) => const RemediationRequestScreen(),
        ),
        GoRoute(
          path: AppRoutes.playbooks,
          builder: (context, state) => const PlaybooksScreen(),
        ),
        GoRoute(
          path: AppRoutes.playbookExecution,
          builder: (context, state) => const PlaybookExecutionScreen(),
        ),
        GoRoute(
          path: AppRoutes.aiInsights,
          builder: (context, state) => const AIInsightsScreen(),
        ),
        GoRoute(
          path: AppRoutes.incidentReport,
          builder: (context, state) => const IncidentReportScreen(),
        ),
        GoRoute(
          path: AppRoutes.settings,
          builder: (context, state) => const SettingsScreen(),
        ),
        GoRoute(
          path: AppRoutes.teamMembers,
          builder: (context, state) => const TeamMembersScreen(),
        ),
        GoRoute(
          path: AppRoutes.integrations,
          builder: (context, state) => const IntegrationsManagerScreen(),
        ),
        GoRoute(
          path: AppRoutes.notifications,
          builder: (context, state) => const NotificationPreferencesScreen(),
        ),
        GoRoute(
          path: AppRoutes.environmentSettings,
          builder: (context, state) => const EnvironmentSettingsScreen(),
        ),
        GoRoute(
          path: AppRoutes.systemSettings,
          builder: (context, state) => const SystemSettingsScreen(),
        ),
        GoRoute(
          path: AppRoutes.configureRule,
          builder: (context, state) => const ConfigureRuleScreen(),
        ),
        GoRoute(
          path: AppRoutes.auditLog,
          builder: (context, state) => const AuditLogScreen(),
        ),
      ],
    ),
  ],
);
