/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _i1;
import 'package:serverpod_client/serverpod_client.dart' as _i2;
import 'dart:async' as _i3;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _i4;
import 'package:serverpod_sentinel_client/src/protocol/agent/agent_task.dart'
    as _i5;
import 'package:serverpod_sentinel_client/src/protocol/agent/agent_task_status.dart'
    as _i6;
import 'package:serverpod_sentinel_client/src/protocol/ai/ai_insight.dart'
    as _i7;
import 'package:serverpod_sentinel_client/src/protocol/streaming/stream_alert.dart'
    as _i8;
import 'package:serverpod_sentinel_client/src/protocol/security/audit_log.dart'
    as _i9;
import 'package:serverpod_sentinel_client/src/protocol/settings/environment.dart'
    as _i10;
import 'package:serverpod_sentinel_client/src/protocol/incident/incident.dart'
    as _i11;
import 'package:serverpod_sentinel_client/src/protocol/enums/incident_status.dart'
    as _i12;
import 'package:serverpod_sentinel_client/src/protocol/enums/incident_severity.dart'
    as _i13;
import 'package:serverpod_sentinel_client/src/protocol/incident/incident_timeline_item.dart'
    as _i14;
import 'package:serverpod_sentinel_client/src/protocol/settings/integration.dart'
    as _i15;
import 'package:serverpod_sentinel_client/src/protocol/settings/notification_preference.dart'
    as _i16;
import 'package:serverpod_sentinel_client/src/protocol/settings/outgoing_webhook.dart'
    as _i17;
import 'package:serverpod_sentinel_client/src/protocol/automation/playbook.dart'
    as _i18;
import 'package:serverpod_sentinel_client/src/protocol/enums/playbook_type.dart'
    as _i19;
import 'package:serverpod_sentinel_client/src/protocol/automation/playbook_execution.dart'
    as _i20;
import 'package:serverpod_sentinel_client/src/protocol/reporting/report_snapshot.dart'
    as _i21;
import 'package:serverpod_sentinel_client/src/protocol/service/rule.dart'
    as _i22;
import 'package:serverpod_sentinel_client/src/protocol/security/sentinel_api_key.dart'
    as _i23;
import 'package:serverpod_sentinel_client/src/protocol/service/service.dart'
    as _i24;
import 'package:serverpod_sentinel_client/src/protocol/enums/service_status.dart'
    as _i25;
import 'package:serverpod_sentinel_client/src/protocol/enums/service_tier.dart'
    as _i26;
import 'package:serverpod_sentinel_client/src/protocol/dtos/health_summary.dart'
    as _i27;
import 'package:serverpod_sentinel_client/src/protocol/dtos/system_metrics.dart'
    as _i28;
import 'package:serverpod_sentinel_client/src/protocol/settings/system_setting.dart'
    as _i29;
import 'package:serverpod_sentinel_client/src/protocol/telemetry/telemetry_signal_payload.dart'
    as _i30;
import 'package:serverpod_sentinel_client/src/protocol/telemetry/telemetry_signal_batch.dart'
    as _i31;
import 'package:serverpod_sentinel_client/src/protocol/telemetry/telemetry_heartbeat.dart'
    as _i32;
import 'package:serverpod_sentinel_client/src/protocol/service/health_signal.dart'
    as _i33;
import 'package:serverpod_sentinel_client/src/protocol/telemetry/metric_point.dart'
    as _i34;
import 'package:serverpod_sentinel_client/src/protocol/dtos/team_member.dart'
    as _i35;
import 'package:serverpod_sentinel_client/src/protocol/security/ops_user.dart'
    as _i36;
import 'package:serverpod_sentinel_client/src/protocol/security/user_role.dart'
    as _i37;
import 'package:serverpod_sentinel_client/src/protocol/greetings/greeting.dart'
    as _i38;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i39;
import 'protocol.dart' as _i40;

