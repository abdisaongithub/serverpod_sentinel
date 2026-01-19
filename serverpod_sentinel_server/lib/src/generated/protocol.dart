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
import 'ai/ai_insight.dart' as _i6;
import 'automation/playbook.dart' as _i7;
import 'automation/playbook_execution.dart' as _i8;
import 'automation/playbook_step_execution.dart' as _i9;
import 'automation/step_executor_payload.dart' as _i10;
import 'dtos/health_summary.dart' as _i11;
import 'dtos/system_metrics.dart' as _i12;
import 'dtos/team_member.dart' as _i13;
import 'enums/execution_status.dart' as _i14;
import 'enums/incident_severity.dart' as _i15;
import 'enums/incident_status.dart' as _i16;
import 'enums/playbook_type.dart' as _i17;
import 'enums/service_status.dart' as _i18;
import 'enums/service_tier.dart' as _i19;
import 'enums/signal_type.dart' as _i20;
import 'enums/timeline_item_type.dart' as _i21;
import 'greetings/greeting.dart' as _i22;
import 'incident/incident.dart' as _i23;
import 'incident/incident_timeline_item.dart' as _i24;
import 'reporting/report_snapshot.dart' as _i25;
import 'security/audit_log.dart' as _i26;
import 'security/ops_user.dart' as _i27;
import 'security/role.dart' as _i28;
import 'security/service_token.dart' as _i29;
import 'security/user_role.dart' as _i30;
import 'service/health_signal.dart' as _i31;
import 'service/rule.dart' as _i32;
import 'service/service.dart' as _i33;
import 'settings/environment.dart' as _i34;
import 'settings/integration.dart' as _i35;
import 'settings/notification_preference.dart' as _i36;
import 'settings/system_setting.dart' as _i37;
import 'streaming/stream_alert.dart' as _i38;
import 'streaming/stream_incident_update.dart' as _i39;
import 'streaming/stream_log_entry.dart' as _i40;
import 'streaming/stream_metric.dart' as _i41;
import 'streaming/stream_service_status.dart' as _i42;
import 'streaming/stream_signal_update.dart' as _i43;
import 'streaming/stream_subscription.dart' as _i44;
import 'streaming/stream_subscription_type.dart' as _i45;
import 'streaming/stream_timeline_event.dart' as _i46;
import 'streaming/stream_update_type.dart' as _i47;
import 'telemetry/telemetry_event.dart' as _i48;
import 'telemetry/telemetry_heartbeat.dart' as _i49;
import 'telemetry/telemetry_resources.dart' as _i50;
import 'telemetry/telemetry_signal_batch.dart' as _i51;
import 'telemetry/telemetry_signal_payload.dart' as _i52;
import 'package:serverpod_sentinel_server/src/generated/ai/ai_insight.dart'
    as _i53;
import 'package:serverpod_sentinel_server/src/generated/streaming/stream_alert.dart'
    as _i54;
import 'package:serverpod_sentinel_server/src/generated/security/audit_log.dart'
    as _i55;
import 'package:serverpod_sentinel_server/src/generated/settings/environment.dart'
    as _i56;
import 'package:serverpod_sentinel_server/src/generated/incident/incident.dart'
    as _i57;
import 'package:serverpod_sentinel_server/src/generated/settings/integration.dart'
    as _i58;
import 'package:serverpod_sentinel_server/src/generated/settings/notification_preference.dart'
    as _i59;
import 'package:serverpod_sentinel_server/src/generated/automation/playbook.dart'
    as _i60;
import 'package:serverpod_sentinel_server/src/generated/reporting/report_snapshot.dart'
    as _i61;
import 'package:serverpod_sentinel_server/src/generated/enums/incident_severity.dart'
    as _i62;
import 'package:serverpod_sentinel_server/src/generated/service/rule.dart'
    as _i63;
import 'package:serverpod_sentinel_server/src/generated/service/service.dart'
    as _i64;
import 'package:serverpod_sentinel_server/src/generated/settings/system_setting.dart'
    as _i65;
