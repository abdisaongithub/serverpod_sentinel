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
import 'package:serverpod/protocol.dart' as _i2;
import 'package:serverpod_auth_idp_server/serverpod_auth_idp_server.dart'
    as _i3;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i4;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _i5;
import 'agent/agent_task.dart' as _i6;
import 'agent/agent_task_status.dart' as _i7;
import 'ai/ai_insight.dart' as _i8;
import 'automation/playbook.dart' as _i9;
import 'automation/playbook_execution.dart' as _i10;
import 'automation/playbook_step_execution.dart' as _i11;
import 'automation/step_executor_payload.dart' as _i12;
import 'dtos/health_summary.dart' as _i13;
import 'dtos/system_metrics.dart' as _i14;
import 'dtos/team_member.dart' as _i15;
import 'enums/execution_status.dart' as _i16;
import 'enums/incident_severity.dart' as _i17;
import 'enums/incident_status.dart' as _i18;
import 'enums/playbook_type.dart' as _i19;
import 'enums/service_status.dart' as _i20;
import 'enums/service_tier.dart' as _i21;
import 'enums/signal_type.dart' as _i22;
import 'enums/timeline_item_type.dart' as _i23;
import 'governance/chaos_experiment.dart' as _i24;
import 'governance/remediation_policy.dart' as _i25;
import 'greetings/greeting.dart' as _i26;
import 'incident/incident.dart' as _i27;
import 'incident/incident_timeline_item.dart' as _i28;
import 'reporting/report_snapshot.dart' as _i29;
import 'security/app_permission.dart' as _i30;
import 'security/audit_log.dart' as _i31;
import 'security/ops_user.dart' as _i32;
import 'security/rate_limit_count.dart' as _i33;
import 'security/role.dart' as _i34;
import 'security/sentinel_api_key.dart' as _i35;
import 'security/service_token.dart' as _i36;
import 'security/user_role.dart' as _i37;
import 'service/health_signal.dart' as _i38;
import 'service/rule.dart' as _i39;
import 'service/service.dart' as _i40;
import 'settings/environment.dart' as _i41;
import 'settings/integration.dart' as _i42;
import 'settings/notification_preference.dart' as _i43;
import 'settings/outgoing_webhook.dart' as _i44;
import 'settings/system_setting.dart' as _i45;
import 'streaming/stream_alert.dart' as _i46;
import 'streaming/stream_incident_update.dart' as _i47;
import 'streaming/stream_log_entry.dart' as _i48;
import 'streaming/stream_metric.dart' as _i49;
import 'streaming/stream_service_status.dart' as _i50;
import 'streaming/stream_signal_update.dart' as _i51;
import 'streaming/stream_subscription.dart' as _i52;
import 'streaming/stream_subscription_type.dart' as _i53;
import 'streaming/stream_timeline_event.dart' as _i54;
import 'streaming/stream_update_type.dart' as _i55;
import 'telemetry/metric_point.dart' as _i56;
import 'telemetry/telemetry_event.dart' as _i57;
import 'telemetry/telemetry_heartbeat.dart' as _i58;
import 'telemetry/telemetry_resources.dart' as _i59;
import 'telemetry/telemetry_signal_batch.dart' as _i60;
import 'telemetry/telemetry_signal_payload.dart' as _i61;
import 'package:serverpod_sentinel_server/src/generated/ai/ai_insight.dart'
    as _i62;
import 'package:serverpod_sentinel_server/src/generated/streaming/stream_alert.dart'
    as _i63;
import 'package:serverpod_sentinel_server/src/generated/security/audit_log.dart'
    as _i64;
import 'package:serverpod_sentinel_server/src/generated/settings/environment.dart'
    as _i65;
import 'package:serverpod_sentinel_server/src/generated/incident/incident.dart'
    as _i66;
import 'package:serverpod_sentinel_server/src/generated/settings/integration.dart'
    as _i67;
import 'package:serverpod_sentinel_server/src/generated/settings/notification_preference.dart'
    as _i68;
import 'package:serverpod_sentinel_server/src/generated/settings/outgoing_webhook.dart'
    as _i69;
import 'package:serverpod_sentinel_server/src/generated/automation/playbook.dart'
    as _i70;
import 'package:serverpod_sentinel_server/src/generated/reporting/report_snapshot.dart'
    as _i71;
import 'package:serverpod_sentinel_server/src/generated/enums/incident_severity.dart'
    as _i72;
import 'package:serverpod_sentinel_server/src/generated/service/rule.dart'
    as _i73;
import 'package:serverpod_sentinel_server/src/generated/security/sentinel_api_key.dart'
    as _i74;
import 'package:serverpod_sentinel_server/src/generated/service/service.dart'
    as _i75;
import 'package:serverpod_sentinel_server/src/generated/settings/system_setting.dart'
    as _i76;
import 'package:serverpod_sentinel_server/src/generated/service/health_signal.dart'
    as _i77;
import 'package:serverpod_sentinel_server/src/generated/telemetry/metric_point.dart'
    as _i78;
import 'package:serverpod_sentinel_server/src/generated/dtos/team_member.dart'
    as _i79;