/// By extending [EmailIdpBaseEndpoint], the email identity provider endpoints
/// are made available on the server and enable the corresponding sign-in widget
/// on the client.
/// {@category Endpoint}
class EndpointEmailIdp extends _i1.EndpointEmailIdpBase {
  EndpointEmailIdp(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'emailIdp';

  /// Logs in the user and returns a new session.
  ///
  /// Throws an [EmailAccountLoginException] in case of errors, with reason:
  /// - [EmailAccountLoginExceptionReason.invalidCredentials] if the email or
  ///   password is incorrect.
  /// - [EmailAccountLoginExceptionReason.tooManyAttempts] if there have been
  ///   too many failed login attempts.
  ///
  /// Throws an [AuthUserBlockedException] if the auth user is blocked.
  @override
  _i3.Future<_i4.AuthSuccess> login({
    required String email,
    required String password,
  }) => caller.callServerEndpoint<_i4.AuthSuccess>(
    'emailIdp',
    'login',
    {
      'email': email,
      'password': password,
    },
  );

  /// Starts the registration for a new user account with an email-based login
  /// associated to it.
  ///
  /// Upon successful completion of this method, an email will have been
  /// sent to [email] with a verification link, which the user must open to
  /// complete the registration.
  ///
  /// Always returns a account request ID, which can be used to complete the
  /// registration. If the email is already registered, the returned ID will not
  /// be valid.
  @override
  _i3.Future<_i2.UuidValue> startRegistration({required String email}) =>
      caller.callServerEndpoint<_i2.UuidValue>(
        'emailIdp',
        'startRegistration',
        {'email': email},
      );

  /// Verifies an account request code and returns a token
  /// that can be used to complete the account creation.
  ///
  /// Throws an [EmailAccountRequestException] in case of errors, with reason:
  /// - [EmailAccountRequestExceptionReason.expired] if the account request has
  ///   already expired.
  /// - [EmailAccountRequestExceptionReason.policyViolation] if the password
  ///   does not comply with the password policy.
  /// - [EmailAccountRequestExceptionReason.invalid] if no request exists
  ///   for the given [accountRequestId] or [verificationCode] is invalid.
  @override
  _i3.Future<String> verifyRegistrationCode({
    required _i2.UuidValue accountRequestId,
    required String verificationCode,
  }) => caller.callServerEndpoint<String>(
    'emailIdp',
    'verifyRegistrationCode',
    {
      'accountRequestId': accountRequestId,
      'verificationCode': verificationCode,
    },
  );

  /// Completes a new account registration, creating a new auth user with a
  /// profile and attaching the given email account to it.
  ///
  /// Throws an [EmailAccountRequestException] in case of errors, with reason:
  /// - [EmailAccountRequestExceptionReason.expired] if the account request has
  ///   already expired.
  /// - [EmailAccountRequestExceptionReason.policyViolation] if the password
  ///   does not comply with the password policy.
  /// - [EmailAccountRequestExceptionReason.invalid] if the [registrationToken]
  ///   is invalid.
  ///
  /// Throws an [AuthUserBlockedException] if the auth user is blocked.
  ///
  /// Returns a session for the newly created user.
  @override
  _i3.Future<_i4.AuthSuccess> finishRegistration({
    required String registrationToken,
    required String password,
  }) => caller.callServerEndpoint<_i4.AuthSuccess>(
    'emailIdp',
    'finishRegistration',
    {
      'registrationToken': registrationToken,
      'password': password,
    },
  );

  /// Requests a password reset for [email].
  ///
  /// If the email address is registered, an email with reset instructions will
  /// be send out. If the email is unknown, this method will have no effect.
  ///
  /// Always returns a password reset request ID, which can be used to complete
  /// the reset. If the email is not registered, the returned ID will not be
  /// valid.
  ///
  /// Throws an [EmailAccountPasswordResetException] in case of errors, with reason:
  /// - [EmailAccountPasswordResetExceptionReason.tooManyAttempts] if the user has
  ///   made too many attempts trying to request a password reset.
  ///
  @override
  _i3.Future<_i2.UuidValue> startPasswordReset({required String email}) =>
      caller.callServerEndpoint<_i2.UuidValue>(
        'emailIdp',
        'startPasswordReset',
        {'email': email},
      );

  /// Verifies a password reset code and returns a finishPasswordResetToken
  /// that can be used to finish the password reset.
  ///
  /// Throws an [EmailAccountPasswordResetException] in case of errors, with reason:
  /// - [EmailAccountPasswordResetExceptionReason.expired] if the password reset
  ///   request has already expired.
  /// - [EmailAccountPasswordResetExceptionReason.tooManyAttempts] if the user has
  ///   made too many attempts trying to verify the password reset.
  /// - [EmailAccountPasswordResetExceptionReason.invalid] if no request exists
  ///   for the given [passwordResetRequestId] or [verificationCode] is invalid.
  ///
  /// If multiple steps are required to complete the password reset, this endpoint
  /// should be overridden to return credentials for the next step instead
  /// of the credentials for setting the password.
  @override
  _i3.Future<String> verifyPasswordResetCode({
    required _i2.UuidValue passwordResetRequestId,
    required String verificationCode,
  }) => caller.callServerEndpoint<String>(
    'emailIdp',
    'verifyPasswordResetCode',
    {
      'passwordResetRequestId': passwordResetRequestId,
      'verificationCode': verificationCode,
    },
  );

  /// Completes a password reset request by setting a new password.
  ///
  /// The [verificationCode] returned from [verifyPasswordResetCode] is used to
  /// validate the password reset request.
  ///
  /// Throws an [EmailAccountPasswordResetException] in case of errors, with reason:
  /// - [EmailAccountPasswordResetExceptionReason.expired] if the password reset
  ///   request has already expired.
  /// - [EmailAccountPasswordResetExceptionReason.policyViolation] if the new
  ///   password does not comply with the password policy.
  /// - [EmailAccountPasswordResetExceptionReason.invalid] if no request exists
  ///   for the given [passwordResetRequestId] or [verificationCode] is invalid.
  ///
  /// Throws an [AuthUserBlockedException] if the auth user is blocked.
  @override
  _i3.Future<void> finishPasswordReset({
    required String finishPasswordResetToken,
    required String newPassword,
  }) => caller.callServerEndpoint<void>(
    'emailIdp',
    'finishPasswordReset',
    {
      'finishPasswordResetToken': finishPasswordResetToken,
      'newPassword': newPassword,
    },
  );
}

/// By extending [RefreshJwtTokensEndpoint], the JWT token refresh endpoint
/// is made available on the server and enables automatic token refresh on the client.
/// {@category Endpoint}
class EndpointJwtRefresh extends _i4.EndpointRefreshJwtTokens {
  EndpointJwtRefresh(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'jwtRefresh';

  /// Creates a new token pair for the given [refreshToken].
  ///
  /// Can throw the following exceptions:
  /// -[RefreshTokenMalformedException]: refresh token is malformed and could
  ///   not be parsed. Not expected to happen for tokens issued by the server.
  /// -[RefreshTokenNotFoundException]: refresh token is unknown to the server.
  ///   Either the token was deleted or generated by a different server.
  /// -[RefreshTokenExpiredException]: refresh token has expired. Will happen
  ///   only if it has not been used within configured `refreshTokenLifetime`.
  /// -[RefreshTokenInvalidSecretException]: refresh token is incorrect, meaning
  ///   it does not refer to the current secret refresh token. This indicates
  ///   either a malfunctioning client or a malicious attempt by someone who has
  ///   obtained the refresh token. In this case the underlying refresh token
  ///   will be deleted, and access to it will expire fully when the last access
  ///   token is elapsed.
  ///
  /// This endpoint is unauthenticated, meaning the client won't include any
  /// authentication information with the call.
  @override
  _i3.Future<_i4.AuthSuccess> refreshAccessToken({
    required String refreshToken,
  }) => caller.callServerEndpoint<_i4.AuthSuccess>(
    'jwtRefresh',
    'refreshAccessToken',
    {'refreshToken': refreshToken},
    authenticated: false,
  );
}

/// {@category Endpoint}
class EndpointAgent extends _i2.EndpointRef {
  EndpointAgent(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'agent';

  /// Check for any pending tasks for a specific agent
  _i3.Future<_i5.AgentTask?> pollTask(int serviceId) =>
      caller.callServerEndpoint<_i5.AgentTask?>(
        'agent',
        'pollTask',
        {'serviceId': serviceId},
      );

  /// Update status and result of a task
  _i3.Future<void> updateTaskStatus(
    int taskId,
    _i6.AgentTaskStatus status, {
    String? output,
    int? exitCode,
  }) => caller.callServerEndpoint<void>(
    'agent',
    'updateTaskStatus',
    {
      'taskId': taskId,
      'status': status,
      'output': output,
      'exitCode': exitCode,
    },
  );

  /// Create a new task for an agent
  _i3.Future<_i5.AgentTask> createTask(
    int serviceId,
    String command, {
    List<String>? arguments,
    required int timeoutSeconds,
  }) => caller.callServerEndpoint<_i5.AgentTask>(
    'agent',
    'createTask',
    {
      'serviceId': serviceId,
      'command': command,
      'arguments': arguments,
      'timeoutSeconds': timeoutSeconds,
    },
  );
}

/// AI Insights Endpoint
/// {@category Endpoint}
class EndpointAiInsights extends _i2.EndpointRef {
  EndpointAiInsights(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'aiInsights';

  /// Get AI-generated insights
  _i3.Future<List<_i7.AiInsight>> getInsights({
    int? serviceId,
    String? type,
    int? limit,
  }) => caller.callServerEndpoint<List<_i7.AiInsight>>(
    'aiInsights',
    'getInsights',
    {
      'serviceId': serviceId,
      'type': type,
      'limit': limit,
    },
  );

  /// Analyze an incident and generate insights
  _i3.Future<Map<String, dynamic>> analyzeIncident(int incidentId) =>
      caller.callServerEndpoint<Map<String, dynamic>>(
        'aiInsights',
        'analyzeIncident',
        {'incidentId': incidentId},
      );

  /// Trigger anomaly scan for a service
  _i3.Future<List<_i7.AiInsight>> scanForAnomalies(int serviceId) =>
      caller.callServerEndpoint<List<_i7.AiInsight>>(
        'aiInsights',
        'scanForAnomalies',
        {'serviceId': serviceId},
      );
}

/// Endpoint for managing alerts and live stream events
/// {@category Endpoint}
class EndpointAlert extends _i2.EndpointRef {
  EndpointAlert(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'alert';

  /// Get recent alerts for the live stream view
  /// Returns the most recent alerts (default: 20)
  _i3.Future<List<_i8.StreamAlert>> getRecent({
    required int limit,
    String? severity,
  }) => caller.callServerEndpoint<List<_i8.StreamAlert>>(
    'alert',
    'getRecent',
    {
      'limit': limit,
      'severity': severity,
    },
  );
}

/// {@category Endpoint}
class EndpointAuditLog extends _i2.EndpointRef {
  EndpointAuditLog(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'auditLog';

  /// List audit logs with filtering
  _i3.Future<List<_i9.AuditLog>> list({
    int? actorId,
    String? action,
    String? entityType,
    DateTime? from,
    DateTime? to,
    int? limit,
    int? offset,
  }) => caller.callServerEndpoint<List<_i9.AuditLog>>(
    'auditLog',
    'list',
    {
      'actorId': actorId,
      'action': action,
      'entityType': entityType,
      'from': from,
      'to': to,
      'limit': limit,
      'offset': offset,
    },
  );

  /// Get single audit log entry
  _i3.Future<_i9.AuditLog?> get(int id) =>
      caller.callServerEndpoint<_i9.AuditLog?>(
        'auditLog',
        'get',
        {'id': id},
      );

  /// Get audit logs for a specific entity
  _i3.Future<List<_i9.AuditLog>> getForEntity(
    String entityType,
    int entityId,
  ) => caller.callServerEndpoint<List<_i9.AuditLog>>(
    'auditLog',
    'getForEntity',
    {
      'entityType': entityType,
      'entityId': entityId,
    },
  );

  /// Get available action types
  _i3.Future<List<String>> getActionTypes() =>
      caller.callServerEndpoint<List<String>>(
        'auditLog',
        'getActionTypes',
        {},
      );

  /// Get available entity types
  _i3.Future<List<String>> getEntityTypes() =>
      caller.callServerEndpoint<List<String>>(
        'auditLog',
        'getEntityTypes',
        {},
      );
}

/// {@category Endpoint}
class EndpointEnvironment extends _i2.EndpointRef {
  EndpointEnvironment(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'environment';

  /// List all environments
  _i3.Future<List<_i10.Environment>> list() =>
      caller.callServerEndpoint<List<_i10.Environment>>(
        'environment',
        'list',
        {},
      );

  /// Get single environment by ID
  _i3.Future<_i10.Environment?> get(int id) =>
      caller.callServerEndpoint<_i10.Environment?>(
        'environment',
        'get',
        {'id': id},
      );

  /// Create new environment
  _i3.Future<_i10.Environment> create(_i10.Environment environment) =>
      caller.callServerEndpoint<_i10.Environment>(
        'environment',
        'create',
        {'environment': environment},
      );

  /// Update environment
  _i3.Future<_i10.Environment> update(_i10.Environment environment) =>
      caller.callServerEndpoint<_i10.Environment>(
        'environment',
        'update',
        {'environment': environment},
      );

  /// Delete environment
  _i3.Future<bool> delete(int id) => caller.callServerEndpoint<bool>(
    'environment',
    'delete',
    {'id': id},
  );

  /// Get active environment
  _i3.Future<_i10.Environment?> getActive() =>
      caller.callServerEndpoint<_i10.Environment?>(
        'environment',
        'getActive',
        {},
      );

  /// Set active environment
  _i3.Future<_i10.Environment> setActive(int id) =>
      caller.callServerEndpoint<_i10.Environment>(
        'environment',
        'setActive',
        {'id': id},
      );
}

/// {@category Endpoint}
class EndpointHealth extends _i2.EndpointRef {
  EndpointHealth(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'health';

  /// Simple health check - always returns true if server is responding
  _i3.Future<bool> ping() => caller.callServerEndpoint<bool>(
    'health',
    'ping',
    {},
  );

  /// Detailed health check including dependencies
  _i3.Future<Map<String, dynamic>> check() =>
      caller.callServerEndpoint<Map<String, dynamic>>(
        'health',
        'check',
        {},
      );

  /// Readiness check for Kubernetes
  _i3.Future<Map<String, dynamic>> ready() =>
      caller.callServerEndpoint<Map<String, dynamic>>(
        'health',
        'ready',
        {},
      );

  /// Liveness check for Kubernetes
  _i3.Future<Map<String, dynamic>> live() =>
      caller.callServerEndpoint<Map<String, dynamic>>(
        'health',
        'live',
        {},
      );
}

/// {@category Endpoint}
class EndpointIncident extends _i2.EndpointRef {
  EndpointIncident(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'incident';

  /// List incidents with filtering
  _i3.Future<List<_i11.Incident>> list({
    _i12.IncidentStatus? status,
    _i13.IncidentSeverity? severity,
    int? serviceId,
    int? limit,
    int? offset,
  }) => caller.callServerEndpoint<List<_i11.Incident>>(
    'incident',
    'list',
    {
      'status': status,
      'severity': severity,
      'serviceId': serviceId,
      'limit': limit,
      'offset': offset,
    },
  );

  /// Get single incident with full details
  _i3.Future<_i11.Incident?> get(int id) =>
      caller.callServerEndpoint<_i11.Incident?>(
        'incident',
        'get',
        {'id': id},
      );

  /// Update incident status
  _i3.Future<_i11.Incident> updateStatus(
    int id,
    _i12.IncidentStatus status,
  ) => caller.callServerEndpoint<_i11.Incident>(
    'incident',
    'updateStatus',
    {
      'id': id,
      'status': status,
    },
  );

  /// Assign incident commander
  _i3.Future<_i11.Incident> assignCommander(
    int id,
    int commanderId,
  ) => caller.callServerEndpoint<_i11.Incident>(
    'incident',
    'assignCommander',
    {
      'id': id,
      'commanderId': commanderId,
    },
  );

  /// Add timeline item (comment, action, etc.)
  _i3.Future<_i14.IncidentTimelineItem> addTimelineItem(
    _i14.IncidentTimelineItem item,
  ) => caller.callServerEndpoint<_i14.IncidentTimelineItem>(
    'incident',
    'addTimelineItem',
    {'item': item},
  );

  /// Get incident statistics for dashboard
  _i3.Future<Map<String, dynamic>> getStats() =>
      caller.callServerEndpoint<Map<String, dynamic>>(
        'incident',
        'getStats',
        {},
      );

  /// Create a new incident manually
  _i3.Future<_i11.Incident> create(_i11.Incident incident) =>
      caller.callServerEndpoint<_i11.Incident>(
        'incident',
        'create',
        {'incident': incident},
      );

  /// Close an incident
  _i3.Future<_i11.Incident> close(int id) =>
      caller.callServerEndpoint<_i11.Incident>(
        'incident',
        'close',
        {'id': id},
      );

  /// Acknowledge an incident
  _i3.Future<_i11.Incident> acknowledge(
    int id,
    int userId,
  ) => caller.callServerEndpoint<_i11.Incident>(
    'incident',
    'acknowledge',
    {
      'id': id,
      'userId': userId,
    },
  );

  /// Bulk acknowledge all open incidents
  _i3.Future<int> acknowledgeAll(int userId) => caller.callServerEndpoint<int>(
    'incident',
    'acknowledgeAll',
    {'userId': userId},
  );

  /// Update incident details
  _i3.Future<_i11.Incident> update(_i11.Incident incident) =>
      caller.callServerEndpoint<_i11.Incident>(
        'incident',
        'update',
        {'incident': incident},
      );

  /// Delete an incident
  _i3.Future<bool> delete(int id) => caller.callServerEndpoint<bool>(
    'incident',
    'delete',
    {'id': id},
  );
}

/// {@category Endpoint}
class EndpointIntegration extends _i2.EndpointRef {
  EndpointIntegration(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'integration';

  /// List all integrations
  _i3.Future<List<_i15.Integration>> list({String? type}) =>
      caller.callServerEndpoint<List<_i15.Integration>>(
        'integration',
        'list',
        {'type': type},
      );

  /// Get single integration by ID
  _i3.Future<_i15.Integration?> get(int id) =>
      caller.callServerEndpoint<_i15.Integration?>(
        'integration',
        'get',
        {'id': id},
      );

  /// Create new integration
  _i3.Future<_i15.Integration> create(_i15.Integration integration) =>
      caller.callServerEndpoint<_i15.Integration>(
        'integration',
        'create',
        {'integration': integration},
      );

  /// Update integration
  _i3.Future<_i15.Integration> update(_i15.Integration integration) =>
      caller.callServerEndpoint<_i15.Integration>(
        'integration',
        'update',
        {'integration': integration},
      );

  /// Delete integration
  _i3.Future<bool> delete(int id) => caller.callServerEndpoint<bool>(
    'integration',
    'delete',
    {'id': id},
  );

  /// Toggle integration enabled/disabled
  _i3.Future<_i15.Integration> toggleEnabled(
    int id,
    bool enabled,
  ) => caller.callServerEndpoint<_i15.Integration>(
    'integration',
    'toggleEnabled',
    {
      'id': id,
      'enabled': enabled,
    },
  );

  /// Test integration connection
  _i3.Future<Map<String, dynamic>> testConnection(int id) =>
      caller.callServerEndpoint<Map<String, dynamic>>(
        'integration',
        'testConnection',
        {'id': id},
      );

  /// Sync integration data
  _i3.Future<_i15.Integration> sync(int id) =>
      caller.callServerEndpoint<_i15.Integration>(
        'integration',
        'sync',
        {'id': id},
      );
}

/// {@category Endpoint}
class EndpointMarketplace extends _i2.EndpointRef {
  EndpointMarketplace(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'marketplace';

  /// Returns a list of available (but not necessarily installed) integrations.
  _i3.Future<List<Map<String, dynamic>>> listAvailableIntegrations() =>
      caller.callServerEndpoint<List<Map<String, dynamic>>>(
        'marketplace',
        'listAvailableIntegrations',
        {},
      );
}

/// {@category Endpoint}
class EndpointNotificationPreferences extends _i2.EndpointRef {
  EndpointNotificationPreferences(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'notificationPreferences';

  /// Get notification preferences for a user
  _i3.Future<List<_i16.NotificationPreference>> getForUser(int userId) =>
      caller.callServerEndpoint<List<_i16.NotificationPreference>>(
        'notificationPreferences',
        'getForUser',
        {'userId': userId},
      );

  /// Get or create a preference for a user and channel
  _i3.Future<_i16.NotificationPreference> getOrCreate(
    int userId,
    String channel,
  ) => caller.callServerEndpoint<_i16.NotificationPreference>(
    'notificationPreferences',
    'getOrCreate',
    {
      'userId': userId,
      'channel': channel,
    },
  );

  /// Update notification preference
  _i3.Future<_i16.NotificationPreference> update(
    _i16.NotificationPreference preference,
  ) => caller.callServerEndpoint<_i16.NotificationPreference>(
    'notificationPreferences',
    'update',
    {'preference': preference},
  );

  /// Toggle a preference enabled/disabled
  _i3.Future<_i16.NotificationPreference> toggleEnabled(
    int userId,
    String channel,
    bool enabled,
  ) => caller.callServerEndpoint<_i16.NotificationPreference>(
    'notificationPreferences',
    'toggleEnabled',
    {
      'userId': userId,
      'channel': channel,
      'enabled': enabled,
    },
  );

  /// Send test notification
  _i3.Future<Map<String, dynamic>> testNotification(
    int userId,
    String channel,
  ) => caller.callServerEndpoint<Map<String, dynamic>>(
    'notificationPreferences',
    'testNotification',
    {
      'userId': userId,
      'channel': channel,
    },
  );

  /// Get all available notification channels
  _i3.Future<List<String>> getAvailableChannels() =>
      caller.callServerEndpoint<List<String>>(
        'notificationPreferences',
        'getAvailableChannels',
        {},
      );
}

/// {@category Endpoint}
class EndpointOutgoingWebhook extends _i2.EndpointRef {
  EndpointOutgoingWebhook(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'outgoingWebhook';

  /// List all outgoing webhooks
  _i3.Future<List<_i17.OutgoingWebhook>> list() =>
      caller.callServerEndpoint<List<_i17.OutgoingWebhook>>(
        'outgoingWebhook',
        'list',
        {},
      );

  /// Create a new outgoing webhook
  _i3.Future<_i17.OutgoingWebhook> create(_i17.OutgoingWebhook webhook) =>
      caller.callServerEndpoint<_i17.OutgoingWebhook>(
        'outgoingWebhook',
        'create',
        {'webhook': webhook},
      );

  /// Update a webhook
  _i3.Future<_i17.OutgoingWebhook> update(_i17.OutgoingWebhook webhook) =>
      caller.callServerEndpoint<_i17.OutgoingWebhook>(
        'outgoingWebhook',
        'update',
        {'webhook': webhook},
      );

  /// Delete a webhook
  _i3.Future<bool> delete(int id) => caller.callServerEndpoint<bool>(
    'outgoingWebhook',
    'delete',
    {'id': id},
  );
}

/// {@category Endpoint}
class EndpointPlaybook extends _i2.EndpointRef {
  EndpointPlaybook(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'playbook';

  /// List all playbooks
  _i3.Future<List<_i18.Playbook>> list({_i19.PlaybookType? type}) =>
      caller.callServerEndpoint<List<_i18.Playbook>>(
        'playbook',
        'list',
        {'type': type},
      );

  /// Get playbook by ID
  _i3.Future<_i18.Playbook?> get(int id) =>
      caller.callServerEndpoint<_i18.Playbook?>(
        'playbook',
        'get',
        {'id': id},
      );

  /// Create playbook
  _i3.Future<_i18.Playbook> create(_i18.Playbook playbook) =>
      caller.callServerEndpoint<_i18.Playbook>(
        'playbook',
        'create',
        {'playbook': playbook},
      );

  /// Update playbook
  _i3.Future<_i18.Playbook> update(_i18.Playbook playbook) =>
      caller.callServerEndpoint<_i18.Playbook>(
        'playbook',
        'update',
        {'playbook': playbook},
      );

  /// Delete playbook
  _i3.Future<bool> delete(int id) => caller.callServerEndpoint<bool>(
    'playbook',
    'delete',
    {'id': id},
  );

  /// Trigger playbook execution for an incident
  _i3.Future<_i20.PlaybookExecution> execute(
    int playbookId,
    int incidentId,
    int initiatorId,
  ) => caller.callServerEndpoint<_i20.PlaybookExecution>(
    'playbook',
    'execute',
    {
      'playbookId': playbookId,
      'incidentId': incidentId,
      'initiatorId': initiatorId,
    },
  );

  /// Get execution status
  _i3.Future<_i20.PlaybookExecution?> getExecution(int executionId) =>
      caller.callServerEndpoint<_i20.PlaybookExecution?>(
        'playbook',
        'getExecution',
        {'executionId': executionId},
      );
}

/// {@category Endpoint}
class EndpointReport extends _i2.EndpointRef {
  EndpointReport(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'report';

  /// List all report snapshots
  _i3.Future<List<_i21.ReportSnapshot>> listSnapshots({
    int? incidentId,
    int? generatedById,
    int? limit,
    int? offset,
  }) => caller.callServerEndpoint<List<_i21.ReportSnapshot>>(
    'report',
    'listSnapshots',
    {
      'incidentId': incidentId,
      'generatedById': generatedById,
      'limit': limit,
      'offset': offset,
    },
  );

  /// Get a single report snapshot by ID
  _i3.Future<_i21.ReportSnapshot?> getSnapshot(int id) =>
      caller.callServerEndpoint<_i21.ReportSnapshot?>(
        'report',
        'getSnapshot',
        {'id': id},
      );

  /// Save a new report snapshot
  _i3.Future<_i21.ReportSnapshot> saveSnapshot(_i21.ReportSnapshot snapshot) =>
      caller.callServerEndpoint<_i21.ReportSnapshot>(
        'report',
        'saveSnapshot',
        {'snapshot': snapshot},
      );

  /// Delete a report snapshot
  _i3.Future<bool> deleteSnapshot(int id) => caller.callServerEndpoint<bool>(
    'report',
    'deleteSnapshot',
    {'id': id},
  );

  /// Generate an incident report
  _i3.Future<Map<String, dynamic>> generateIncidentReport({
    required DateTime from,
    required DateTime to,
    List<int>? serviceIds,
    List<_i13.IncidentSeverity>? severities,
  }) => caller.callServerEndpoint<Map<String, dynamic>>(
    'report',
    'generateIncidentReport',
    {
      'from': from,
      'to': to,
      'serviceIds': serviceIds,
      'severities': severities,
    },
  );

  /// Generate a service health report
  _i3.Future<Map<String, dynamic>> generateHealthReport({
    List<int>? serviceIds,
  }) => caller.callServerEndpoint<Map<String, dynamic>>(
    'report',
    'generateHealthReport',
    {'serviceIds': serviceIds},
  );

  /// Generate a system security & compliance report
  _i3.Future<Map<String, dynamic>> generateComplianceReport() =>
      caller.callServerEndpoint<Map<String, dynamic>>(
        'report',
        'generateComplianceReport',
        {},
      );

  /// Save a generated report as a snapshot
  _i3.Future<_i21.ReportSnapshot> saveGeneratedReport({
    required Map<String, dynamic> reportData,
    required int incidentId,
    required int generatedById,
  }) => caller.callServerEndpoint<_i21.ReportSnapshot>(
    'report',
    'saveGeneratedReport',
    {
      'reportData': reportData,
      'incidentId': incidentId,
      'generatedById': generatedById,
    },
  );
}

/// {@category Endpoint}
class EndpointRule extends _i2.EndpointRef {
  EndpointRule(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'rule';

  /// List all rules
  _i3.Future<List<_i22.Rule>> list() =>
      caller.callServerEndpoint<List<_i22.Rule>>(
        'rule',
        'list',
        {},
      );

  /// List rules for a service
  _i3.Future<List<_i22.Rule>> listForService(int serviceId) =>
      caller.callServerEndpoint<List<_i22.Rule>>(
        'rule',
        'listForService',
        {'serviceId': serviceId},
      );

  /// Get rule by ID
  _i3.Future<_i22.Rule?> get(int id) => caller.callServerEndpoint<_i22.Rule?>(
    'rule',
    'get',
    {'id': id},
  );

  /// Create rule
  _i3.Future<_i22.Rule> create(_i22.Rule rule) =>
      caller.callServerEndpoint<_i22.Rule>(
        'rule',
        'create',
        {'rule': rule},
      );

  /// Update rule
  _i3.Future<_i22.Rule> update(_i22.Rule rule) =>
      caller.callServerEndpoint<_i22.Rule>(
        'rule',
        'update',
        {'rule': rule},
      );

  /// Toggle rule enabled/disabled
  _i3.Future<_i22.Rule> toggleEnabled(
    int id,
    bool enabled,
  ) => caller.callServerEndpoint<_i22.Rule>(
    'rule',
    'toggleEnabled',
    {
      'id': id,
      'enabled': enabled,
    },
  );

  /// Delete rule
  _i3.Future<bool> delete(int id) => caller.callServerEndpoint<bool>(
    'rule',
    'delete',
    {'id': id},
  );
}

/// {@category Endpoint}
class EndpointSentinelApiKey extends _i2.EndpointRef {
  EndpointSentinelApiKey(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'sentinelApiKey';

  /// List all API keys for the current user (or all if SuperAdmin)
  _i3.Future<List<_i23.SentinelApiKey>> list() =>
      caller.callServerEndpoint<List<_i23.SentinelApiKey>>(
        'sentinelApiKey',
        'list',
        {},
      );

  /// Create a new scoped API key
  _i3.Future<String> create({
    required String name,
    required List<String> scopes,
    DateTime? expiresAt,
  }) => caller.callServerEndpoint<String>(
    'sentinelApiKey',
    'create',
    {
      'name': name,
      'scopes': scopes,
      'expiresAt': expiresAt,
    },
  );

  /// Delete an API key
  _i3.Future<bool> delete(int id) => caller.callServerEndpoint<bool>(
    'sentinelApiKey',
    'delete',
    {'id': id},
  );
}

/// {@category Endpoint}
class EndpointSentinelHealth extends _i2.EndpointRef {
  EndpointSentinelHealth(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'sentinelHealth';

  /// Internal health check for the Sentinel platform itself.
  _i3.Future<Map<String, dynamic>> getPlatformMetrics() =>
      caller.callServerEndpoint<Map<String, dynamic>>(
        'sentinelHealth',
        'getPlatformMetrics',
        {},
      );

  /// Verifies that all subsystems are responsive.
  _i3.Future<bool> ping() => caller.callServerEndpoint<bool>(
    'sentinelHealth',
    'ping',
    {},
  );
}

/// {@category Endpoint}
class EndpointService extends _i2.EndpointRef {
  EndpointService(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'service';

  /// Get all services with optional filtering
  _i3.Future<List<_i24.Service>> list({
    _i25.ServiceStatus? status,
    _i26.ServiceTier? tier,
  }) => caller.callServerEndpoint<List<_i24.Service>>(
    'service',
    'list',
    {
      'status': status,
      'tier': tier,
    },
  );

  /// Get a single service by ID with full relations
  _i3.Future<_i24.Service?> get(int id) =>
      caller.callServerEndpoint<_i24.Service?>(
        'service',
        'get',
        {'id': id},
      );

  /// Create a new service
  _i3.Future<_i24.Service> create(_i24.Service service) =>
      caller.callServerEndpoint<_i24.Service>(
        'service',
        'create',
        {'service': service},
      );

  /// Update an existing service
  _i3.Future<_i24.Service> update(_i24.Service service) =>
      caller.callServerEndpoint<_i24.Service>(
        'service',
        'update',
        {'service': service},
      );

  /// Delete a service
  _i3.Future<bool> delete(int id) => caller.callServerEndpoint<bool>(
    'service',
    'delete',
    {'id': id},
  );

  /// Get health status summary for dashboard
  _i3.Future<_i27.HealthSummary> getHealthSummary() =>
      caller.callServerEndpoint<_i27.HealthSummary>(
        'service',
        'getHealthSummary',
        {},
      );

  /// Get system metrics (uptime, latency, etc.)
  _i3.Future<_i28.SystemMetrics> getSystemMetrics() =>
      caller.callServerEndpoint<_i28.SystemMetrics>(
        'service',
        'getSystemMetrics',
        {},
      );
}

/// {@category Endpoint}
class EndpointSlo extends _i2.EndpointRef {
  EndpointSlo(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'slo';

  /// Get availability SLI for a service
  _i3.Future<Map<String, dynamic>> getAvailability(
    int serviceId, {
    required int days,
  }) => caller.callServerEndpoint<Map<String, dynamic>>(
    'slo',
    'getAvailability',
    {
      'serviceId': serviceId,
      'days': days,
    },
  );

  /// Get status of all SLOs for a service
  _i3.Future<List<Map<String, dynamic>>> getServiceSloStatus(int serviceId) =>
      caller.callServerEndpoint<List<Map<String, dynamic>>>(
        'slo',
        'getServiceSloStatus',
        {'serviceId': serviceId},
      );
}

/// Enhanced Streaming Endpoint
///
/// Handles real-time streaming for:
/// - Global service updates
/// - Incident rooms (per-incident collaboration)
/// - Playbook execution progress
/// - Service metrics (real-time charts)
/// - Service logs (live log streaming)
/// - AI insights (anomaly detection, predictions)
/// - Alerts (real-time notifications)
/// {@category Endpoint}
class EndpointStreaming extends _i2.EndpointRef {
  EndpointStreaming(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'streaming';
}

/// {@category Endpoint}
class EndpointSystemSettings extends _i2.EndpointRef {
  EndpointSystemSettings(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'systemSettings';

  /// List all system settings
  _i3.Future<List<_i29.SystemSetting>> list({String? category}) =>
      caller.callServerEndpoint<List<_i29.SystemSetting>>(
        'systemSettings',
        'list',
        {'category': category},
      );

  /// Get a single setting by key
  _i3.Future<_i29.SystemSetting?> getByKey(String key) =>
      caller.callServerEndpoint<_i29.SystemSetting?>(
        'systemSettings',
        'getByKey',
        {'key': key},
      );

  /// Get setting value by key (returns value string or null)
  _i3.Future<String?> getValue(String key) =>
      caller.callServerEndpoint<String?>(
        'systemSettings',
        'getValue',
        {'key': key},
      );

  /// Update or create a setting
  _i3.Future<_i29.SystemSetting> upsert(
    String key,
    String value, {
    String? description,
    required String category,
    required bool isSecret,
  }) => caller.callServerEndpoint<_i29.SystemSetting>(
    'systemSettings',
    'upsert',
    {
      'key': key,
      'value': value,
      'description': description,
      'category': category,
      'isSecret': isSecret,
    },
  );

  /// Delete a setting
  _i3.Future<bool> delete(String key) => caller.callServerEndpoint<bool>(
    'systemSettings',
    'delete',
    {'key': key},
  );

  /// Get all categories
  _i3.Future<List<String>> getCategories() =>
      caller.callServerEndpoint<List<String>>(
        'systemSettings',
        'getCategories',
        {},
      );

  /// Bulk update settings
  _i3.Future<List<_i29.SystemSetting>> bulkUpdate(
    List<_i29.SystemSetting> settings,
  ) => caller.callServerEndpoint<List<_i29.SystemSetting>>(
    'systemSettings',
    'bulkUpdate',
    {'settings': settings},
  );

  /// Get public settings (non-secret)
  _i3.Future<List<_i29.SystemSetting>> getPublic() =>
      caller.callServerEndpoint<List<_i29.SystemSetting>>(
        'systemSettings',
        'getPublic',
        {},
      );
}

/// {@category Endpoint}
class EndpointTelemetry extends _i2.EndpointRef {
  EndpointTelemetry(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'telemetry';

  /// Ingest health signal from agent
  _i3.Future<void> ingestSignal(
    int serviceId,
    _i30.TelemetrySignalPayload payload,
  ) => caller.callServerEndpoint<void>(
    'telemetry',
    'ingestSignal',
    {
      'serviceId': serviceId,
      'payload': payload,
    },
  );

  /// Ingest batch of signals
  _i3.Future<void> ingestBatch(
    int serviceId,
    _i31.TelemetrySignalBatch batch,
  ) => caller.callServerEndpoint<void>(
    'telemetry',
    'ingestBatch',
    {
      'serviceId': serviceId,
      'batch': batch,
    },
  );

  /// Record heartbeat from agent
  _i3.Future<void> heartbeat(
    int serviceId,
    _i32.TelemetryHeartbeat heartbeat,
  ) => caller.callServerEndpoint<void>(
    'telemetry',
    'heartbeat',
    {
      'serviceId': serviceId,
      'heartbeat': heartbeat,
    },
  );

  /// Get signals for a service
  _i3.Future<List<_i33.HealthSignal>> getSignals(int serviceId) =>
      caller.callServerEndpoint<List<_i33.HealthSignal>>(
        'telemetry',
        'getSignals',
        {'serviceId': serviceId},
      );

  /// Get historical metric points for a signal
  _i3.Future<List<_i34.MetricPoint>> getHistory(
    int signalId, {
    int? limit,
    DateTime? after,
  }) => caller.callServerEndpoint<List<_i34.MetricPoint>>(
    'telemetry',
    'getHistory',
    {
      'signalId': signalId,
      'limit': limit,
      'after': after,
    },
  );
}

/// {@category Endpoint}
class EndpointUser extends _i2.EndpointRef {
  EndpointUser(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'user';

  /// Get current authenticated user profile
  _i3.Future<_i35.TeamMember?> getCurrentUser() =>
      caller.callServerEndpoint<_i35.TeamMember?>(
        'user',
        'getCurrentUser',
        {},
      );

  /// Setup MFA for the current user
  _i3.Future<String> setupMfa() => caller.callServerEndpoint<String>(
    'user',
    'setupMfa',
    {},
  );

  /// Verify and enable MFA
  _i3.Future<bool> verifyAndEnableMfa(
    String secret,
    String code,
  ) => caller.callServerEndpoint<bool>(
    'user',
    'verifyAndEnableMfa',
    {
      'secret': secret,
      'code': code,
    },
  );

  /// List team members
  _i3.Future<List<_i35.TeamMember>> listTeamMembers() =>
      caller.callServerEndpoint<List<_i35.TeamMember>>(
        'user',
        'listTeamMembers',
        {},
      );

  /// Get user by ID
  _i3.Future<_i35.TeamMember?> get(int id) =>
      caller.callServerEndpoint<_i35.TeamMember?>(
        'user',
        'get',
        {'id': id},
      );

  /// Update user profile
  _i3.Future<_i36.OpsUser> update(_i36.OpsUser user) =>
      caller.callServerEndpoint<_i36.OpsUser>(
        'user',
        'update',
        {'user': user},
      );

  /// Assign role to user
  _i3.Future<_i37.UserRole> assignRole(
    int userId,
    int roleId,
  ) => caller.callServerEndpoint<_i37.UserRole>(
    'user',
    'assignRole',
    {
      'userId': userId,
      'roleId': roleId,
    },
  );

  /// Remove role from user
  _i3.Future<bool> removeRole(
    int userId,
    int roleId,
  ) => caller.callServerEndpoint<bool>(
    'user',
    'removeRole',
    {
      'userId': userId,
      'roleId': roleId,
    },
  );
}

/// This is an example endpoint that returns a greeting message through
/// its [hello] method.
/// {@category Endpoint}
class EndpointGreeting extends _i2.EndpointRef {
  EndpointGreeting(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'greeting';

  /// Returns a personalized greeting message: "Hello {name}".
  _i3.Future<_i38.Greeting> hello(String name) =>
      caller.callServerEndpoint<_i38.Greeting>(
        'greeting',
        'hello',
        {'name': name},
      );
}

class Modules {
  Modules(Client client) {
    serverpod_auth_idp = _i1.Caller(client);
    auth = _i39.Caller(client);
    serverpod_auth_core = _i4.Caller(client);
  }

