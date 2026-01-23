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
import 'package:serverpod/serverpod.dart' as _i1;
import '../auth/email_idp_endpoint.dart' as _i2;
import '../auth/jwt_refresh_endpoint.dart' as _i3;
import '../endpoints/agent_endpoint.dart' as _i4;
import '../endpoints/ai_insights_endpoint.dart' as _i5;
import '../endpoints/alert_endpoint.dart' as _i6;
import '../endpoints/audit_log_endpoint.dart' as _i7;
import '../endpoints/environment_endpoint.dart' as _i8;
import '../endpoints/health_endpoint.dart' as _i9;
import '../endpoints/incident_endpoint.dart' as _i10;
import '../endpoints/integration_endpoint.dart' as _i11;
import '../endpoints/notification_preferences_endpoint.dart' as _i12;
import '../endpoints/playbook_endpoint.dart' as _i13;
import '../endpoints/report_endpoint.dart' as _i14;
import '../endpoints/rule_endpoint.dart' as _i15;
import '../endpoints/service_endpoint.dart' as _i16;
import '../endpoints/streaming_endpoint.dart' as _i17;
import '../endpoints/system_settings_endpoint.dart' as _i18;
import '../endpoints/telemetry_endpoint.dart' as _i19;
import '../endpoints/user_endpoint.dart' as _i20;
import '../greetings/greeting_endpoint.dart' as _i21;
import 'package:serverpod_sentinel_server/src/generated/agent/agent_task_status.dart'
    as _i22;
import 'package:serverpod_sentinel_server/src/generated/security/audit_log.dart'
    as _i23;
import 'package:serverpod_sentinel_server/src/generated/settings/environment.dart'
    as _i24;
import 'package:serverpod_sentinel_server/src/generated/enums/incident_status.dart'
    as _i25;
import 'package:serverpod_sentinel_server/src/generated/enums/incident_severity.dart'
    as _i26;
import 'package:serverpod_sentinel_server/src/generated/incident/incident_timeline_item.dart'
    as _i27;
import 'package:serverpod_sentinel_server/src/generated/incident/incident.dart'
    as _i28;
import 'package:serverpod_sentinel_server/src/generated/settings/integration.dart'
    as _i29;
import 'package:serverpod_sentinel_server/src/generated/settings/notification_preference.dart'
    as _i30;
import 'package:serverpod_sentinel_server/src/generated/enums/playbook_type.dart'
    as _i31;
import 'package:serverpod_sentinel_server/src/generated/automation/playbook.dart'
    as _i32;
import 'package:serverpod_sentinel_server/src/generated/reporting/report_snapshot.dart'
    as _i33;
import 'package:serverpod_sentinel_server/src/generated/service/rule.dart'
    as _i34;
import 'package:serverpod_sentinel_server/src/generated/enums/service_status.dart'
    as _i35;
import 'package:serverpod_sentinel_server/src/generated/enums/service_tier.dart'
    as _i36;
import 'package:serverpod_sentinel_server/src/generated/service/service.dart'
    as _i37;
import 'package:serverpod_sentinel_server/src/generated/settings/system_setting.dart'
    as _i38;
import 'package:serverpod_sentinel_server/src/generated/telemetry/telemetry_signal_payload.dart'
    as _i39;
import 'package:serverpod_sentinel_server/src/generated/telemetry/telemetry_signal_batch.dart'
    as _i40;
import 'package:serverpod_sentinel_server/src/generated/telemetry/telemetry_heartbeat.dart'
    as _i41;
import 'package:serverpod_sentinel_server/src/generated/security/ops_user.dart'
    as _i42;
import 'package:serverpod_auth_idp_server/serverpod_auth_idp_server.dart'
    as _i43;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i44;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _i45;
import 'package:serverpod_sentinel_server/src/generated/future_calls.dart'
    as _i46;
