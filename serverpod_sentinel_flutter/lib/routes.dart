/// Application route names
class AppRoutes {
  // Auth
  static const String login = '/login';
  static const String splash = '/splash';

  // Onboarding
  static const String welcome = '/onboarding/welcome';
  static const String createEnv = '/onboarding/create-env';
  static const String registerService = '/onboarding/register-service';
  static const String installAgent = '/onboarding/install-agent';
  static const String defineRules = '/onboarding/define-rules';

  // Main screens
  static const String dashboard = '/';
  static const String serviceRegistry = '/registry';
  static const String serviceDetail = '/registry/detail';
  static const String liveStream = '/live-stream';

  // Incidents
  static const String incidents = '/incidents';
  static const String incidentDetail = '/incidents/detail';
  static const String remediationRequest = '/incidents/remediation';

  // Automation
  static const String playbooks = '/playbooks';
  static const String playbookExecution = '/playbooks/execution';

  // Intelligence & Reports
  static const String aiInsights = '/ai-insights';
  static const String incidentReport = '/reports/incident';

  // Settings
  static const String settings = '/settings';
  static const String teamMembers = '/settings/team';
  static const String integrations = '/settings/integrations';
  static const String notifications = '/settings/notifications';
  static const String environmentSettings = '/settings/environment';
  static const String systemSettings = '/settings/system';
  static const String configureRule = '/settings/configure-rule';
  static const String auditLog = '/settings/audit-log';
}
