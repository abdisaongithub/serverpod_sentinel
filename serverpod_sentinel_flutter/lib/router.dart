import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'services/serverpod_client.dart';

// Screens
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/forgot_password_screen.dart';
import 'screens/reset_password_screen.dart';
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
import 'screens/reports/reports_screen.dart';
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

import 'package:flutter_riverpod/flutter_riverpod.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'shell',
);

/// Listenable wrapper for Serverpod SessionManager
class _SessionManagerListener extends ChangeNotifier {
  _SessionManagerListener() {
    // Listen to session changes
    try {
      ServerpodClientSingleton.sessionManager.addListener(notifyListeners);
    } catch (_) {
      // Handle case where session manager might not be initialized yet
    }
  }

  @override
  void dispose() {
    try {
      ServerpodClientSingleton.sessionManager.removeListener(notifyListeners);
    } catch (_) {}
    super.dispose();
  }
}

final routerProvider = Provider<GoRouter>((ref) {
  // Use a listenable to trigger refreshes when auth state changes
  final authListenable = _SessionManagerListener();
  ref.onDispose(authListenable.dispose);

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppRoutes.splash,
    debugLogDiagnostics: true,
    refreshListenable: authListenable,
    redirect: (context, state) {
      // Use the session manager directly for synchronous check
      final isAuthenticated = ServerpodClientSingleton.isAuthenticated;
      final currentPath = state.matchedLocation;

      // Routes that don't require authentication
      /*
      final publicRoutes = [
        AppRoutes.splash,
        AppRoutes.login,
        AppRoutes.welcome,
        AppRoutes.createEnv,
        AppRoutes.registerService,
        AppRoutes.installAgent,
        AppRoutes.defineRules,
      ];
      */

      // final isPublicRoute = publicRoutes.contains(currentPath);

      // If not authenticated and trying to access protected route, redirect to login
      /* 
      if (!isAuthenticated && !isPublicRoute) {
        return AppRoutes.login;
      }
      */

      // If authenticated and on login page, redirect to dashboard
      // Note: We might want to skip redirection if explicitly logging out?
      // But SessionManager handles that state.
      if (isAuthenticated && currentPath == AppRoutes.login) {
        return AppRoutes.dashboard;
      }

      // No redirect needed
      return null;
    },
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
      GoRoute(
        path: AppRoutes.signup,
        builder: (context, state) => const SignupScreen(),
      ),
      GoRoute(
        path: AppRoutes.forgotPassword,
        builder: (context, state) => const ForgotPasswordScreen(),
      ),
      GoRoute(
        path: AppRoutes.resetPassword,
        builder: (context, state) =>
            ResetPasswordScreen(token: state.extra as String?),
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
            builder: (context, state) {
              final id = int.tryParse(state.pathParameters['id'] ?? '') ?? 0;
              return ServiceDetailScreen(serviceId: id);
            },
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
            builder: (context, state) {
              final idParam = state.pathParameters['id'];
              final id = int.tryParse(idParam ?? '') ?? 0;
              return IncidentDetailScreen(incidentId: id);
            },
          ),
          GoRoute(
            path: AppRoutes.remediationRequest,
            builder: (context, state) {
              final id =
                  int.tryParse(state.uri.queryParameters['id'] ?? '') ?? 0;
              return RemediationRequestScreen(incidentId: id);
            },
          ),
          GoRoute(
            path: AppRoutes.playbooks,
            builder: (context, state) => const PlaybooksScreen(),
          ),
          GoRoute(
            path: AppRoutes.playbookExecution,
            builder: (context, state) {
              final id =
                  int.tryParse(state.uri.queryParameters['id'] ?? '') ?? 0;
              return PlaybookExecutionScreen(playbookId: id);
            },
          ),
          GoRoute(
            path: AppRoutes.aiInsights,
            builder: (context, state) => const AIInsightsScreen(),
          ),
          GoRoute(
            path: AppRoutes.reports,
            builder: (context, state) => const ReportsScreen(),
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
});