export 'future_calls.dart' show ServerpodFutureCallsGetter;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'emailIdp': _i2.EmailIdpEndpoint()
        ..initialize(
          server,
          'emailIdp',
          null,
        ),
      'jwtRefresh': _i3.JwtRefreshEndpoint()
        ..initialize(
          server,
          'jwtRefresh',
          null,
        ),
      'agent': _i4.AgentEndpoint()
        ..initialize(
          server,
          'agent',
          null,
        ),
      'aiInsights': _i5.AiInsightsEndpoint()
        ..initialize(
          server,
          'aiInsights',
          null,
        ),
      'alert': _i6.AlertEndpoint()
        ..initialize(
          server,
          'alert',
          null,
        ),
      'auditLog': _i7.AuditLogEndpoint()
        ..initialize(
          server,
          'auditLog',
          null,
        ),
      'environment': _i8.EnvironmentEndpoint()
        ..initialize(
          server,
          'environment',
          null,
        ),
      'health': _i9.HealthEndpoint()
        ..initialize(
          server,
          'health',
          null,
        ),
      'incident': _i10.IncidentEndpoint()
        ..initialize(
          server,
          'incident',
          null,
        ),
      'integration': _i11.IntegrationEndpoint()
        ..initialize(
          server,
          'integration',
          null,
        ),
      'notificationPreferences': _i12.NotificationPreferencesEndpoint()
        ..initialize(
          server,
          'notificationPreferences',
          null,
        ),
      'playbook': _i13.PlaybookEndpoint()
        ..initialize(
          server,
          'playbook',
          null,
        ),
      'report': _i14.ReportEndpoint()
        ..initialize(
          server,
          'report',
          null,
        ),
      'rule': _i15.RuleEndpoint()
        ..initialize(
          server,
          'rule',
          null,
        ),
      'service': _i16.ServiceEndpoint()
        ..initialize(
          server,
          'service',
          null,
        ),
      'streaming': _i17.StreamingEndpoint()
        ..initialize(
          server,
          'streaming',
          null,
        ),
      'systemSettings': _i18.SystemSettingsEndpoint()
        ..initialize(
          server,
          'systemSettings',
          null,
        ),
      'telemetry': _i19.TelemetryEndpoint()
        ..initialize(
          server,
          'telemetry',
          null,
        ),
      'user': _i20.UserEndpoint()
        ..initialize(
          server,
          'user',
          null,
        ),
      'greeting': _i21.GreetingEndpoint()
        ..initialize(
          server,
          'greeting',
          null,
        ),
    };
    connectors['emailIdp'] = _i1.EndpointConnector(
      name: 'emailIdp',
      endpoint: endpoints['emailIdp']!,
      methodConnectors: {
        'login': _i1.MethodConnector(
          name: 'login',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i2.EmailIdpEndpoint).login(
                session,
                email: params['email'],
                password: params['password'],
              ),
        ),
        'startRegistration': _i1.MethodConnector(
          name: 'startRegistration',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i2.EmailIdpEndpoint)
                  .startRegistration(
                    session,
                    email: params['email'],
                  ),
        ),
        'verifyRegistrationCode': _i1.MethodConnector(
          name: 'verifyRegistrationCode',
          params: {
            'accountRequestId': _i1.ParameterDescription(
              name: 'accountRequestId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'verificationCode': _i1.ParameterDescription(
              name: 'verificationCode',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i2.EmailIdpEndpoint)
                  .verifyRegistrationCode(
                    session,
                    accountRequestId: params['accountRequestId'],
                    verificationCode: params['verificationCode'],
                  ),
        ),
        'finishRegistration': _i1.MethodConnector(
          name: 'finishRegistration',
          params: {
            'registrationToken': _i1.ParameterDescription(
              name: 'registrationToken',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i2.EmailIdpEndpoint)
                  .finishRegistration(
                    session,
                    registrationToken: params['registrationToken'],
                    password: params['password'],
                  ),
        ),
        'startPasswordReset': _i1.MethodConnector(
          name: 'startPasswordReset',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i2.EmailIdpEndpoint)
                  .startPasswordReset(
                    session,
                    email: params['email'],
                  ),
        ),
        'verifyPasswordResetCode': _i1.MethodConnector(
          name: 'verifyPasswordResetCode',
          params: {
            'passwordResetRequestId': _i1.ParameterDescription(
              name: 'passwordResetRequestId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'verificationCode': _i1.ParameterDescription(
              name: 'verificationCode',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i2.EmailIdpEndpoint)
                  .verifyPasswordResetCode(
                    session,
                    passwordResetRequestId: params['passwordResetRequestId'],
                    verificationCode: params['verificationCode'],
                  ),
        ),
        'finishPasswordReset': _i1.MethodConnector(
          name: 'finishPasswordReset',
          params: {
            'finishPasswordResetToken': _i1.ParameterDescription(
              name: 'finishPasswordResetToken',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'newPassword': _i1.ParameterDescription(
              name: 'newPassword',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i2.EmailIdpEndpoint)
                  .finishPasswordReset(
                    session,
                    finishPasswordResetToken:
                        params['finishPasswordResetToken'],
                    newPassword: params['newPassword'],
                  ),
        ),
      },
    );
    connectors['jwtRefresh'] = _i1.EndpointConnector(
      name: 'jwtRefresh',
      endpoint: endpoints['jwtRefresh']!,
      methodConnectors: {
        'refreshAccessToken': _i1.MethodConnector(
          name: 'refreshAccessToken',
          params: {
            'refreshToken': _i1.ParameterDescription(
              name: 'refreshToken',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['jwtRefresh'] as _i3.JwtRefreshEndpoint)
                  .refreshAccessToken(
                    session,
                    refreshToken: params['refreshToken'],
                  ),
        ),
      },
    );
    connectors['agent'] = _i1.EndpointConnector(
      name: 'agent',
      endpoint: endpoints['agent']!,
      methodConnectors: {
        'pollTask': _i1.MethodConnector(
          name: 'pollTask',
          params: {
            'serviceId': _i1.ParameterDescription(
              name: 'serviceId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['agent'] as _i4.AgentEndpoint).pollTask(
                session,
                params['serviceId'],
              ),
        ),
        'updateTaskStatus': _i1.MethodConnector(
          name: 'updateTaskStatus',
          params: {
            'taskId': _i1.ParameterDescription(
              name: 'taskId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'status': _i1.ParameterDescription(
              name: 'status',
              type: _i1.getType<_i22.AgentTaskStatus>(),
              nullable: false,
            ),
            'output': _i1.ParameterDescription(
              name: 'output',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'exitCode': _i1.ParameterDescription(
              name: 'exitCode',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['agent'] as _i4.AgentEndpoint).updateTaskStatus(
                    session,
                    params['taskId'],
                    params['status'],
                    output: params['output'],
                    exitCode: params['exitCode'],
                  ),
        ),
        'createTask': _i1.MethodConnector(
          name: 'createTask',
          params: {
            'serviceId': _i1.ParameterDescription(
              name: 'serviceId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'command': _i1.ParameterDescription(
              name: 'command',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'arguments': _i1.ParameterDescription(
              name: 'arguments',
              type: _i1.getType<List<String>?>(),
              nullable: true,
            ),
            'timeoutSeconds': _i1.ParameterDescription(
              name: 'timeoutSeconds',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['agent'] as _i4.AgentEndpoint).createTask(
                session,
                params['serviceId'],
                params['command'],
                arguments: params['arguments'],
                timeoutSeconds: params['timeoutSeconds'],
              ),
        ),
      },
    );
    connectors['aiInsights'] = _i1.EndpointConnector(
      name: 'aiInsights',
      endpoint: endpoints['aiInsights']!,
      methodConnectors: {
        'getInsights': _i1.MethodConnector(
          name: 'getInsights',
          params: {
            'serviceId': _i1.ParameterDescription(
              name: 'serviceId',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
            'type': _i1.ParameterDescription(
              name: 'type',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['aiInsights'] as _i5.AiInsightsEndpoint)
                  .getInsights(
                    session,
                    serviceId: params['serviceId'],
                    type: params['type'],
                    limit: params['limit'],
                  ),
        ),
        'analyzeIncident': _i1.MethodConnector(
          name: 'analyzeIncident',
          params: {
            'incidentId': _i1.ParameterDescription(
              name: 'incidentId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['aiInsights'] as _i5.AiInsightsEndpoint)
                  .analyzeIncident(
                    session,
                    params['incidentId'],
                  ),
        ),
        'suggestActions': _i1.MethodConnector(
          name: 'suggestActions',
          params: {
            'incidentId': _i1.ParameterDescription(
              name: 'incidentId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['aiInsights'] as _i5.AiInsightsEndpoint)
                  .suggestActions(
                    session,
                    params['incidentId'],
                  ),
        ),
        'predictServiceHealth': _i1.MethodConnector(
          name: 'predictServiceHealth',
          params: {
            'serviceId': _i1.ParameterDescription(
              name: 'serviceId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['aiInsights'] as _i5.AiInsightsEndpoint)
                  .predictServiceHealth(
                    session,
                    params['serviceId'],
                  ),
        ),
        'trainModel': _i1.MethodConnector(
          name: 'trainModel',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['aiInsights'] as _i5.AiInsightsEndpoint)
                  .trainModel(session),
        ),
        'getInsightTypes': _i1.MethodConnector(
          name: 'getInsightTypes',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['aiInsights'] as _i5.AiInsightsEndpoint)
                  .getInsightTypes(session),
        ),
      },
    );
    connectors['alert'] = _i1.EndpointConnector(
      name: 'alert',
      endpoint: endpoints['alert']!,
      methodConnectors: {
        'getRecent': _i1.MethodConnector(
          name: 'getRecent',
          params: {
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'severity': _i1.ParameterDescription(
              name: 'severity',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['alert'] as _i6.AlertEndpoint).getRecent(
                session,
                limit: params['limit'],
                severity: params['severity'],
              ),
        ),
      },
    );
    connectors['auditLog'] = _i1.EndpointConnector(
      name: 'auditLog',
      endpoint: endpoints['auditLog']!,
      methodConnectors: {
        'list': _i1.MethodConnector(
          name: 'list',
          params: {
            'actorId': _i1.ParameterDescription(
              name: 'actorId',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
            'action': _i1.ParameterDescription(
              name: 'action',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'entityType': _i1.ParameterDescription(
              name: 'entityType',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'from': _i1.ParameterDescription(
              name: 'from',
              type: _i1.getType<DateTime?>(),
              nullable: true,
            ),
            'to': _i1.ParameterDescription(
              name: 'to',
              type: _i1.getType<DateTime?>(),
              nullable: true,
            ),
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
            'offset': _i1.ParameterDescription(
              name: 'offset',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['auditLog'] as _i7.AuditLogEndpoint).list(
                session,
                actorId: params['actorId'],
                action: params['action'],
                entityType: params['entityType'],
                from: params['from'],
                to: params['to'],
                limit: params['limit'],
                offset: params['offset'],
              ),
        ),
        'get': _i1.MethodConnector(
          name: 'get',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['auditLog'] as _i7.AuditLogEndpoint).get(
                session,
                params['id'],
              ),
        ),
        'getForEntity': _i1.MethodConnector(
          name: 'getForEntity',
          params: {
            'entityType': _i1.ParameterDescription(
              name: 'entityType',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['auditLog'] as _i7.AuditLogEndpoint).getForEntity(
                    session,
                    params['entityType'],
                    params['entityId'],
                  ),
        ),
        'getActionTypes': _i1.MethodConnector(
          name: 'getActionTypes',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['auditLog'] as _i7.AuditLogEndpoint)
                  .getActionTypes(session),
        ),
        'getEntityTypes': _i1.MethodConnector(
          name: 'getEntityTypes',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['auditLog'] as _i7.AuditLogEndpoint)
                  .getEntityTypes(session),
        ),
        'create': _i1.MethodConnector(
          name: 'create',
          params: {
            'log': _i1.ParameterDescription(
              name: 'log',
              type: _i1.getType<_i23.AuditLog>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['auditLog'] as _i7.AuditLogEndpoint).create(
                session,
                params['log'],
              ),
        ),
      },
    );
    connectors['environment'] = _i1.EndpointConnector(
      name: 'environment',
      endpoint: endpoints['environment']!,
      methodConnectors: {
        'list': _i1.MethodConnector(
          name: 'list',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['environment'] as _i8.EnvironmentEndpoint)
                  .list(session),
        ),
        'get': _i1.MethodConnector(
          name: 'get',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['environment'] as _i8.EnvironmentEndpoint).get(
                    session,
                    params['id'],
                  ),
        ),
        'create': _i1.MethodConnector(
          name: 'create',
          params: {
            'environment': _i1.ParameterDescription(
              name: 'environment',
              type: _i1.getType<_i24.Environment>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['environment'] as _i8.EnvironmentEndpoint).create(
                    session,
                    params['environment'],
                  ),
        ),
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'environment': _i1.ParameterDescription(
              name: 'environment',
              type: _i1.getType<_i24.Environment>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['environment'] as _i8.EnvironmentEndpoint).update(
                    session,
                    params['environment'],
                  ),
        ),
        'delete': _i1.MethodConnector(
          name: 'delete',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['environment'] as _i8.EnvironmentEndpoint).delete(
                    session,
                    params['id'],
                  ),
        ),
        'getActive': _i1.MethodConnector(
          name: 'getActive',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['environment'] as _i8.EnvironmentEndpoint)
                  .getActive(session),
        ),
        'setActive': _i1.MethodConnector(
          name: 'setActive',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['environment'] as _i8.EnvironmentEndpoint)
                  .setActive(
                    session,
                    params['id'],
                  ),
        ),
      },
    );
    connectors['health'] = _i1.EndpointConnector(
      name: 'health',
      endpoint: endpoints['health']!,
      methodConnectors: {
        'ping': _i1.MethodConnector(
          name: 'ping',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['health'] as _i9.HealthEndpoint).ping(session),
        ),
        'check': _i1.MethodConnector(
          name: 'check',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['health'] as _i9.HealthEndpoint).check(session),
        ),
        'ready': _i1.MethodConnector(
          name: 'ready',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['health'] as _i9.HealthEndpoint).ready(session),
        ),
        'live': _i1.MethodConnector(
          name: 'live',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['health'] as _i9.HealthEndpoint).live(session),
        ),
      },
    );
    connectors['incident'] = _i1.EndpointConnector(
      name: 'incident',
      endpoint: endpoints['incident']!,
      methodConnectors: {
        'list': _i1.MethodConnector(
          name: 'list',
          params: {
            'status': _i1.ParameterDescription(
              name: 'status',
              type: _i1.getType<_i25.IncidentStatus?>(),
              nullable: true,
            ),
            'severity': _i1.ParameterDescription(
              name: 'severity',
              type: _i1.getType<_i26.IncidentSeverity?>(),
              nullable: true,
            ),
            'serviceId': _i1.ParameterDescription(
              name: 'serviceId',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
            'offset': _i1.ParameterDescription(
              name: 'offset',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['incident'] as _i10.IncidentEndpoint).list(
                session,
                status: params['status'],
                severity: params['severity'],
                serviceId: params['serviceId'],
                limit: params['limit'],
                offset: params['offset'],
              ),
        ),
        'get': _i1.MethodConnector(
          name: 'get',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['incident'] as _i10.IncidentEndpoint).get(
                session,
                params['id'],
              ),
        ),
        'updateStatus': _i1.MethodConnector(
          name: 'updateStatus',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'status': _i1.ParameterDescription(
              name: 'status',
              type: _i1.getType<_i25.IncidentStatus>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['incident'] as _i10.IncidentEndpoint).updateStatus(
                    session,
                    params['id'],
                    params['status'],
                  ),
        ),
        'assignCommander': _i1.MethodConnector(
          name: 'assignCommander',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'commanderId': _i1.ParameterDescription(
              name: 'commanderId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['incident'] as _i10.IncidentEndpoint)
                  .assignCommander(
                    session,
                    params['id'],
                    params['commanderId'],
                  ),
        ),
        'addTimelineItem': _i1.MethodConnector(
          name: 'addTimelineItem',
          params: {
            'item': _i1.ParameterDescription(
              name: 'item',
              type: _i1.getType<_i27.IncidentTimelineItem>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['incident'] as _i10.IncidentEndpoint)
                  .addTimelineItem(
                    session,
                    params['item'],
                  ),
        ),
        'getStats': _i1.MethodConnector(
          name: 'getStats',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['incident'] as _i10.IncidentEndpoint)
                  .getStats(session),
        ),
        'create': _i1.MethodConnector(
          name: 'create',
          params: {
            'incident': _i1.ParameterDescription(
              name: 'incident',
              type: _i1.getType<_i28.Incident>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['incident'] as _i10.IncidentEndpoint).create(
                    session,
                    params['incident'],
                  ),
        ),
        'close': _i1.MethodConnector(
          name: 'close',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['incident'] as _i10.IncidentEndpoint).close(
                session,
                params['id'],
              ),
        ),
        'acknowledge': _i1.MethodConnector(
          name: 'acknowledge',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['incident'] as _i10.IncidentEndpoint).acknowledge(
                    session,
                    params['id'],
                    params['userId'],
                  ),
        ),
        'acknowledgeAll': _i1.MethodConnector(
          name: 'acknowledgeAll',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['incident'] as _i10.IncidentEndpoint)
                  .acknowledgeAll(
                    session,
                    params['userId'],
                  ),
        ),
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'incident': _i1.ParameterDescription(
              name: 'incident',
              type: _i1.getType<_i28.Incident>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['incident'] as _i10.IncidentEndpoint).update(
                    session,
                    params['incident'],
                  ),
        ),
        'delete': _i1.MethodConnector(
          name: 'delete',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['incident'] as _i10.IncidentEndpoint).delete(
                    session,
                    params['id'],
                  ),
        ),
      },
    );
    connectors['integration'] = _i1.EndpointConnector(
      name: 'integration',
      endpoint: endpoints['integration']!,
      methodConnectors: {
        'list': _i1.MethodConnector(
          name: 'list',
          params: {
            'type': _i1.ParameterDescription(
              name: 'type',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['integration'] as _i11.IntegrationEndpoint).list(
                    session,
                    type: params['type'],
                  ),
        ),
        'get': _i1.MethodConnector(
          name: 'get',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['integration'] as _i11.IntegrationEndpoint).get(
                    session,
                    params['id'],
                  ),
        ),
        'create': _i1.MethodConnector(
          name: 'create',
          params: {
            'integration': _i1.ParameterDescription(
              name: 'integration',
              type: _i1.getType<_i29.Integration>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['integration'] as _i11.IntegrationEndpoint).create(
                    session,
                    params['integration'],
                  ),
        ),
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'integration': _i1.ParameterDescription(
              name: 'integration',
              type: _i1.getType<_i29.Integration>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['integration'] as _i11.IntegrationEndpoint).update(
                    session,
                    params['integration'],
                  ),
        ),
        'delete': _i1.MethodConnector(
          name: 'delete',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['integration'] as _i11.IntegrationEndpoint).delete(
                    session,
                    params['id'],
                  ),
        ),
        'toggleEnabled': _i1.MethodConnector(
          name: 'toggleEnabled',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'enabled': _i1.ParameterDescription(
              name: 'enabled',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['integration'] as _i11.IntegrationEndpoint)
                  .toggleEnabled(
                    session,
                    params['id'],
                    params['enabled'],
                  ),
        ),
        'testConnection': _i1.MethodConnector(
          name: 'testConnection',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['integration'] as _i11.IntegrationEndpoint)
                  .testConnection(
                    session,
                    params['id'],
                  ),
        ),
        'sync': _i1.MethodConnector(
          name: 'sync',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['integration'] as _i11.IntegrationEndpoint).sync(
                    session,
                    params['id'],
                  ),
        ),
      },
    );
    connectors['notificationPreferences'] = _i1.EndpointConnector(
      name: 'notificationPreferences',
      endpoint: endpoints['notificationPreferences']!,
      methodConnectors: {
        'getForUser': _i1.MethodConnector(
          name: 'getForUser',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['notificationPreferences']
                          as _i12.NotificationPreferencesEndpoint)
                      .getForUser(
                        session,
                        params['userId'],
                      ),
        ),
        'getOrCreate': _i1.MethodConnector(
          name: 'getOrCreate',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'channel': _i1.ParameterDescription(
              name: 'channel',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['notificationPreferences']
                          as _i12.NotificationPreferencesEndpoint)
                      .getOrCreate(
                        session,
                        params['userId'],
                        params['channel'],
                      ),
        ),
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'preference': _i1.ParameterDescription(
              name: 'preference',
              type: _i1.getType<_i30.NotificationPreference>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['notificationPreferences']
                          as _i12.NotificationPreferencesEndpoint)
                      .update(
                        session,
                        params['preference'],
                      ),
        ),
        'toggleEnabled': _i1.MethodConnector(
          name: 'toggleEnabled',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'channel': _i1.ParameterDescription(
              name: 'channel',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'enabled': _i1.ParameterDescription(
              name: 'enabled',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['notificationPreferences']
                          as _i12.NotificationPreferencesEndpoint)
                      .toggleEnabled(
                        session,
                        params['userId'],
                        params['channel'],
                        params['enabled'],
                      ),
        ),
        'testNotification': _i1.MethodConnector(
          name: 'testNotification',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'channel': _i1.ParameterDescription(
              name: 'channel',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['notificationPreferences']
                          as _i12.NotificationPreferencesEndpoint)
                      .testNotification(
                        session,
                        params['userId'],
                        params['channel'],
                      ),
        ),
        'getAvailableChannels': _i1.MethodConnector(
          name: 'getAvailableChannels',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['notificationPreferences']
                          as _i12.NotificationPreferencesEndpoint)
                      .getAvailableChannels(session),
        ),
      },
    );
    connectors['playbook'] = _i1.EndpointConnector(
      name: 'playbook',
      endpoint: endpoints['playbook']!,
      methodConnectors: {
        'list': _i1.MethodConnector(
          name: 'list',
          params: {
            'type': _i1.ParameterDescription(
              name: 'type',
              type: _i1.getType<_i31.PlaybookType?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['playbook'] as _i13.PlaybookEndpoint).list(
                session,
                type: params['type'],
              ),
        ),
        'get': _i1.MethodConnector(
          name: 'get',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['playbook'] as _i13.PlaybookEndpoint).get(
                session,
                params['id'],
              ),
        ),
        'create': _i1.MethodConnector(
          name: 'create',
          params: {
            'playbook': _i1.ParameterDescription(
              name: 'playbook',
              type: _i1.getType<_i32.Playbook>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['playbook'] as _i13.PlaybookEndpoint).create(
                    session,
                    params['playbook'],
                  ),
        ),
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'playbook': _i1.ParameterDescription(
              name: 'playbook',
              type: _i1.getType<_i32.Playbook>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['playbook'] as _i13.PlaybookEndpoint).update(
                    session,
                    params['playbook'],
                  ),
        ),
        'delete': _i1.MethodConnector(
          name: 'delete',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['playbook'] as _i13.PlaybookEndpoint).delete(
                    session,
                    params['id'],
                  ),
        ),
        'execute': _i1.MethodConnector(
          name: 'execute',
          params: {
            'playbookId': _i1.ParameterDescription(
              name: 'playbookId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'incidentId': _i1.ParameterDescription(
              name: 'incidentId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'initiatorId': _i1.ParameterDescription(
              name: 'initiatorId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['playbook'] as _i13.PlaybookEndpoint).execute(
                    session,
                    params['playbookId'],
                    params['incidentId'],
                    params['initiatorId'],
                  ),
        ),
        'getExecution': _i1.MethodConnector(
          name: 'getExecution',
          params: {
            'executionId': _i1.ParameterDescription(
              name: 'executionId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['playbook'] as _i13.PlaybookEndpoint).getExecution(
                    session,
                    params['executionId'],
                  ),
        ),
      },
    );
    connectors['report'] = _i1.EndpointConnector(
      name: 'report',
      endpoint: endpoints['report']!,
      methodConnectors: {
        'listSnapshots': _i1.MethodConnector(
          name: 'listSnapshots',
          params: {
            'incidentId': _i1.ParameterDescription(
              name: 'incidentId',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
            'generatedById': _i1.ParameterDescription(
              name: 'generatedById',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
            'offset': _i1.ParameterDescription(
              name: 'offset',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['report'] as _i14.ReportEndpoint).listSnapshots(
                    session,
                    incidentId: params['incidentId'],
                    generatedById: params['generatedById'],
                    limit: params['limit'],
                    offset: params['offset'],
                  ),
        ),
        'getSnapshot': _i1.MethodConnector(
          name: 'getSnapshot',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['report'] as _i14.ReportEndpoint).getSnapshot(
                    session,
                    params['id'],
                  ),
        ),
        'saveSnapshot': _i1.MethodConnector(
          name: 'saveSnapshot',
          params: {
            'snapshot': _i1.ParameterDescription(
              name: 'snapshot',
              type: _i1.getType<_i33.ReportSnapshot>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['report'] as _i14.ReportEndpoint).saveSnapshot(
                    session,
                    params['snapshot'],
                  ),
        ),
        'deleteSnapshot': _i1.MethodConnector(
          name: 'deleteSnapshot',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['report'] as _i14.ReportEndpoint).deleteSnapshot(
                    session,
                    params['id'],
                  ),
        ),
        'generateIncidentReport': _i1.MethodConnector(
          name: 'generateIncidentReport',
          params: {
            'from': _i1.ParameterDescription(
              name: 'from',
              type: _i1.getType<DateTime>(),
              nullable: false,
            ),
            'to': _i1.ParameterDescription(
              name: 'to',
              type: _i1.getType<DateTime>(),
              nullable: false,
            ),
            'serviceIds': _i1.ParameterDescription(
              name: 'serviceIds',
              type: _i1.getType<List<int>?>(),
              nullable: true,
            ),
            'severities': _i1.ParameterDescription(
              name: 'severities',
              type: _i1.getType<List<_i26.IncidentSeverity>?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['report'] as _i14.ReportEndpoint)
                  .generateIncidentReport(
                    session,
                    from: params['from'],
                    to: params['to'],
                    serviceIds: params['serviceIds'],
                    severities: params['severities'],
                  ),
        ),
        'generateHealthReport': _i1.MethodConnector(
          name: 'generateHealthReport',
          params: {
            'serviceIds': _i1.ParameterDescription(
              name: 'serviceIds',
              type: _i1.getType<List<int>?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['report'] as _i14.ReportEndpoint)
                  .generateHealthReport(
                    session,
                    serviceIds: params['serviceIds'],
                  ),
        ),
        'saveGeneratedReport': _i1.MethodConnector(
          name: 'saveGeneratedReport',
          params: {
            'reportData': _i1.ParameterDescription(
              name: 'reportData',
              type: _i1.getType<Map<String, dynamic>>(),
              nullable: false,
            ),
            'incidentId': _i1.ParameterDescription(
              name: 'incidentId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'generatedById': _i1.ParameterDescription(
              name: 'generatedById',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['report'] as _i14.ReportEndpoint)
                  .saveGeneratedReport(
                    session,
                    reportData: params['reportData'],
                    incidentId: params['incidentId'],
                    generatedById: params['generatedById'],
                  ),
        ),
      },
    );
    connectors['rule'] = _i1.EndpointConnector(
      name: 'rule',
      endpoint: endpoints['rule']!,
      methodConnectors: {
        'list': _i1.MethodConnector(
          name: 'list',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['rule'] as _i15.RuleEndpoint).list(session),
        ),
        'listForService': _i1.MethodConnector(
          name: 'listForService',
          params: {
            'serviceId': _i1.ParameterDescription(
              name: 'serviceId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['rule'] as _i15.RuleEndpoint).listForService(
                    session,
                    params['serviceId'],
                  ),
        ),
        'get': _i1.MethodConnector(
          name: 'get',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['rule'] as _i15.RuleEndpoint).get(
                session,
                params['id'],
              ),
        ),
        'create': _i1.MethodConnector(
          name: 'create',
          params: {
            'rule': _i1.ParameterDescription(
              name: 'rule',
              type: _i1.getType<_i34.Rule>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['rule'] as _i15.RuleEndpoint).create(
                session,
                params['rule'],
              ),
        ),
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'rule': _i1.ParameterDescription(
              name: 'rule',
              type: _i1.getType<_i34.Rule>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['rule'] as _i15.RuleEndpoint).update(
                session,
                params['rule'],
              ),
        ),
        'toggleEnabled': _i1.MethodConnector(
          name: 'toggleEnabled',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'enabled': _i1.ParameterDescription(
              name: 'enabled',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['rule'] as _i15.RuleEndpoint).toggleEnabled(
                session,
                params['id'],
                params['enabled'],
              ),
        ),
        'delete': _i1.MethodConnector(
          name: 'delete',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['rule'] as _i15.RuleEndpoint).delete(
                session,
                params['id'],
              ),
        ),
      },
    );
    connectors['service'] = _i1.EndpointConnector(
      name: 'service',
      endpoint: endpoints['service']!,
      methodConnectors: {
        'list': _i1.MethodConnector(
          name: 'list',
          params: {
            'status': _i1.ParameterDescription(
              name: 'status',
              type: _i1.getType<_i35.ServiceStatus?>(),
              nullable: true,
            ),
            'tier': _i1.ParameterDescription(
              name: 'tier',
              type: _i1.getType<_i36.ServiceTier?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['service'] as _i16.ServiceEndpoint).list(
                session,
                status: params['status'],
                tier: params['tier'],
              ),
        ),
        'get': _i1.MethodConnector(
          name: 'get',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['service'] as _i16.ServiceEndpoint).get(
                session,
                params['id'],
              ),
        ),
        'create': _i1.MethodConnector(
          name: 'create',
          params: {
            'service': _i1.ParameterDescription(
              name: 'service',
              type: _i1.getType<_i37.Service>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['service'] as _i16.ServiceEndpoint).create(
                session,
                params['service'],
              ),
        ),
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'service': _i1.ParameterDescription(
              name: 'service',
              type: _i1.getType<_i37.Service>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['service'] as _i16.ServiceEndpoint).update(
                session,
                params['service'],
              ),
        ),
        'delete': _i1.MethodConnector(
          name: 'delete',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['service'] as _i16.ServiceEndpoint).delete(
                session,
                params['id'],
              ),
        ),
        'getHealthSummary': _i1.MethodConnector(
          name: 'getHealthSummary',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['service'] as _i16.ServiceEndpoint)
                  .getHealthSummary(session),
        ),
        'getSystemMetrics': _i1.MethodConnector(
          name: 'getSystemMetrics',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['service'] as _i16.ServiceEndpoint)
                  .getSystemMetrics(session),
        ),
      },
    );
    connectors['streaming'] = _i1.EndpointConnector(
      name: 'streaming',
      endpoint: endpoints['streaming']!,
      methodConnectors: {},
    );
    connectors['systemSettings'] = _i1.EndpointConnector(
      name: 'systemSettings',
      endpoint: endpoints['systemSettings']!,
      methodConnectors: {
        'list': _i1.MethodConnector(
          name: 'list',
          params: {
            'category': _i1.ParameterDescription(
              name: 'category',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['systemSettings'] as _i18.SystemSettingsEndpoint)
                      .list(
                        session,
                        category: params['category'],
                      ),
        ),
        'getByKey': _i1.MethodConnector(
          name: 'getByKey',
          params: {
            'key': _i1.ParameterDescription(
              name: 'key',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['systemSettings'] as _i18.SystemSettingsEndpoint)
                      .getByKey(
                        session,
                        params['key'],
                      ),
        ),
        'getValue': _i1.MethodConnector(
          name: 'getValue',
          params: {
            'key': _i1.ParameterDescription(
              name: 'key',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['systemSettings'] as _i18.SystemSettingsEndpoint)
                      .getValue(
                        session,
                        params['key'],
                      ),
        ),
        'upsert': _i1.MethodConnector(
          name: 'upsert',
          params: {
            'key': _i1.ParameterDescription(
              name: 'key',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'value': _i1.ParameterDescription(
              name: 'value',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'description': _i1.ParameterDescription(
              name: 'description',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'category': _i1.ParameterDescription(
              name: 'category',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'isSecret': _i1.ParameterDescription(
              name: 'isSecret',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['systemSettings'] as _i18.SystemSettingsEndpoint)
                      .upsert(
                        session,
                        params['key'],
                        params['value'],
                        description: params['description'],
                        category: params['category'],
                        isSecret: params['isSecret'],
                      ),
        ),
        'delete': _i1.MethodConnector(
          name: 'delete',
          params: {
            'key': _i1.ParameterDescription(
              name: 'key',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['systemSettings'] as _i18.SystemSettingsEndpoint)
                      .delete(
                        session,
                        params['key'],
                      ),
        ),
        'getCategories': _i1.MethodConnector(
          name: 'getCategories',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['systemSettings'] as _i18.SystemSettingsEndpoint)
                      .getCategories(session),
        ),
        'bulkUpdate': _i1.MethodConnector(
          name: 'bulkUpdate',
          params: {
            'settings': _i1.ParameterDescription(
              name: 'settings',
              type: _i1.getType<List<_i38.SystemSetting>>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['systemSettings'] as _i18.SystemSettingsEndpoint)
                      .bulkUpdate(
                        session,
                        params['settings'],
                      ),
        ),
        'getPublic': _i1.MethodConnector(
          name: 'getPublic',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['systemSettings'] as _i18.SystemSettingsEndpoint)
                      .getPublic(session),
        ),
      },
    );
    connectors['telemetry'] = _i1.EndpointConnector(
      name: 'telemetry',
      endpoint: endpoints['telemetry']!,
      methodConnectors: {
        'ingestSignal': _i1.MethodConnector(
          name: 'ingestSignal',
          params: {
            'serviceId': _i1.ParameterDescription(
              name: 'serviceId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'payload': _i1.ParameterDescription(
              name: 'payload',
              type: _i1.getType<_i39.TelemetrySignalPayload>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['telemetry'] as _i19.TelemetryEndpoint)
                  .ingestSignal(
                    session,
                    params['serviceId'],
                    params['payload'],
                  ),
        ),
        'ingestBatch': _i1.MethodConnector(
          name: 'ingestBatch',
          params: {
            'serviceId': _i1.ParameterDescription(
              name: 'serviceId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'batch': _i1.ParameterDescription(
              name: 'batch',
              type: _i1.getType<_i40.TelemetrySignalBatch>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['telemetry'] as _i19.TelemetryEndpoint)
                  .ingestBatch(
                    session,
                    params['serviceId'],
                    params['batch'],
                  ),
        ),
        'heartbeat': _i1.MethodConnector(
          name: 'heartbeat',
          params: {
            'serviceId': _i1.ParameterDescription(
              name: 'serviceId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'heartbeat': _i1.ParameterDescription(
              name: 'heartbeat',
              type: _i1.getType<_i41.TelemetryHeartbeat>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['telemetry'] as _i19.TelemetryEndpoint).heartbeat(
                    session,
                    params['serviceId'],
                    params['heartbeat'],
                  ),
        ),
        'getSignals': _i1.MethodConnector(
          name: 'getSignals',
          params: {
            'serviceId': _i1.ParameterDescription(
              name: 'serviceId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['telemetry'] as _i19.TelemetryEndpoint).getSignals(
                    session,
                    params['serviceId'],
                  ),
        ),
      },
    );
    connectors['user'] = _i1.EndpointConnector(
      name: 'user',
      endpoint: endpoints['user']!,
      methodConnectors: {
        'getCurrentUser': _i1.MethodConnector(
          name: 'getCurrentUser',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['user'] as _i20.UserEndpoint)
                  .getCurrentUser(session),
        ),
        'listTeamMembers': _i1.MethodConnector(
          name: 'listTeamMembers',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['user'] as _i20.UserEndpoint)
                  .listTeamMembers(session),
        ),
        'get': _i1.MethodConnector(
          name: 'get',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['user'] as _i20.UserEndpoint).get(
                session,
                params['id'],
              ),
        ),
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'user': _i1.ParameterDescription(
              name: 'user',
              type: _i1.getType<_i42.OpsUser>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['user'] as _i20.UserEndpoint).update(
                session,
                params['user'],
              ),
        ),
        'assignRole': _i1.MethodConnector(
          name: 'assignRole',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'roleId': _i1.ParameterDescription(
              name: 'roleId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['user'] as _i20.UserEndpoint).assignRole(
                session,
                params['userId'],
                params['roleId'],
              ),
        ),
        'removeRole': _i1.MethodConnector(
          name: 'removeRole',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'roleId': _i1.ParameterDescription(
              name: 'roleId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['user'] as _i20.UserEndpoint).removeRole(
                session,
                params['userId'],
                params['roleId'],
              ),
        ),
      },
    );
    connectors['greeting'] = _i1.EndpointConnector(
      name: 'greeting',
      endpoint: endpoints['greeting']!,
      methodConnectors: {
        'hello': _i1.MethodConnector(
          name: 'hello',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['greeting'] as _i21.GreetingEndpoint).hello(
                session,
                params['name'],
              ),
        ),
      },
    );
    modules['serverpod_auth_idp'] = _i43.Endpoints()
      ..initializeEndpoints(server);
    modules['serverpod_auth'] = _i44.Endpoints()..initializeEndpoints(server);
    modules['serverpod_auth_core'] = _i45.Endpoints()
      ..initializeEndpoints(server);
  }

  @override
  _i1.FutureCallDispatch? get futureCalls {
    return _i46.FutureCalls();
  }
}