  late final _i1.Caller serverpod_auth_idp;

  late final _i39.Caller auth;

  late final _i4.Caller serverpod_auth_core;
}

class Client extends _i2.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    @Deprecated(
      'Use authKeyProvider instead. This will be removed in future releases.',
    )
    super.authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i2.MethodCallContext,
      Object,
      StackTrace,
    )?
    onFailedCall,
    Function(_i2.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
         host,
         _i40.Protocol(),
         securityContext: securityContext,
         streamingConnectionTimeout: streamingConnectionTimeout,
         connectionTimeout: connectionTimeout,
         onFailedCall: onFailedCall,
         onSucceededCall: onSucceededCall,
         disconnectStreamsOnLostInternetConnection:
             disconnectStreamsOnLostInternetConnection,
       ) {
    emailIdp = EndpointEmailIdp(this);
    jwtRefresh = EndpointJwtRefresh(this);
    agent = EndpointAgent(this);
    aiInsights = EndpointAiInsights(this);
    alert = EndpointAlert(this);
    auditLog = EndpointAuditLog(this);
    environment = EndpointEnvironment(this);
    health = EndpointHealth(this);
    incident = EndpointIncident(this);
    integration = EndpointIntegration(this);
    marketplace = EndpointMarketplace(this);
    notificationPreferences = EndpointNotificationPreferences(this);
    outgoingWebhook = EndpointOutgoingWebhook(this);
    playbook = EndpointPlaybook(this);
    report = EndpointReport(this);
    rule = EndpointRule(this);
    sentinelApiKey = EndpointSentinelApiKey(this);
    sentinelHealth = EndpointSentinelHealth(this);
    service = EndpointService(this);
    slo = EndpointSlo(this);
    streaming = EndpointStreaming(this);
    systemSettings = EndpointSystemSettings(this);
    telemetry = EndpointTelemetry(this);
    user = EndpointUser(this);
    greeting = EndpointGreeting(this);
    modules = Modules(this);
  }