import 'package:serverpod_sentinel_server/src/generated/service/health_signal.dart'
    as _i66;
import 'package:serverpod_sentinel_server/src/generated/dtos/team_member.dart'
    as _i67;
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
export 'greetings/greeting.dart';
export 'incident/incident.dart';
export 'incident/incident_timeline_item.dart';
export 'reporting/report_snapshot.dart';
export 'security/audit_log.dart';
export 'security/ops_user.dart';
export 'security/role.dart';
export 'security/service_token.dart';
export 'security/user_role.dart';
export 'service/health_signal.dart';
export 'service/rule.dart';
export 'service/service.dart';
export 'settings/environment.dart';
export 'settings/integration.dart';
export 'settings/notification_preference.dart';
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
      foreignKeys: [],
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

    if (t == _i6.AiInsight) {
      return _i6.AiInsight.fromJson(data) as T;
    }
    if (t == _i7.Playbook) {
      return _i7.Playbook.fromJson(data) as T;
    }
    if (t == _i8.PlaybookExecution) {
      return _i8.PlaybookExecution.fromJson(data) as T;
    }
    if (t == _i9.PlaybookStepExecution) {
      return _i9.PlaybookStepExecution.fromJson(data) as T;
    }
    if (t == _i10.StepExecutorPayload) {
      return _i10.StepExecutorPayload.fromJson(data) as T;
    }
    if (t == _i11.HealthSummary) {
      return _i11.HealthSummary.fromJson(data) as T;
    }
    if (t == _i12.SystemMetrics) {
      return _i12.SystemMetrics.fromJson(data) as T;
    }
    if (t == _i13.TeamMember) {
      return _i13.TeamMember.fromJson(data) as T;
    }
    if (t == _i14.ExecutionStatus) {
      return _i14.ExecutionStatus.fromJson(data) as T;
    }
    if (t == _i15.IncidentSeverity) {
      return _i15.IncidentSeverity.fromJson(data) as T;
    }
    if (t == _i16.IncidentStatus) {
      return _i16.IncidentStatus.fromJson(data) as T;
    }
    if (t == _i17.PlaybookType) {
      return _i17.PlaybookType.fromJson(data) as T;
    }
    if (t == _i18.ServiceStatus) {
      return _i18.ServiceStatus.fromJson(data) as T;
    }
    if (t == _i19.ServiceTier) {
      return _i19.ServiceTier.fromJson(data) as T;
    }
    if (t == _i20.SignalType) {
      return _i20.SignalType.fromJson(data) as T;
    }
    if (t == _i21.TimelineItemType) {
      return _i21.TimelineItemType.fromJson(data) as T;
    }
    if (t == _i22.Greeting) {
      return _i22.Greeting.fromJson(data) as T;
    }
    if (t == _i23.Incident) {
      return _i23.Incident.fromJson(data) as T;
    }
    if (t == _i24.IncidentTimelineItem) {
      return _i24.IncidentTimelineItem.fromJson(data) as T;
    }
    if (t == _i25.ReportSnapshot) {
      return _i25.ReportSnapshot.fromJson(data) as T;
    }
    if (t == _i26.AuditLog) {
      return _i26.AuditLog.fromJson(data) as T;
    }
    if (t == _i27.OpsUser) {
      return _i27.OpsUser.fromJson(data) as T;
    }
    if (t == _i28.Role) {
      return _i28.Role.fromJson(data) as T;
    }
    if (t == _i29.ServiceToken) {
      return _i29.ServiceToken.fromJson(data) as T;
    }
    if (t == _i30.UserRole) {
      return _i30.UserRole.fromJson(data) as T;
    }
    if (t == _i31.HealthSignal) {
      return _i31.HealthSignal.fromJson(data) as T;
    }
    if (t == _i32.Rule) {
      return _i32.Rule.fromJson(data) as T;
    }
    if (t == _i33.Service) {
      return _i33.Service.fromJson(data) as T;
    }
    if (t == _i34.Environment) {
      return _i34.Environment.fromJson(data) as T;
    }
    if (t == _i35.Integration) {
      return _i35.Integration.fromJson(data) as T;
    }
    if (t == _i36.NotificationPreference) {
      return _i36.NotificationPreference.fromJson(data) as T;
    }
    if (t == _i37.SystemSetting) {
      return _i37.SystemSetting.fromJson(data) as T;
    }
    if (t == _i38.StreamAlert) {
      return _i38.StreamAlert.fromJson(data) as T;
    }
    if (t == _i39.StreamIncidentUpdate) {
      return _i39.StreamIncidentUpdate.fromJson(data) as T;
    }
    if (t == _i40.StreamLogEntry) {
      return _i40.StreamLogEntry.fromJson(data) as T;
    }
    if (t == _i41.StreamMetric) {
      return _i41.StreamMetric.fromJson(data) as T;
    }
    if (t == _i42.StreamServiceStatus) {
      return _i42.StreamServiceStatus.fromJson(data) as T;
    }
    if (t == _i43.StreamSignalUpdate) {
      return _i43.StreamSignalUpdate.fromJson(data) as T;
    }
    if (t == _i44.StreamSubscription) {
      return _i44.StreamSubscription.fromJson(data) as T;
    }
    if (t == _i45.StreamSubscriptionType) {
      return _i45.StreamSubscriptionType.fromJson(data) as T;
    }
    if (t == _i46.StreamTimelineEvent) {
      return _i46.StreamTimelineEvent.fromJson(data) as T;
    }
    if (t == _i47.StreamUpdateType) {
      return _i47.StreamUpdateType.fromJson(data) as T;
    }
    if (t == _i48.TelemetryEvent) {
      return _i48.TelemetryEvent.fromJson(data) as T;
    }
    if (t == _i49.TelemetryHeartbeat) {
      return _i49.TelemetryHeartbeat.fromJson(data) as T;
    }
    if (t == _i50.TelemetryResources) {
      return _i50.TelemetryResources.fromJson(data) as T;
    }
    if (t == _i51.TelemetrySignalBatch) {
      return _i51.TelemetrySignalBatch.fromJson(data) as T;
    }
    if (t == _i52.TelemetrySignalPayload) {
      return _i52.TelemetrySignalPayload.fromJson(data) as T;
    }
    if (t == _i1.getType<_i6.AiInsight?>()) {
      return (data != null ? _i6.AiInsight.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.Playbook?>()) {
      return (data != null ? _i7.Playbook.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.PlaybookExecution?>()) {
      return (data != null ? _i8.PlaybookExecution.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.PlaybookStepExecution?>()) {
      return (data != null ? _i9.PlaybookStepExecution.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i10.StepExecutorPayload?>()) {
      return (data != null ? _i10.StepExecutorPayload.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i11.HealthSummary?>()) {
      return (data != null ? _i11.HealthSummary.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.SystemMetrics?>()) {
      return (data != null ? _i12.SystemMetrics.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.TeamMember?>()) {
      return (data != null ? _i13.TeamMember.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.ExecutionStatus?>()) {
      return (data != null ? _i14.ExecutionStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.IncidentSeverity?>()) {
      return (data != null ? _i15.IncidentSeverity.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.IncidentStatus?>()) {
      return (data != null ? _i16.IncidentStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.PlaybookType?>()) {
      return (data != null ? _i17.PlaybookType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.ServiceStatus?>()) {
      return (data != null ? _i18.ServiceStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.ServiceTier?>()) {
      return (data != null ? _i19.ServiceTier.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.SignalType?>()) {
      return (data != null ? _i20.SignalType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i21.TimelineItemType?>()) {
      return (data != null ? _i21.TimelineItemType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.Greeting?>()) {
      return (data != null ? _i22.Greeting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i23.Incident?>()) {
      return (data != null ? _i23.Incident.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i24.IncidentTimelineItem?>()) {
      return (data != null ? _i24.IncidentTimelineItem.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i25.ReportSnapshot?>()) {
      return (data != null ? _i25.ReportSnapshot.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i26.AuditLog?>()) {
      return (data != null ? _i26.AuditLog.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i27.OpsUser?>()) {
      return (data != null ? _i27.OpsUser.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i28.Role?>()) {
      return (data != null ? _i28.Role.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i29.ServiceToken?>()) {
      return (data != null ? _i29.ServiceToken.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i30.UserRole?>()) {
      return (data != null ? _i30.UserRole.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i31.HealthSignal?>()) {
      return (data != null ? _i31.HealthSignal.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i32.Rule?>()) {
      return (data != null ? _i32.Rule.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i33.Service?>()) {
      return (data != null ? _i33.Service.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i34.Environment?>()) {
      return (data != null ? _i34.Environment.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i35.Integration?>()) {
      return (data != null ? _i35.Integration.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i36.NotificationPreference?>()) {
      return (data != null ? _i36.NotificationPreference.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i37.SystemSetting?>()) {
      return (data != null ? _i37.SystemSetting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i38.StreamAlert?>()) {
      return (data != null ? _i38.StreamAlert.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i39.StreamIncidentUpdate?>()) {
      return (data != null ? _i39.StreamIncidentUpdate.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i40.StreamLogEntry?>()) {
      return (data != null ? _i40.StreamLogEntry.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i41.StreamMetric?>()) {
      return (data != null ? _i41.StreamMetric.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i42.StreamServiceStatus?>()) {
      return (data != null ? _i42.StreamServiceStatus.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i43.StreamSignalUpdate?>()) {
      return (data != null ? _i43.StreamSignalUpdate.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i44.StreamSubscription?>()) {
      return (data != null ? _i44.StreamSubscription.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i45.StreamSubscriptionType?>()) {
      return (data != null ? _i45.StreamSubscriptionType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i46.StreamTimelineEvent?>()) {
      return (data != null ? _i46.StreamTimelineEvent.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i47.StreamUpdateType?>()) {
      return (data != null ? _i47.StreamUpdateType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i48.TelemetryEvent?>()) {
      return (data != null ? _i48.TelemetryEvent.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i49.TelemetryHeartbeat?>()) {
      return (data != null ? _i49.TelemetryHeartbeat.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i50.TelemetryResources?>()) {
      return (data != null ? _i50.TelemetryResources.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i51.TelemetrySignalBatch?>()) {
      return (data != null ? _i51.TelemetrySignalBatch.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i52.TelemetrySignalPayload?>()) {
      return (data != null ? _i52.TelemetrySignalPayload.fromJson(data) : null)
          as T;
    }
    if (t == List<_i8.PlaybookExecution>) {
      return (data as List)
              .map((e) => deserialize<_i8.PlaybookExecution>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i8.PlaybookExecution>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i8.PlaybookExecution>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i24.IncidentTimelineItem>) {
      return (data as List)
              .map((e) => deserialize<_i24.IncidentTimelineItem>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i24.IncidentTimelineItem>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i24.IncidentTimelineItem>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i30.UserRole>) {
      return (data as List).map((e) => deserialize<_i30.UserRole>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i30.UserRole>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i30.UserRole>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i33.Service>) {
      return (data as List).map((e) => deserialize<_i33.Service>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i33.Service>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<_i33.Service>(e)).toList()
              : null)
          as T;
    }
    if (t == List<_i23.Incident>) {
      return (data as List).map((e) => deserialize<_i23.Incident>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i23.Incident>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i23.Incident>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i26.AuditLog>) {
      return (data as List).map((e) => deserialize<_i26.AuditLog>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i26.AuditLog>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i26.AuditLog>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == List<_i31.HealthSignal>) {
      return (data as List)
              .map((e) => deserialize<_i31.HealthSignal>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i31.HealthSignal>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i31.HealthSignal>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i32.Rule>) {
      return (data as List).map((e) => deserialize<_i32.Rule>(e)).toList() as T;
    }
    if (t == _i1.getType<List<_i32.Rule>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<_i32.Rule>(e)).toList()
              : null)
          as T;
    }
    if (t == List<_i52.TelemetrySignalPayload>) {
      return (data as List)
              .map((e) => deserialize<_i52.TelemetrySignalPayload>(e))
              .toList()
          as T;
    }
    if (t == List<_i53.AiInsight>) {
      return (data as List).map((e) => deserialize<_i53.AiInsight>(e)).toList()
          as T;
    }
    if (t == Map<String, dynamic>) {
      return (data as Map).map(
            (k, v) => MapEntry(deserialize<String>(k), deserialize<dynamic>(v)),
          )
          as T;
    }
    if (t == List<Map<String, dynamic>>) {
      return (data as List)
              .map((e) => deserialize<Map<String, dynamic>>(e))
              .toList()
          as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == List<_i54.StreamAlert>) {
      return (data as List)
              .map((e) => deserialize<_i54.StreamAlert>(e))
              .toList()
          as T;
    }
    if (t == List<_i55.AuditLog>) {
      return (data as List).map((e) => deserialize<_i55.AuditLog>(e)).toList()
          as T;
    }
    if (t == List<_i56.Environment>) {
      return (data as List)
              .map((e) => deserialize<_i56.Environment>(e))
              .toList()
          as T;
    }
    if (t == List<_i57.Incident>) {
      return (data as List).map((e) => deserialize<_i57.Incident>(e)).toList()
          as T;
    }
    if (t == List<_i58.Integration>) {
      return (data as List)
              .map((e) => deserialize<_i58.Integration>(e))
              .toList()
          as T;
    }
    if (t == List<_i59.NotificationPreference>) {
      return (data as List)
              .map((e) => deserialize<_i59.NotificationPreference>(e))
              .toList()
          as T;
    }
    if (t == List<_i60.Playbook>) {
      return (data as List).map((e) => deserialize<_i60.Playbook>(e)).toList()
          as T;
    }
    if (t == List<_i61.ReportSnapshot>) {
      return (data as List)
              .map((e) => deserialize<_i61.ReportSnapshot>(e))
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
    if (t == List<_i62.IncidentSeverity>) {
      return (data as List)
              .map((e) => deserialize<_i62.IncidentSeverity>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i62.IncidentSeverity>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i62.IncidentSeverity>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i63.Rule>) {
      return (data as List).map((e) => deserialize<_i63.Rule>(e)).toList() as T;
    }
    if (t == List<_i64.Service>) {
      return (data as List).map((e) => deserialize<_i64.Service>(e)).toList()
          as T;
    }
    if (t == List<_i65.SystemSetting>) {
      return (data as List)
              .map((e) => deserialize<_i65.SystemSetting>(e))
              .toList()
          as T;
    }
    if (t == List<_i66.HealthSignal>) {
      return (data as List)
              .map((e) => deserialize<_i66.HealthSignal>(e))
              .toList()
          as T;
    }
    if (t == List<_i67.TeamMember>) {
      return (data as List).map((e) => deserialize<_i67.TeamMember>(e)).toList()
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
      _i6.AiInsight => 'AiInsight',
      _i7.Playbook => 'Playbook',
      _i8.PlaybookExecution => 'PlaybookExecution',
      _i9.PlaybookStepExecution => 'PlaybookStepExecution',
      _i10.StepExecutorPayload => 'StepExecutorPayload',
      _i11.HealthSummary => 'HealthSummary',
      _i12.SystemMetrics => 'SystemMetrics',
      _i13.TeamMember => 'TeamMember',
      _i14.ExecutionStatus => 'ExecutionStatus',
      _i15.IncidentSeverity => 'IncidentSeverity',
      _i16.IncidentStatus => 'IncidentStatus',
      _i17.PlaybookType => 'PlaybookType',
      _i18.ServiceStatus => 'ServiceStatus',
      _i19.ServiceTier => 'ServiceTier',
      _i20.SignalType => 'SignalType',
      _i21.TimelineItemType => 'TimelineItemType',
      _i22.Greeting => 'Greeting',
      _i23.Incident => 'Incident',
      _i24.IncidentTimelineItem => 'IncidentTimelineItem',
      _i25.ReportSnapshot => 'ReportSnapshot',
      _i26.AuditLog => 'AuditLog',
      _i27.OpsUser => 'OpsUser',
      _i28.Role => 'Role',
      _i29.ServiceToken => 'ServiceToken',
      _i30.UserRole => 'UserRole',
      _i31.HealthSignal => 'HealthSignal',
      _i32.Rule => 'Rule',
      _i33.Service => 'Service',
      _i34.Environment => 'Environment',
      _i35.Integration => 'Integration',
      _i36.NotificationPreference => 'NotificationPreference',
      _i37.SystemSetting => 'SystemSetting',
      _i38.StreamAlert => 'StreamAlert',
      _i39.StreamIncidentUpdate => 'StreamIncidentUpdate',
      _i40.StreamLogEntry => 'StreamLogEntry',
      _i41.StreamMetric => 'StreamMetric',
      _i42.StreamServiceStatus => 'StreamServiceStatus',
      _i43.StreamSignalUpdate => 'StreamSignalUpdate',
      _i44.StreamSubscription => 'StreamSubscription',
      _i45.StreamSubscriptionType => 'StreamSubscriptionType',
      _i46.StreamTimelineEvent => 'StreamTimelineEvent',
      _i47.StreamUpdateType => 'StreamUpdateType',
      _i48.TelemetryEvent => 'TelemetryEvent',
      _i49.TelemetryHeartbeat => 'TelemetryHeartbeat',
      _i50.TelemetryResources => 'TelemetryResources',
      _i51.TelemetrySignalBatch => 'TelemetrySignalBatch',
      _i52.TelemetrySignalPayload => 'TelemetrySignalPayload',
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
      case _i6.AiInsight():
        return 'AiInsight';
      case _i7.Playbook():
        return 'Playbook';
      case _i8.PlaybookExecution():
        return 'PlaybookExecution';
      case _i9.PlaybookStepExecution():
        return 'PlaybookStepExecution';
      case _i10.StepExecutorPayload():
        return 'StepExecutorPayload';
      case _i11.HealthSummary():
        return 'HealthSummary';
      case _i12.SystemMetrics():
        return 'SystemMetrics';
      case _i13.TeamMember():
        return 'TeamMember';
      case _i14.ExecutionStatus():
        return 'ExecutionStatus';
      case _i15.IncidentSeverity():
        return 'IncidentSeverity';
      case _i16.IncidentStatus():
        return 'IncidentStatus';
      case _i17.PlaybookType():
        return 'PlaybookType';
      case _i18.ServiceStatus():
        return 'ServiceStatus';
      case _i19.ServiceTier():
        return 'ServiceTier';
      case _i20.SignalType():
        return 'SignalType';
      case _i21.TimelineItemType():
        return 'TimelineItemType';
      case _i22.Greeting():
        return 'Greeting';
      case _i23.Incident():
        return 'Incident';
      case _i24.IncidentTimelineItem():
        return 'IncidentTimelineItem';
      case _i25.ReportSnapshot():
        return 'ReportSnapshot';
      case _i26.AuditLog():
        return 'AuditLog';
      case _i27.OpsUser():
        return 'OpsUser';
      case _i28.Role():
        return 'Role';
      case _i29.ServiceToken():
        return 'ServiceToken';
      case _i30.UserRole():
        return 'UserRole';
      case _i31.HealthSignal():
        return 'HealthSignal';
      case _i32.Rule():
        return 'Rule';
      case _i33.Service():
        return 'Service';
      case _i34.Environment():
        return 'Environment';
      case _i35.Integration():
        return 'Integration';
      case _i36.NotificationPreference():
        return 'NotificationPreference';
      case _i37.SystemSetting():
        return 'SystemSetting';
      case _i38.StreamAlert():
        return 'StreamAlert';
      case _i39.StreamIncidentUpdate():
        return 'StreamIncidentUpdate';
      case _i40.StreamLogEntry():
        return 'StreamLogEntry';
      case _i41.StreamMetric():
        return 'StreamMetric';
      case _i42.StreamServiceStatus():
        return 'StreamServiceStatus';
      case _i43.StreamSignalUpdate():
        return 'StreamSignalUpdate';
      case _i44.StreamSubscription():
        return 'StreamSubscription';
      case _i45.StreamSubscriptionType():
        return 'StreamSubscriptionType';
      case _i46.StreamTimelineEvent():
        return 'StreamTimelineEvent';
      case _i47.StreamUpdateType():
        return 'StreamUpdateType';
      case _i48.TelemetryEvent():
        return 'TelemetryEvent';
      case _i49.TelemetryHeartbeat():
        return 'TelemetryHeartbeat';
      case _i50.TelemetryResources():
        return 'TelemetryResources';
      case _i51.TelemetrySignalBatch():
        return 'TelemetrySignalBatch';
      case _i52.TelemetrySignalPayload():
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
    if (dataClassName == 'AiInsight') {
      return deserialize<_i6.AiInsight>(data['data']);
    }
    if (dataClassName == 'Playbook') {
      return deserialize<_i7.Playbook>(data['data']);
    }
    if (dataClassName == 'PlaybookExecution') {
      return deserialize<_i8.PlaybookExecution>(data['data']);
    }
    if (dataClassName == 'PlaybookStepExecution') {
      return deserialize<_i9.PlaybookStepExecution>(data['data']);
    }
    if (dataClassName == 'StepExecutorPayload') {
      return deserialize<_i10.StepExecutorPayload>(data['data']);
    }
    if (dataClassName == 'HealthSummary') {
      return deserialize<_i11.HealthSummary>(data['data']);
    }
    if (dataClassName == 'SystemMetrics') {
      return deserialize<_i12.SystemMetrics>(data['data']);
    }
    if (dataClassName == 'TeamMember') {
      return deserialize<_i13.TeamMember>(data['data']);
    }
    if (dataClassName == 'ExecutionStatus') {
      return deserialize<_i14.ExecutionStatus>(data['data']);
    }
    if (dataClassName == 'IncidentSeverity') {
      return deserialize<_i15.IncidentSeverity>(data['data']);
    }
    if (dataClassName == 'IncidentStatus') {
      return deserialize<_i16.IncidentStatus>(data['data']);
    }
    if (dataClassName == 'PlaybookType') {
      return deserialize<_i17.PlaybookType>(data['data']);
    }
    if (dataClassName == 'ServiceStatus') {
      return deserialize<_i18.ServiceStatus>(data['data']);
    }
    if (dataClassName == 'ServiceTier') {
      return deserialize<_i19.ServiceTier>(data['data']);
    }
    if (dataClassName == 'SignalType') {
      return deserialize<_i20.SignalType>(data['data']);
    }
    if (dataClassName == 'TimelineItemType') {
      return deserialize<_i21.TimelineItemType>(data['data']);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_i22.Greeting>(data['data']);
    }
    if (dataClassName == 'Incident') {
      return deserialize<_i23.Incident>(data['data']);
    }
    if (dataClassName == 'IncidentTimelineItem') {
      return deserialize<_i24.IncidentTimelineItem>(data['data']);
    }
    if (dataClassName == 'ReportSnapshot') {
      return deserialize<_i25.ReportSnapshot>(data['data']);
    }
    if (dataClassName == 'AuditLog') {
      return deserialize<_i26.AuditLog>(data['data']);
    }
    if (dataClassName == 'OpsUser') {
      return deserialize<_i27.OpsUser>(data['data']);
    }
    if (dataClassName == 'Role') {
      return deserialize<_i28.Role>(data['data']);
    }
    if (dataClassName == 'ServiceToken') {
      return deserialize<_i29.ServiceToken>(data['data']);
    }
    if (dataClassName == 'UserRole') {
      return deserialize<_i30.UserRole>(data['data']);
    }
    if (dataClassName == 'HealthSignal') {
      return deserialize<_i31.HealthSignal>(data['data']);
    }
    if (dataClassName == 'Rule') {
      return deserialize<_i32.Rule>(data['data']);
    }
    if (dataClassName == 'Service') {
      return deserialize<_i33.Service>(data['data']);
    }
    if (dataClassName == 'Environment') {
      return deserialize<_i34.Environment>(data['data']);
    }
    if (dataClassName == 'Integration') {
      return deserialize<_i35.Integration>(data['data']);
    }
    if (dataClassName == 'NotificationPreference') {
      return deserialize<_i36.NotificationPreference>(data['data']);
    }
    if (dataClassName == 'SystemSetting') {
      return deserialize<_i37.SystemSetting>(data['data']);
    }
    if (dataClassName == 'StreamAlert') {
      return deserialize<_i38.StreamAlert>(data['data']);
    }
    if (dataClassName == 'StreamIncidentUpdate') {
      return deserialize<_i39.StreamIncidentUpdate>(data['data']);
    }
    if (dataClassName == 'StreamLogEntry') {
      return deserialize<_i40.StreamLogEntry>(data['data']);
    }
    if (dataClassName == 'StreamMetric') {
      return deserialize<_i41.StreamMetric>(data['data']);
    }
    if (dataClassName == 'StreamServiceStatus') {
      return deserialize<_i42.StreamServiceStatus>(data['data']);
    }
    if (dataClassName == 'StreamSignalUpdate') {
      return deserialize<_i43.StreamSignalUpdate>(data['data']);
    }
    if (dataClassName == 'StreamSubscription') {
      return deserialize<_i44.StreamSubscription>(data['data']);
    }
    if (dataClassName == 'StreamSubscriptionType') {
      return deserialize<_i45.StreamSubscriptionType>(data['data']);
    }
    if (dataClassName == 'StreamTimelineEvent') {
      return deserialize<_i46.StreamTimelineEvent>(data['data']);
    }
    if (dataClassName == 'StreamUpdateType') {
      return deserialize<_i47.StreamUpdateType>(data['data']);
    }
    if (dataClassName == 'TelemetryEvent') {
      return deserialize<_i48.TelemetryEvent>(data['data']);
    }
    if (dataClassName == 'TelemetryHeartbeat') {
      return deserialize<_i49.TelemetryHeartbeat>(data['data']);
    }
    if (dataClassName == 'TelemetryResources') {
      return deserialize<_i50.TelemetryResources>(data['data']);
    }
    if (dataClassName == 'TelemetrySignalBatch') {
      return deserialize<_i51.TelemetrySignalBatch>(data['data']);
    }
    if (dataClassName == 'TelemetrySignalPayload') {
      return deserialize<_i52.TelemetrySignalPayload>(data['data']);
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
      case _i6.AiInsight:
        return _i6.AiInsight.t;
      case _i7.Playbook:
        return _i7.Playbook.t;
      case _i8.PlaybookExecution:
        return _i8.PlaybookExecution.t;
      case _i9.PlaybookStepExecution:
        return _i9.PlaybookStepExecution.t;
      case _i23.Incident:
        return _i23.Incident.t;
      case _i24.IncidentTimelineItem:
        return _i24.IncidentTimelineItem.t;
      case _i25.ReportSnapshot:
        return _i25.ReportSnapshot.t;
      case _i26.AuditLog:
        return _i26.AuditLog.t;
      case _i27.OpsUser:
        return _i27.OpsUser.t;
      case _i28.Role:
        return _i28.Role.t;
      case _i29.ServiceToken:
        return _i29.ServiceToken.t;
      case _i30.UserRole:
        return _i30.UserRole.t;
      case _i31.HealthSignal:
        return _i31.HealthSignal.t;
      case _i32.Rule:
        return _i32.Rule.t;
      case _i33.Service:
        return _i33.Service.t;
      case _i34.Environment:
        return _i34.Environment.t;
      case _i35.Integration:
        return _i35.Integration.t;
      case _i36.NotificationPreference:
        return _i36.NotificationPreference.t;
      case _i37.SystemSetting:
        return _i37.SystemSetting.t;
      case _i49.TelemetryHeartbeat:
        return _i49.TelemetryHeartbeat.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'serverpod_sentinel';
}