export 'agent/agent_task.dart';
export 'agent/agent_task_status.dart';
export 'ai/ai_insight.dart';
export 'automation/playbook.dart';
export 'automation/playbook_execution.dart';
export 'automation/playbook_step_execution.dart';
export 'automation/step_executor_payload.dart';
export 'dtos/health_summary.dart';
export 'dtos/system_metrics.dart';
export 'dtos/team_member.dart';
export 'enums/execution_status.dart';
export 'enums/incident_severity.dart';
export 'enums/incident_status.dart';
export 'enums/playbook_type.dart';
export 'enums/service_status.dart';
export 'enums/service_tier.dart';
export 'enums/signal_type.dart';
export 'enums/timeline_item_type.dart';
export 'governance/chaos_experiment.dart';
export 'governance/remediation_policy.dart';
export 'greetings/greeting.dart';
export 'incident/incident.dart';
export 'incident/incident_timeline_item.dart';
export 'reporting/report_snapshot.dart';
export 'security/app_permission.dart';
export 'security/audit_log.dart';
export 'security/ops_user.dart';
export 'security/rate_limit_count.dart';
export 'security/role.dart';
export 'security/sentinel_api_key.dart';
export 'security/service_token.dart';
export 'security/user_role.dart';
export 'service/health_signal.dart';
export 'service/rule.dart';
export 'service/service.dart';
export 'settings/environment.dart';
export 'settings/integration.dart';
export 'settings/notification_preference.dart';
export 'settings/outgoing_webhook.dart';
export 'settings/system_setting.dart';
export 'streaming/stream_alert.dart';
export 'streaming/stream_incident_update.dart';
export 'streaming/stream_log_entry.dart';
export 'streaming/stream_metric.dart';
export 'streaming/stream_service_status.dart';
export 'streaming/stream_signal_update.dart';
export 'streaming/stream_subscription.dart';
export 'streaming/stream_subscription_type.dart';
export 'streaming/stream_timeline_event.dart';
export 'streaming/stream_update_type.dart';
export 'telemetry/metric_point.dart';
export 'telemetry/telemetry_event.dart';
export 'telemetry/telemetry_heartbeat.dart';
export 'telemetry/telemetry_resources.dart';
export 'telemetry/telemetry_signal_batch.dart';
export 'telemetry/telemetry_signal_payload.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    _i2.TableDefinition(
      name: 'agent_task',
      dartName: 'AgentTask',
      schema: 'public',
      module: 'serverpod_sentinel',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'agent_task_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'serviceId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'command',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'arguments',
          columnType: _i2.ColumnType.json,
          isNullable: true,
          dartType: 'List<String>?',
        ),
        _i2.ColumnDefinition(
          name: 'timestamp',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'timeoutSeconds',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'status',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:AgentTaskStatus',
        ),
        _i2.ColumnDefinition(
          name: 'output',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'exitCode',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'agent_task_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'ai_insight',
      dartName: 'AiInsight',
      schema: 'public',
      module: 'serverpod_sentinel',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'ai_insight_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'type',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'title',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'content',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'severity',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'serviceId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'incidentId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'confidence',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'metadata',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'expiresAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'ai_insight_fk_0',
          columns: ['serviceId'],
          referenceTable: 'service',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'ai_insight_fk_1',
          columns: ['incidentId'],
          referenceTable: 'incident',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ai_insight_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'ai_insight_service_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'serviceId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'ai_insight_type_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'type',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'audit_log',
      dartName: 'AuditLog',
      schema: 'public',
      module: 'serverpod_sentinel',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'audit_log_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'actorId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'action',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'entityType',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'entityId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'changes',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'ipAddress',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: '_opsUserAuditlogsOpsUserId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'audit_log_fk_0',
          columns: ['actorId'],
          referenceTable: 'ops_user',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'audit_log_fk_1',
          columns: ['_opsUserAuditlogsOpsUserId'],
          referenceTable: 'ops_user',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'audit_log_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'audit_entity_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'entityType',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'entityId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'audit_created_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'createdAt',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'chaos_experiment',
      dartName: 'ChaosExperiment',
      schema: 'public',
      module: 'serverpod_sentinel',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'chaos_experiment_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'serviceId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'type',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'config',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'status',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'scheduledAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'startedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'finishedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'chaos_experiment_fk_0',
          columns: ['serviceId'],
          referenceTable: 'service',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'chaos_experiment_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'environment',
      dartName: 'Environment',
      schema: 'public',
      module: 'serverpod_sentinel',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'environment_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'region',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'isActive',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'config',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'environment_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'health_signal',
      dartName: 'HealthSignal',
      schema: 'public',
      module: 'serverpod_sentinel',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'health_signal_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'serviceId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'identifier',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'type',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:SignalType',
        ),
        _i2.ColumnDefinition(
          name: 'lastCheckedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'isHealthy',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'currentValue',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
        _i2.ColumnDefinition(
          name: 'unit',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'endpoint',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'metadata',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: '_serviceSignalsServiceId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'health_signal_fk_0',
          columns: ['serviceId'],
          referenceTable: 'service',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'health_signal_fk_1',
          columns: ['_serviceSignalsServiceId'],
          referenceTable: 'service',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'health_signal_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'health_signal_identifier_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'serviceId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'identifier',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'incident',
      dartName: 'Incident',
      schema: 'public',
      module: 'serverpod_sentinel',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'incident_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'title',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'summary',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'serviceId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'ruleId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'status',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:IncidentStatus',
        ),
        _i2.ColumnDefinition(
          name: 'severity',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:IncidentSeverity',
        ),
        _i2.ColumnDefinition(
          name: 'commanderId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'startedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'resolvedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: '_opsUserIncidentsOpsUserId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: '_serviceIncidentsServiceId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'incident_fk_0',
          columns: ['serviceId'],
          referenceTable: 'service',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'incident_fk_1',
          columns: ['ruleId'],
          referenceTable: 'rule',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'incident_fk_2',
          columns: ['commanderId'],
          referenceTable: 'ops_user',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'incident_fk_3',
          columns: ['_opsUserIncidentsOpsUserId'],
          referenceTable: 'ops_user',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'incident_fk_4',
          columns: ['_serviceIncidentsServiceId'],
          referenceTable: 'service',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'incident_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'incident_status_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'status',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'incident_severity_status_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'severity',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'status',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'incident_started_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'startedAt',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'incident_timeline_item',
      dartName: 'IncidentTimelineItem',
      schema: 'public',
      module: 'serverpod_sentinel',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'incident_timeline_item_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'incidentId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'authorId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'type',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:TimelineItemType',
        ),
        _i2.ColumnDefinition(
          name: 'content',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'metaData',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: '_incidentTimelineIncidentId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: '_opsUserTimelineitemsOpsUserId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'incident_timeline_item_fk_0',
          columns: ['incidentId'],
          referenceTable: 'incident',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'incident_timeline_item_fk_1',
          columns: ['authorId'],
          referenceTable: 'ops_user',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'incident_timeline_item_fk_2',
          columns: ['_incidentTimelineIncidentId'],
          referenceTable: 'incident',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'incident_timeline_item_fk_3',
          columns: ['_opsUserTimelineitemsOpsUserId'],
          referenceTable: 'ops_user',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'incident_timeline_item_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'timeline_incident_created_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'incidentId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'createdAt',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'integration',
      dartName: 'Integration',
      schema: 'public',
      module: 'serverpod_sentinel',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'integration_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'type',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'provider',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'config',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'isEnabled',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'lastSyncAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'integration_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'metric_point',
      dartName: 'MetricPoint',
      schema: 'public',
      module: 'serverpod_sentinel',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'metric_point_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'signalId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'timestamp',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'value',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'metric_point_fk_0',
          columns: ['signalId'],
          referenceTable: 'health_signal',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'metric_point_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'metric_point_signal_ts_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'signalId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'timestamp',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'notification_preference',
      dartName: 'NotificationPreference',
      schema: 'public',
      module: 'serverpod_sentinel',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault:
              'nextval(\'notification_preference_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'channel',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'enabled',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'settings',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'notification_preference_fk_0',
          columns: ['userId'],
          referenceTable: 'ops_user',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'notification_preference_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'notification_preference_user_channel_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'userId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'channel',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'ops_user',
      dartName: 'OpsUser',
      schema: 'public',
      module: 'serverpod_sentinel',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'ops_user_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'userInfoId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'mfaSecret',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'mfaEnabled',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ops_user_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'ops_user_info_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'userInfoId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'outgoing_webhook',
      dartName: 'OutgoingWebhook',
      schema: 'public',
      module: 'serverpod_sentinel',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'outgoing_webhook_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'url',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'events',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'List<String>',
        ),
        _i2.ColumnDefinition(
          name: 'secret',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'isEnabled',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'lastTriggeredAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'lastResponseCode',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'outgoing_webhook_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'playbook',
      dartName: 'Playbook',
      schema: 'public',
      module: 'serverpod_sentinel',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'playbook_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'type',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:PlaybookType',
        ),
        _i2.ColumnDefinition(
          name: 'content',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'playbook_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'playbook_execution',
      dartName: 'PlaybookExecution',
      schema: 'public',
      module: 'serverpod_sentinel',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'playbook_execution_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'playbookId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'incidentId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'initiatorId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'status',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:ExecutionStatus',
        ),
        _i2.ColumnDefinition(
          name: 'startedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'completedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'resultSummary',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: '_playbookExecutionsPlaybookId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: '_incidentExecutionsIncidentId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: '_opsUserPlaybookexecutionsOpsUserId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'playbook_execution_fk_0',
          columns: ['playbookId'],
          referenceTable: 'playbook',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'playbook_execution_fk_1',
          columns: ['incidentId'],
          referenceTable: 'incident',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'playbook_execution_fk_2',
          columns: ['initiatorId'],
          referenceTable: 'ops_user',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'playbook_execution_fk_3',
          columns: ['_playbookExecutionsPlaybookId'],
          referenceTable: 'playbook',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'playbook_execution_fk_4',
          columns: ['_incidentExecutionsIncidentId'],
          referenceTable: 'incident',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'playbook_execution_fk_5',
          columns: ['_opsUserPlaybookexecutionsOpsUserId'],
          referenceTable: 'ops_user',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'playbook_execution_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'execution_incident_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'incidentId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'execution_status_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'status',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'playbook_step_execution',
      dartName: 'PlaybookStepExecution',
      schema: 'public',
      module: 'serverpod_sentinel',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault:
              'nextval(\'playbook_step_execution_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'executionId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'stepId',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'status',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:ExecutionStatus',
        ),
        _i2.ColumnDefinition(
          name: 'startedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'completedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'logs',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'output',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'playbook_step_execution_fk_0',
          columns: ['executionId'],
          referenceTable: 'playbook_execution',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'playbook_step_execution_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'step_execution_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'executionId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'stepId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'remediation_policy',
      dartName: 'RemediationPolicy',
      schema: 'public',
      module: 'serverpod_sentinel',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'remediation_policy_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'event',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'serviceId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'playbookId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'autoExecute',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'true',
        ),
        _i2.ColumnDefinition(
          name: 'requireApproval',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
        _i2.ColumnDefinition(
          name: 'isEnabled',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'true',
        ),
        _i2.ColumnDefinition(
          name: 'maxRetries',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
          columnDefault: '3',
        ),
        _i2.ColumnDefinition(
          name: 'cooldownPeriod',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'remediation_policy_fk_0',
          columns: ['serviceId'],
          referenceTable: 'service',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'remediation_policy_fk_1',
          columns: ['playbookId'],
          referenceTable: 'playbook',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'remediation_policy_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'report_snapshot',
      dartName: 'ReportSnapshot',
      schema: 'public',
      module: 'serverpod_sentinel',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'report_snapshot_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'incidentId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'generatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'generatedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'content',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'report_snapshot_fk_0',
          columns: ['incidentId'],
          referenceTable: 'incident',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'report_snapshot_fk_1',
          columns: ['generatedById'],
          referenceTable: 'ops_user',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'report_snapshot_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'report_incident_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'incidentId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'role',
      dartName: 'Role',
      schema: 'public',
      module: 'serverpod_sentinel',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'role_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'permissions',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'List<String>',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'role_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'role_name_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'name',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'rule',
      dartName: 'Rule',
      schema: 'public',
      module: 'serverpod_sentinel',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'rule_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'serviceId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'signalId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'condition',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'durationSeconds',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'severity',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:IncidentSeverity',
        ),
        _i2.ColumnDefinition(
          name: 'enabled',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: '_serviceRulesServiceId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'rule_fk_0',
          columns: ['serviceId'],
          referenceTable: 'service',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'rule_fk_1',
          columns: ['signalId'],
          referenceTable: 'health_signal',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'rule_fk_2',
          columns: ['_serviceRulesServiceId'],
          referenceTable: 'service',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'rule_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'sentinel_api_key',
      dartName: 'SentinelApiKey',
      schema: 'public',
      module: 'serverpod_sentinel',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'sentinel_api_key_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'key',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'keyHash',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'scopes',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'List<String>',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'lastUsedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'expiresAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'sentinel_api_key_fk_0',
          columns: ['userId'],
          referenceTable: 'ops_user',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'sentinel_api_key_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'sentinel_api_key_hash_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'keyHash',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'service',
      dartName: 'Service',
      schema: 'public',
      module: 'serverpod_sentinel',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'service_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'ownerId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'status',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:ServiceStatus',
        ),
        _i2.ColumnDefinition(
          name: 'tier',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:ServiceTier',
        ),
        _i2.ColumnDefinition(
          name: 'region',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
          columnDefault: '\'us-east-1\'::text',
        ),
        _i2.ColumnDefinition(
          name: 'tags',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'List<String>',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: '_opsUserServicesOpsUserId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'service_fk_0',
          columns: ['ownerId'],
          referenceTable: 'ops_user',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'service_fk_1',
          columns: ['_opsUserServicesOpsUserId'],
          referenceTable: 'ops_user',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'service_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'service_status_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'status',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'service_tier_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'tier',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'service_token',
      dartName: 'ServiceToken',
      schema: 'public',
      module: 'serverpod_sentinel',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'service_token_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'token',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'serviceId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'lastUsedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'expiresAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'service_token_fk_0',
          columns: ['serviceId'],
          referenceTable: 'service',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'service_token_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'service_token_value_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'token',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'system_setting',
      dartName: 'SystemSetting',
      schema: 'public',
      module: 'serverpod_sentinel',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'system_setting_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'key',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'value',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'category',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'isSecret',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'system_setting_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'system_setting_key_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'key',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'telemetry_heartbeat',
      dartName: 'TelemetryHeartbeat',
      schema: 'public',
      module: 'serverpod_sentinel',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'telemetry_heartbeat_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'serviceId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'timestamp',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'uptimeSeconds',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'version',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'status',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:ServiceStatus',
        ),
        _i2.ColumnDefinition(
          name: 'resources',
          columnType: _i2.ColumnType.json,
          isNullable: true,
          dartType: 'protocol:TelemetryResources?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'telemetry_heartbeat_fk_0',
          columns: ['serviceId'],
          referenceTable: 'service',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'telemetry_heartbeat_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'user_role',
      dartName: 'UserRole',
      schema: 'public',
      module: 'serverpod_sentinel',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'user_role_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'roleId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: '_opsUserRolesOpsUserId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: '_roleUsersRoleId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'user_role_fk_0',
          columns: ['userId'],
          referenceTable: 'ops_user',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'user_role_fk_1',
          columns: ['roleId'],
          referenceTable: 'role',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'user_role_fk_2',
          columns: ['_opsUserRolesOpsUserId'],
          referenceTable: 'ops_user',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'user_role_fk_3',
          columns: ['_roleUsersRoleId'],
          referenceTable: 'role',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'user_role_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'user_role_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'userId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'roleId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    ..._i3.Protocol.targetTableDefinitions,
    ..._i4.Protocol.targetTableDefinitions,
    ..._i5.Protocol.targetTableDefinitions,
    ..._i2.Protocol.targetTableDefinitions,
  ];

  static String? getClassNameFromObjectJson(dynamic data) {
    if (data is! Map) return null;
    final className = data['__className__'] as String?;
    return className;
  }

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;

    final dataClassName = getClassNameFromObjectJson(data);
    if (dataClassName != null && dataClassName != getClassNameForType(t)) {
      try {
        return deserializeByClassName({
          'className': dataClassName,
          'data': data,
        });
      } on FormatException catch (_) {
        // If the className is not recognized (e.g., older client receiving
        // data with a new subtype), fall back to deserializing without the
        // className, using the expected type T.
      }
    }

    if (t == _i6.AgentTask) {
      return _i6.AgentTask.fromJson(data) as T;
    }
    if (t == _i7.AgentTaskStatus) {
      return _i7.AgentTaskStatus.fromJson(data) as T;
    }
    if (t == _i8.AiInsight) {
      return _i8.AiInsight.fromJson(data) as T;
    }
    if (t == _i9.Playbook) {
      return _i9.Playbook.fromJson(data) as T;
    }
    if (t == _i10.PlaybookExecution) {
      return _i10.PlaybookExecution.fromJson(data) as T;
    }
    if (t == _i11.PlaybookStepExecution) {
      return _i11.PlaybookStepExecution.fromJson(data) as T;
    }
    if (t == _i12.StepExecutorPayload) {
      return _i12.StepExecutorPayload.fromJson(data) as T;
    }
    if (t == _i13.HealthSummary) {
      return _i13.HealthSummary.fromJson(data) as T;
    }
    if (t == _i14.SystemMetrics) {
      return _i14.SystemMetrics.fromJson(data) as T;
    }
    if (t == _i15.TeamMember) {
      return _i15.TeamMember.fromJson(data) as T;
    }
    if (t == _i16.ExecutionStatus) {
      return _i16.ExecutionStatus.fromJson(data) as T;
    }
    if (t == _i17.IncidentSeverity) {
      return _i17.IncidentSeverity.fromJson(data) as T;
    }
    if (t == _i18.IncidentStatus) {
      return _i18.IncidentStatus.fromJson(data) as T;
    }
    if (t == _i19.PlaybookType) {
      return _i19.PlaybookType.fromJson(data) as T;
    }
    if (t == _i20.ServiceStatus) {
      return _i20.ServiceStatus.fromJson(data) as T;
    }
    if (t == _i21.ServiceTier) {
      return _i21.ServiceTier.fromJson(data) as T;
    }
    if (t == _i22.SignalType) {
      return _i22.SignalType.fromJson(data) as T;
    }
    if (t == _i23.TimelineItemType) {
      return _i23.TimelineItemType.fromJson(data) as T;
    }
    if (t == _i24.ChaosExperiment) {
      return _i24.ChaosExperiment.fromJson(data) as T;
    }
    if (t == _i25.RemediationPolicy) {
      return _i25.RemediationPolicy.fromJson(data) as T;
    }
    if (t == _i26.Greeting) {
      return _i26.Greeting.fromJson(data) as T;
    }
    if (t == _i27.Incident) {
      return _i27.Incident.fromJson(data) as T;
    }
    if (t == _i28.IncidentTimelineItem) {
      return _i28.IncidentTimelineItem.fromJson(data) as T;
    }
    if (t == _i29.ReportSnapshot) {
      return _i29.ReportSnapshot.fromJson(data) as T;
    }
    if (t == _i30.AppPermission) {
      return _i30.AppPermission.fromJson(data) as T;
    }
    if (t == _i31.AuditLog) {
      return _i31.AuditLog.fromJson(data) as T;
    }
    if (t == _i32.OpsUser) {
      return _i32.OpsUser.fromJson(data) as T;
    }
    if (t == _i33.RateLimitCount) {
      return _i33.RateLimitCount.fromJson(data) as T;
    }
    if (t == _i34.Role) {
      return _i34.Role.fromJson(data) as T;
    }
    if (t == _i35.SentinelApiKey) {
      return _i35.SentinelApiKey.fromJson(data) as T;
    }
    if (t == _i36.ServiceToken) {
      return _i36.ServiceToken.fromJson(data) as T;
    }
    if (t == _i37.UserRole) {
      return _i37.UserRole.fromJson(data) as T;
    }
    if (t == _i38.HealthSignal) {
      return _i38.HealthSignal.fromJson(data) as T;
    }
    if (t == _i39.Rule) {
      return _i39.Rule.fromJson(data) as T;
    }
    if (t == _i40.Service) {
      return _i40.Service.fromJson(data) as T;
    }
    if (t == _i41.Environment) {
      return _i41.Environment.fromJson(data) as T;
    }
    if (t == _i42.Integration) {
      return _i42.Integration.fromJson(data) as T;
    }
    if (t == _i43.NotificationPreference) {
      return _i43.NotificationPreference.fromJson(data) as T;
    }
    if (t == _i44.OutgoingWebhook) {
      return _i44.OutgoingWebhook.fromJson(data) as T;
    }
    if (t == _i45.SystemSetting) {
      return _i45.SystemSetting.fromJson(data) as T;
    }
    if (t == _i46.StreamAlert) {
      return _i46.StreamAlert.fromJson(data) as T;
    }
    if (t == _i47.StreamIncidentUpdate) {
      return _i47.StreamIncidentUpdate.fromJson(data) as T;
    }
    if (t == _i48.StreamLogEntry) {
      return _i48.StreamLogEntry.fromJson(data) as T;
    }
    if (t == _i49.StreamMetric) {
      return _i49.StreamMetric.fromJson(data) as T;
    }
    if (t == _i50.StreamServiceStatus) {
      return _i50.StreamServiceStatus.fromJson(data) as T;
    }
    if (t == _i51.StreamSignalUpdate) {
      return _i51.StreamSignalUpdate.fromJson(data) as T;
    }
    if (t == _i52.StreamSubscription) {
      return _i52.StreamSubscription.fromJson(data) as T;
    }
    if (t == _i53.StreamSubscriptionType) {
      return _i53.StreamSubscriptionType.fromJson(data) as T;
    }
    if (t == _i54.StreamTimelineEvent) {
      return _i54.StreamTimelineEvent.fromJson(data) as T;
    }
    if (t == _i55.StreamUpdateType) {
      return _i55.StreamUpdateType.fromJson(data) as T;
    }
    if (t == _i56.MetricPoint) {
      return _i56.MetricPoint.fromJson(data) as T;
    }
    if (t == _i57.TelemetryEvent) {
      return _i57.TelemetryEvent.fromJson(data) as T;
    }
    if (t == _i58.TelemetryHeartbeat) {
      return _i58.TelemetryHeartbeat.fromJson(data) as T;
    }
    if (t == _i59.TelemetryResources) {
      return _i59.TelemetryResources.fromJson(data) as T;
    }
    if (t == _i60.TelemetrySignalBatch) {
      return _i60.TelemetrySignalBatch.fromJson(data) as T;
    }
    if (t == _i61.TelemetrySignalPayload) {
      return _i61.TelemetrySignalPayload.fromJson(data) as T;
    }
    if (t == _i1.getType<_i6.AgentTask?>()) {
      return (data != null ? _i6.AgentTask.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.AgentTaskStatus?>()) {
      return (data != null ? _i7.AgentTaskStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.AiInsight?>()) {
      return (data != null ? _i8.AiInsight.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.Playbook?>()) {
      return (data != null ? _i9.Playbook.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.PlaybookExecution?>()) {
      return (data != null ? _i10.PlaybookExecution.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.PlaybookStepExecution?>()) {
      return (data != null ? _i11.PlaybookStepExecution.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i12.StepExecutorPayload?>()) {
      return (data != null ? _i12.StepExecutorPayload.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i13.HealthSummary?>()) {
      return (data != null ? _i13.HealthSummary.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.SystemMetrics?>()) {
      return (data != null ? _i14.SystemMetrics.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.TeamMember?>()) {
      return (data != null ? _i15.TeamMember.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.ExecutionStatus?>()) {
      return (data != null ? _i16.ExecutionStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.IncidentSeverity?>()) {
      return (data != null ? _i17.IncidentSeverity.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.IncidentStatus?>()) {
      return (data != null ? _i18.IncidentStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.PlaybookType?>()) {
      return (data != null ? _i19.PlaybookType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.ServiceStatus?>()) {
      return (data != null ? _i20.ServiceStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i21.ServiceTier?>()) {
      return (data != null ? _i21.ServiceTier.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.SignalType?>()) {
      return (data != null ? _i22.SignalType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i23.TimelineItemType?>()) {
      return (data != null ? _i23.TimelineItemType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i24.ChaosExperiment?>()) {
      return (data != null ? _i24.ChaosExperiment.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i25.RemediationPolicy?>()) {
      return (data != null ? _i25.RemediationPolicy.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i26.Greeting?>()) {
      return (data != null ? _i26.Greeting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i27.Incident?>()) {
      return (data != null ? _i27.Incident.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i28.IncidentTimelineItem?>()) {
      return (data != null ? _i28.IncidentTimelineItem.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i29.ReportSnapshot?>()) {
      return (data != null ? _i29.ReportSnapshot.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i30.AppPermission?>()) {
      return (data != null ? _i30.AppPermission.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i31.AuditLog?>()) {
      return (data != null ? _i31.AuditLog.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i32.OpsUser?>()) {
      return (data != null ? _i32.OpsUser.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i33.RateLimitCount?>()) {
      return (data != null ? _i33.RateLimitCount.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i34.Role?>()) {
      return (data != null ? _i34.Role.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i35.SentinelApiKey?>()) {
      return (data != null ? _i35.SentinelApiKey.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i36.ServiceToken?>()) {
      return (data != null ? _i36.ServiceToken.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i37.UserRole?>()) {
      return (data != null ? _i37.UserRole.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i38.HealthSignal?>()) {
      return (data != null ? _i38.HealthSignal.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i39.Rule?>()) {
      return (data != null ? _i39.Rule.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i40.Service?>()) {
      return (data != null ? _i40.Service.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i41.Environment?>()) {
      return (data != null ? _i41.Environment.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i42.Integration?>()) {
      return (data != null ? _i42.Integration.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i43.NotificationPreference?>()) {
      return (data != null ? _i43.NotificationPreference.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i44.OutgoingWebhook?>()) {
      return (data != null ? _i44.OutgoingWebhook.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i45.SystemSetting?>()) {
      return (data != null ? _i45.SystemSetting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i46.StreamAlert?>()) {
      return (data != null ? _i46.StreamAlert.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i47.StreamIncidentUpdate?>()) {
      return (data != null ? _i47.StreamIncidentUpdate.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i48.StreamLogEntry?>()) {
      return (data != null ? _i48.StreamLogEntry.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i49.StreamMetric?>()) {
      return (data != null ? _i49.StreamMetric.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i50.StreamServiceStatus?>()) {
      return (data != null ? _i50.StreamServiceStatus.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i51.StreamSignalUpdate?>()) {
      return (data != null ? _i51.StreamSignalUpdate.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i52.StreamSubscription?>()) {
      return (data != null ? _i52.StreamSubscription.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i53.StreamSubscriptionType?>()) {
      return (data != null ? _i53.StreamSubscriptionType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i54.StreamTimelineEvent?>()) {
      return (data != null ? _i54.StreamTimelineEvent.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i55.StreamUpdateType?>()) {
      return (data != null ? _i55.StreamUpdateType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i56.MetricPoint?>()) {
      return (data != null ? _i56.MetricPoint.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i57.TelemetryEvent?>()) {
      return (data != null ? _i57.TelemetryEvent.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i58.TelemetryHeartbeat?>()) {
      return (data != null ? _i58.TelemetryHeartbeat.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i59.TelemetryResources?>()) {
      return (data != null ? _i59.TelemetryResources.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i60.TelemetrySignalBatch?>()) {
      return (data != null ? _i60.TelemetrySignalBatch.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i61.TelemetrySignalPayload?>()) {
      return (data != null ? _i61.TelemetrySignalPayload.fromJson(data) : null)
          as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<String>(e)).toList()
              : null)
          as T;
    }
    if (t == List<_i10.PlaybookExecution>) {
      return (data as List)
              .map((e) => deserialize<_i10.PlaybookExecution>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i10.PlaybookExecution>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i10.PlaybookExecution>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i28.IncidentTimelineItem>) {
      return (data as List)
              .map((e) => deserialize<_i28.IncidentTimelineItem>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i28.IncidentTimelineItem>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i28.IncidentTimelineItem>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i37.UserRole>) {
      return (data as List).map((e) => deserialize<_i37.UserRole>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i37.UserRole>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i37.UserRole>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i40.Service>) {
      return (data as List).map((e) => deserialize<_i40.Service>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i40.Service>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<_i40.Service>(e)).toList()
              : null)
          as T;
    }
    if (t == List<_i27.Incident>) {
      return (data as List).map((e) => deserialize<_i27.Incident>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i27.Incident>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i27.Incident>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i31.AuditLog>) {
      return (data as List).map((e) => deserialize<_i31.AuditLog>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i31.AuditLog>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i31.AuditLog>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i38.HealthSignal>) {
      return (data as List)
              .map((e) => deserialize<_i38.HealthSignal>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i38.HealthSignal>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i38.HealthSignal>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i39.Rule>) {
      return (data as List).map((e) => deserialize<_i39.Rule>(e)).toList() as T;
    }
    if (t == _i1.getType<List<_i39.Rule>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<_i39.Rule>(e)).toList()
              : null)
          as T;
    }
    if (t == List<_i61.TelemetrySignalPayload>) {
      return (data as List)
              .map((e) => deserialize<_i61.TelemetrySignalPayload>(e))
              .toList()
          as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<String>(e)).toList()
              : null)
          as T;
    }
    if (t == List<_i62.AiInsight>) {
      return (data as List).map((e) => deserialize<_i62.AiInsight>(e)).toList()
          as T;
    }
    if (t == Map<String, dynamic>) {
      return (data as Map).map(
            (k, v) => MapEntry(deserialize<String>(k), deserialize<dynamic>(v)),
          )
          as T;
    }
    if (t == List<_i63.StreamAlert>) {
      return (data as List)
              .map((e) => deserialize<_i63.StreamAlert>(e))
              .toList()
          as T;
    }
    if (t == List<_i64.AuditLog>) {
      return (data as List).map((e) => deserialize<_i64.AuditLog>(e)).toList()
          as T;
    }
    if (t == List<_i65.Environment>) {
      return (data as List)
              .map((e) => deserialize<_i65.Environment>(e))
              .toList()
          as T;
    }
    if (t == List<_i66.Incident>) {
      return (data as List).map((e) => deserialize<_i66.Incident>(e)).toList()
          as T;
    }
    if (t == List<_i67.Integration>) {
      return (data as List)
              .map((e) => deserialize<_i67.Integration>(e))
              .toList()
          as T;
    }
    if (t == List<Map<String, dynamic>>) {
      return (data as List)
              .map((e) => deserialize<Map<String, dynamic>>(e))
              .toList()
          as T;
    }
    if (t == List<_i68.NotificationPreference>) {
      return (data as List)
              .map((e) => deserialize<_i68.NotificationPreference>(e))
              .toList()
          as T;
    }
    if (t == List<_i69.OutgoingWebhook>) {
      return (data as List)
              .map((e) => deserialize<_i69.OutgoingWebhook>(e))
              .toList()
          as T;
    }
    if (t == List<_i70.Playbook>) {
      return (data as List).map((e) => deserialize<_i70.Playbook>(e)).toList()
          as T;
    }
    if (t == List<_i71.ReportSnapshot>) {
      return (data as List)
              .map((e) => deserialize<_i71.ReportSnapshot>(e))
              .toList()
          as T;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as T;
    }
    if (t == _i1.getType<List<int>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<int>(e)).toList()
              : null)
          as T;
    }
    if (t == List<_i72.IncidentSeverity>) {
      return (data as List)
              .map((e) => deserialize<_i72.IncidentSeverity>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i72.IncidentSeverity>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i72.IncidentSeverity>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i73.Rule>) {
      return (data as List).map((e) => deserialize<_i73.Rule>(e)).toList() as T;
    }
    if (t == List<_i74.SentinelApiKey>) {
      return (data as List)
              .map((e) => deserialize<_i74.SentinelApiKey>(e))
              .toList()
          as T;
    }
    if (t == List<_i75.Service>) {
      return (data as List).map((e) => deserialize<_i75.Service>(e)).toList()
          as T;
    }
    if (t == List<_i76.SystemSetting>) {
      return (data as List)
              .map((e) => deserialize<_i76.SystemSetting>(e))
              .toList()
          as T;
    }
    if (t == List<_i77.HealthSignal>) {
      return (data as List)
              .map((e) => deserialize<_i77.HealthSignal>(e))
              .toList()
          as T;
    }
    if (t == List<_i78.MetricPoint>) {
      return (data as List)
              .map((e) => deserialize<_i78.MetricPoint>(e))
              .toList()
          as T;
    }
    if (t == List<_i79.TeamMember>) {
      return (data as List).map((e) => deserialize<_i79.TeamMember>(e)).toList()
          as T;
    }
    try {
      return _i3.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i4.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i5.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i6.AgentTask => 'AgentTask',
      _i7.AgentTaskStatus => 'AgentTaskStatus',
      _i8.AiInsight => 'AiInsight',
      _i9.Playbook => 'Playbook',
      _i10.PlaybookExecution => 'PlaybookExecution',
      _i11.PlaybookStepExecution => 'PlaybookStepExecution',
      _i12.StepExecutorPayload => 'StepExecutorPayload',
      _i13.HealthSummary => 'HealthSummary',
      _i14.SystemMetrics => 'SystemMetrics',
      _i15.TeamMember => 'TeamMember',
      _i16.ExecutionStatus => 'ExecutionStatus',
      _i17.IncidentSeverity => 'IncidentSeverity',
      _i18.IncidentStatus => 'IncidentStatus',
      _i19.PlaybookType => 'PlaybookType',
      _i20.ServiceStatus => 'ServiceStatus',
      _i21.ServiceTier => 'ServiceTier',
      _i22.SignalType => 'SignalType',
      _i23.TimelineItemType => 'TimelineItemType',
      _i24.ChaosExperiment => 'ChaosExperiment',
      _i25.RemediationPolicy => 'RemediationPolicy',
      _i26.Greeting => 'Greeting',
      _i27.Incident => 'Incident',
      _i28.IncidentTimelineItem => 'IncidentTimelineItem',
      _i29.ReportSnapshot => 'ReportSnapshot',
      _i30.AppPermission => 'AppPermission',
      _i31.AuditLog => 'AuditLog',
      _i32.OpsUser => 'OpsUser',
      _i33.RateLimitCount => 'RateLimitCount',
      _i34.Role => 'Role',
      _i35.SentinelApiKey => 'SentinelApiKey',
      _i36.ServiceToken => 'ServiceToken',
      _i37.UserRole => 'UserRole',
      _i38.HealthSignal => 'HealthSignal',
      _i39.Rule => 'Rule',
      _i40.Service => 'Service',
      _i41.Environment => 'Environment',
      _i42.Integration => 'Integration',
      _i43.NotificationPreference => 'NotificationPreference',
      _i44.OutgoingWebhook => 'OutgoingWebhook',
      _i45.SystemSetting => 'SystemSetting',
      _i46.StreamAlert => 'StreamAlert',
      _i47.StreamIncidentUpdate => 'StreamIncidentUpdate',
      _i48.StreamLogEntry => 'StreamLogEntry',
      _i49.StreamMetric => 'StreamMetric',
      _i50.StreamServiceStatus => 'StreamServiceStatus',
      _i51.StreamSignalUpdate => 'StreamSignalUpdate',
      _i52.StreamSubscription => 'StreamSubscription',
      _i53.StreamSubscriptionType => 'StreamSubscriptionType',
      _i54.StreamTimelineEvent => 'StreamTimelineEvent',
      _i55.StreamUpdateType => 'StreamUpdateType',
      _i56.MetricPoint => 'MetricPoint',
      _i57.TelemetryEvent => 'TelemetryEvent',
      _i58.TelemetryHeartbeat => 'TelemetryHeartbeat',
      _i59.TelemetryResources => 'TelemetryResources',
      _i60.TelemetrySignalBatch => 'TelemetrySignalBatch',
      _i61.TelemetrySignalPayload => 'TelemetrySignalPayload',
      _ => null,
    };
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;

    if (data is Map<String, dynamic> && data['__className__'] is String) {
      return (data['__className__'] as String).replaceFirst(
        'serverpod_sentinel.',
        '',
      );
    }

    switch (data) {
      case _i6.AgentTask():
        return 'AgentTask';
      case _i7.AgentTaskStatus():
        return 'AgentTaskStatus';
      case _i8.AiInsight():
        return 'AiInsight';
      case _i9.Playbook():
        return 'Playbook';
      case _i10.PlaybookExecution():
        return 'PlaybookExecution';
      case _i11.PlaybookStepExecution():
        return 'PlaybookStepExecution';
      case _i12.StepExecutorPayload():
        return 'StepExecutorPayload';
      case _i13.HealthSummary():
        return 'HealthSummary';
      case _i14.SystemMetrics():
        return 'SystemMetrics';
      case _i15.TeamMember():
        return 'TeamMember';
      case _i16.ExecutionStatus():
        return 'ExecutionStatus';
      case _i17.IncidentSeverity():
        return 'IncidentSeverity';
      case _i18.IncidentStatus():
        return 'IncidentStatus';
      case _i19.PlaybookType():
        return 'PlaybookType';
      case _i20.ServiceStatus():
        return 'ServiceStatus';
      case _i21.ServiceTier():
        return 'ServiceTier';
      case _i22.SignalType():
        return 'SignalType';
      case _i23.TimelineItemType():
        return 'TimelineItemType';
      case _i24.ChaosExperiment():
        return 'ChaosExperiment';
      case _i25.RemediationPolicy():
        return 'RemediationPolicy';
      case _i26.Greeting():
        return 'Greeting';
      case _i27.Incident():
        return 'Incident';
      case _i28.IncidentTimelineItem():
        return 'IncidentTimelineItem';
      case _i29.ReportSnapshot():
        return 'ReportSnapshot';
      case _i30.AppPermission():
        return 'AppPermission';
      case _i31.AuditLog():
        return 'AuditLog';
      case _i32.OpsUser():
        return 'OpsUser';
      case _i33.RateLimitCount():
        return 'RateLimitCount';
      case _i34.Role():
        return 'Role';
      case _i35.SentinelApiKey():
        return 'SentinelApiKey';
      case _i36.ServiceToken():
        return 'ServiceToken';
      case _i37.UserRole():
        return 'UserRole';
      case _i38.HealthSignal():
        return 'HealthSignal';
      case _i39.Rule():
        return 'Rule';
      case _i40.Service():
        return 'Service';
      case _i41.Environment():
        return 'Environment';
      case _i42.Integration():
        return 'Integration';
      case _i43.NotificationPreference():
        return 'NotificationPreference';
      case _i44.OutgoingWebhook():
        return 'OutgoingWebhook';
      case _i45.SystemSetting():
        return 'SystemSetting';
      case _i46.StreamAlert():
        return 'StreamAlert';
      case _i47.StreamIncidentUpdate():
        return 'StreamIncidentUpdate';
      case _i48.StreamLogEntry():
        return 'StreamLogEntry';
      case _i49.StreamMetric():
        return 'StreamMetric';
      case _i50.StreamServiceStatus():
        return 'StreamServiceStatus';
      case _i51.StreamSignalUpdate():
        return 'StreamSignalUpdate';
      case _i52.StreamSubscription():
        return 'StreamSubscription';
      case _i53.StreamSubscriptionType():
        return 'StreamSubscriptionType';
      case _i54.StreamTimelineEvent():
        return 'StreamTimelineEvent';
      case _i55.StreamUpdateType():
        return 'StreamUpdateType';
      case _i56.MetricPoint():
        return 'MetricPoint';
      case _i57.TelemetryEvent():
        return 'TelemetryEvent';
      case _i58.TelemetryHeartbeat():
        return 'TelemetryHeartbeat';
      case _i59.TelemetryResources():
        return 'TelemetryResources';
      case _i60.TelemetrySignalBatch():
        return 'TelemetrySignalBatch';
      case _i61.TelemetrySignalPayload():
        return 'TelemetrySignalPayload';
    }
    className = _i2.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod.$className';
    }
    className = _i3.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_idp.$className';
    }
    className = _i4.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    className = _i5.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_core.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'AgentTask') {
      return deserialize<_i6.AgentTask>(data['data']);
    }
    if (dataClassName == 'AgentTaskStatus') {
      return deserialize<_i7.AgentTaskStatus>(data['data']);
    }
    if (dataClassName == 'AiInsight') {
      return deserialize<_i8.AiInsight>(data['data']);
    }
    if (dataClassName == 'Playbook') {
      return deserialize<_i9.Playbook>(data['data']);
    }
    if (dataClassName == 'PlaybookExecution') {
      return deserialize<_i10.PlaybookExecution>(data['data']);
    }
    if (dataClassName == 'PlaybookStepExecution') {
      return deserialize<_i11.PlaybookStepExecution>(data['data']);
    }
    if (dataClassName == 'StepExecutorPayload') {
      return deserialize<_i12.StepExecutorPayload>(data['data']);
    }
    if (dataClassName == 'HealthSummary') {
      return deserialize<_i13.HealthSummary>(data['data']);
    }
    if (dataClassName == 'SystemMetrics') {
      return deserialize<_i14.SystemMetrics>(data['data']);
    }
    if (dataClassName == 'TeamMember') {
      return deserialize<_i15.TeamMember>(data['data']);
    }
    if (dataClassName == 'ExecutionStatus') {
      return deserialize<_i16.ExecutionStatus>(data['data']);
    }
    if (dataClassName == 'IncidentSeverity') {
      return deserialize<_i17.IncidentSeverity>(data['data']);
    }
    if (dataClassName == 'IncidentStatus') {
      return deserialize<_i18.IncidentStatus>(data['data']);
    }
    if (dataClassName == 'PlaybookType') {
      return deserialize<_i19.PlaybookType>(data['data']);
    }
    if (dataClassName == 'ServiceStatus') {
      return deserialize<_i20.ServiceStatus>(data['data']);
    }
    if (dataClassName == 'ServiceTier') {
      return deserialize<_i21.ServiceTier>(data['data']);
    }
    if (dataClassName == 'SignalType') {
      return deserialize<_i22.SignalType>(data['data']);
    }
    if (dataClassName == 'TimelineItemType') {
      return deserialize<_i23.TimelineItemType>(data['data']);
    }
    if (dataClassName == 'ChaosExperiment') {
      return deserialize<_i24.ChaosExperiment>(data['data']);
    }
    if (dataClassName == 'RemediationPolicy') {
      return deserialize<_i25.RemediationPolicy>(data['data']);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_i26.Greeting>(data['data']);
    }
    if (dataClassName == 'Incident') {
      return deserialize<_i27.Incident>(data['data']);
    }
    if (dataClassName == 'IncidentTimelineItem') {
      return deserialize<_i28.IncidentTimelineItem>(data['data']);
    }
    if (dataClassName == 'ReportSnapshot') {
      return deserialize<_i29.ReportSnapshot>(data['data']);
    }
    if (dataClassName == 'AppPermission') {
      return deserialize<_i30.AppPermission>(data['data']);
    }
    if (dataClassName == 'AuditLog') {
      return deserialize<_i31.AuditLog>(data['data']);
    }
    if (dataClassName == 'OpsUser') {
      return deserialize<_i32.OpsUser>(data['data']);
    }
    if (dataClassName == 'RateLimitCount') {
      return deserialize<_i33.RateLimitCount>(data['data']);
    }
    if (dataClassName == 'Role') {
      return deserialize<_i34.Role>(data['data']);
    }
    if (dataClassName == 'SentinelApiKey') {
      return deserialize<_i35.SentinelApiKey>(data['data']);
    }
    if (dataClassName == 'ServiceToken') {
      return deserialize<_i36.ServiceToken>(data['data']);
    }
    if (dataClassName == 'UserRole') {
      return deserialize<_i37.UserRole>(data['data']);
    }
    if (dataClassName == 'HealthSignal') {
      return deserialize<_i38.HealthSignal>(data['data']);
    }
    if (dataClassName == 'Rule') {
      return deserialize<_i39.Rule>(data['data']);
    }
    if (dataClassName == 'Service') {
      return deserialize<_i40.Service>(data['data']);
    }
    if (dataClassName == 'Environment') {
      return deserialize<_i41.Environment>(data['data']);
    }
    if (dataClassName == 'Integration') {
      return deserialize<_i42.Integration>(data['data']);
    }
    if (dataClassName == 'NotificationPreference') {
      return deserialize<_i43.NotificationPreference>(data['data']);
    }
    if (dataClassName == 'OutgoingWebhook') {
      return deserialize<_i44.OutgoingWebhook>(data['data']);
    }
    if (dataClassName == 'SystemSetting') {
      return deserialize<_i45.SystemSetting>(data['data']);
    }
    if (dataClassName == 'StreamAlert') {
      return deserialize<_i46.StreamAlert>(data['data']);
    }
    if (dataClassName == 'StreamIncidentUpdate') {
      return deserialize<_i47.StreamIncidentUpdate>(data['data']);
    }
    if (dataClassName == 'StreamLogEntry') {
      return deserialize<_i48.StreamLogEntry>(data['data']);
    }
    if (dataClassName == 'StreamMetric') {
      return deserialize<_i49.StreamMetric>(data['data']);
    }
    if (dataClassName == 'StreamServiceStatus') {
      return deserialize<_i50.StreamServiceStatus>(data['data']);
    }
    if (dataClassName == 'StreamSignalUpdate') {
      return deserialize<_i51.StreamSignalUpdate>(data['data']);
    }
    if (dataClassName == 'StreamSubscription') {
      return deserialize<_i52.StreamSubscription>(data['data']);
    }
    if (dataClassName == 'StreamSubscriptionType') {
      return deserialize<_i53.StreamSubscriptionType>(data['data']);
    }
    if (dataClassName == 'StreamTimelineEvent') {
      return deserialize<_i54.StreamTimelineEvent>(data['data']);
    }
    if (dataClassName == 'StreamUpdateType') {
      return deserialize<_i55.StreamUpdateType>(data['data']);
    }
    if (dataClassName == 'MetricPoint') {
      return deserialize<_i56.MetricPoint>(data['data']);
    }
    if (dataClassName == 'TelemetryEvent') {
      return deserialize<_i57.TelemetryEvent>(data['data']);
    }
    if (dataClassName == 'TelemetryHeartbeat') {
      return deserialize<_i58.TelemetryHeartbeat>(data['data']);
    }
    if (dataClassName == 'TelemetryResources') {
      return deserialize<_i59.TelemetryResources>(data['data']);
    }
    if (dataClassName == 'TelemetrySignalBatch') {
      return deserialize<_i60.TelemetrySignalBatch>(data['data']);
    }
    if (dataClassName == 'TelemetrySignalPayload') {
      return deserialize<_i61.TelemetrySignalPayload>(data['data']);
    }
    if (dataClassName.startsWith('serverpod.')) {
      data['className'] = dataClassName.substring(10);
      return _i2.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _i3.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i4.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _i5.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i3.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _i4.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _i5.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i6.AgentTask:
        return _i6.AgentTask.t;
      case _i8.AiInsight:
        return _i8.AiInsight.t;
      case _i9.Playbook:
        return _i9.Playbook.t;
      case _i10.PlaybookExecution:
        return _i10.PlaybookExecution.t;
      case _i11.PlaybookStepExecution:
        return _i11.PlaybookStepExecution.t;
      case _i24.ChaosExperiment:
        return _i24.ChaosExperiment.t;
      case _i25.RemediationPolicy:
        return _i25.RemediationPolicy.t;
      case _i27.Incident:
        return _i27.Incident.t;
      case _i28.IncidentTimelineItem:
        return _i28.IncidentTimelineItem.t;
      case _i29.ReportSnapshot:
        return _i29.ReportSnapshot.t;
      case _i31.AuditLog:
        return _i31.AuditLog.t;
      case _i32.OpsUser:
        return _i32.OpsUser.t;
      case _i34.Role:
        return _i34.Role.t;
      case _i35.SentinelApiKey:
        return _i35.SentinelApiKey.t;
      case _i36.ServiceToken:
        return _i36.ServiceToken.t;
      case _i37.UserRole:
        return _i37.UserRole.t;
      case _i38.HealthSignal:
        return _i38.HealthSignal.t;
      case _i39.Rule:
        return _i39.Rule.t;
      case _i40.Service:
        return _i40.Service.t;
      case _i41.Environment:
        return _i41.Environment.t;
      case _i42.Integration:
        return _i42.Integration.t;
      case _i43.NotificationPreference:
        return _i43.NotificationPreference.t;
      case _i44.OutgoingWebhook:
        return _i44.OutgoingWebhook.t;
      case _i45.SystemSetting:
        return _i45.SystemSetting.t;
      case _i56.MetricPoint:
        return _i56.MetricPoint.t;
      case _i58.TelemetryHeartbeat:
        return _i58.TelemetryHeartbeat.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'serverpod_sentinel';

  /// Maps any `Record`s known to this [Protocol] to their JSON representation
  ///
  /// Throws in case the record type is not known.
  ///
  /// This method will return `null` (only) for `null` inputs.
  Map<String, dynamic>? mapRecordToJson(Record? record) {
    if (record == null) {
      return null;
    }
    try {
      return _i3.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _i4.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _i5.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