  late final EndpointEmailIdp emailIdp;

  late final EndpointJwtRefresh jwtRefresh;

  late final EndpointAgent agent;

  late final EndpointAiInsights aiInsights;

  late final EndpointAlert alert;

  late final EndpointAuditLog auditLog;

  late final EndpointEnvironment environment;

  late final EndpointHealth health;

  late final EndpointIncident incident;

  late final EndpointIntegration integration;

  late final EndpointMarketplace marketplace;

  late final EndpointNotificationPreferences notificationPreferences;

  late final EndpointOutgoingWebhook outgoingWebhook;

  late final EndpointPlaybook playbook;

  late final EndpointReport report;

  late final EndpointRule rule;

  late final EndpointSentinelApiKey sentinelApiKey;

  late final EndpointSentinelHealth sentinelHealth;

  late final EndpointService service;

  late final EndpointSlo slo;

  late final EndpointStreaming streaming;

  late final EndpointSystemSettings systemSettings;

  late final EndpointTelemetry telemetry;

  late final EndpointUser user;

  late final EndpointGreeting greeting;

  late final Modules modules;

  @override
  Map<String, _i2.EndpointRef> get endpointRefLookup => {
    'emailIdp': emailIdp,
    'jwtRefresh': jwtRefresh,
    'agent': agent,
    'aiInsights': aiInsights,
    'alert': alert,
    'auditLog': auditLog,
    'environment': environment,
    'health': health,
    'incident': incident,
    'integration': integration,
    'marketplace': marketplace,
    'notificationPreferences': notificationPreferences,
    'outgoingWebhook': outgoingWebhook,
    'playbook': playbook,
    'report': report,
    'rule': rule,
    'sentinelApiKey': sentinelApiKey,
    'sentinelHealth': sentinelHealth,
    'service': service,
    'slo': slo,
    'streaming': streaming,
    'systemSettings': systemSettings,
    'telemetry': telemetry,
    'user': user,
    'greeting': greeting,
  };

  @override
  Map<String, _i2.ModuleEndpointCaller> get moduleLookup => {
    'serverpod_auth_idp': modules.serverpod_auth_idp,
    'auth': modules.auth,
    'serverpod_auth_core': modules.serverpod_auth_core,
  };
}
