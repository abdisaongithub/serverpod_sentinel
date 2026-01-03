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
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _i4;
import 'automation/playbook.dart' as _i5;
import 'automation/playbook_execution.dart' as _i6;
import 'automation/playbook_step_execution.dart' as _i7;
import 'automation/step_executor_payload.dart' as _i8;
import 'enums/execution_status.dart' as _i9;
import 'enums/incident_severity.dart' as _i10;
import 'enums/incident_status.dart' as _i11;
import 'enums/playbook_type.dart' as _i12;
import 'enums/service_status.dart' as _i13;
import 'enums/service_tier.dart' as _i14;
import 'enums/signal_type.dart' as _i15;
import 'enums/timeline_item_type.dart' as _i16;
import 'greetings/greeting.dart' as _i17;
import 'incident/incident.dart' as _i18;
import 'incident/incident_timeline_item.dart' as _i19;
import 'reporting/report_snapshot.dart' as _i20;
import 'security/audit_log.dart' as _i21;
import 'security/ops_user.dart' as _i22;
import 'security/role.dart' as _i23;
import 'security/service_token.dart' as _i24;
import 'security/user_role.dart' as _i25;
import 'service/health_signal.dart' as _i26;
import 'service/rule.dart' as _i27;
import 'service/service.dart' as _i28;
import 'streaming/stream_incident_update.dart' as _i29;
import 'streaming/stream_service_status.dart' as _i30;
import 'streaming/stream_subscription.dart' as _i31;
import 'streaming/stream_subscription_type.dart' as _i32;
import 'streaming/stream_timeline_event.dart' as _i33;
import 'streaming/stream_update_type.dart' as _i34;
import 'telemetry/telemetry_event.dart' as _i35;
import 'telemetry/telemetry_heartbeat.dart' as _i36;
import 'telemetry/telemetry_resources.dart' as _i37;
import 'telemetry/telemetry_signal_batch.dart' as _i38;
import 'telemetry/telemetry_signal_payload.dart' as _i39;
export 'automation/playbook.dart';
export 'automation/playbook_execution.dart';
export 'automation/playbook_step_execution.dart';
export 'automation/step_executor_payload.dart';
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
export 'streaming/stream_incident_update.dart';
export 'streaming/stream_service_status.dart';
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
          name: 'serviceId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'ruleId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
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
          isNullable: true,
          dartType: 'int?',
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
          name: 'incidentId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'authorId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
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
          isNullable: true,
          dartType: 'int?',
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

    if (t == _i5.Playbook) {
      return _i5.Playbook.fromJson(data) as T;
    }
    if (t == _i6.PlaybookExecution) {
      return _i6.PlaybookExecution.fromJson(data) as T;
    }
    if (t == _i7.PlaybookStepExecution) {
      return _i7.PlaybookStepExecution.fromJson(data) as T;
    }
    if (t == _i8.StepExecutorPayload) {
      return _i8.StepExecutorPayload.fromJson(data) as T;
    }
    if (t == _i9.ExecutionStatus) {
      return _i9.ExecutionStatus.fromJson(data) as T;
    }
    if (t == _i10.IncidentSeverity) {
      return _i10.IncidentSeverity.fromJson(data) as T;
    }
    if (t == _i11.IncidentStatus) {
      return _i11.IncidentStatus.fromJson(data) as T;
    }
    if (t == _i12.PlaybookType) {
      return _i12.PlaybookType.fromJson(data) as T;
    }
    if (t == _i13.ServiceStatus) {
      return _i13.ServiceStatus.fromJson(data) as T;
    }
    if (t == _i14.ServiceTier) {
      return _i14.ServiceTier.fromJson(data) as T;
    }
    if (t == _i15.SignalType) {
      return _i15.SignalType.fromJson(data) as T;
    }
    if (t == _i16.TimelineItemType) {
      return _i16.TimelineItemType.fromJson(data) as T;
    }
    if (t == _i17.Greeting) {
      return _i17.Greeting.fromJson(data) as T;
    }
    if (t == _i18.Incident) {
      return _i18.Incident.fromJson(data) as T;
    }
    if (t == _i19.IncidentTimelineItem) {
      return _i19.IncidentTimelineItem.fromJson(data) as T;
    }
    if (t == _i20.ReportSnapshot) {
      return _i20.ReportSnapshot.fromJson(data) as T;
    }
    if (t == _i21.AuditLog) {
      return _i21.AuditLog.fromJson(data) as T;
    }
    if (t == _i22.OpsUser) {
      return _i22.OpsUser.fromJson(data) as T;
    }
    if (t == _i23.Role) {
      return _i23.Role.fromJson(data) as T;
    }
    if (t == _i24.ServiceToken) {
      return _i24.ServiceToken.fromJson(data) as T;
    }
    if (t == _i25.UserRole) {
      return _i25.UserRole.fromJson(data) as T;
    }
    if (t == _i26.HealthSignal) {
      return _i26.HealthSignal.fromJson(data) as T;
    }
    if (t == _i27.Rule) {
      return _i27.Rule.fromJson(data) as T;
    }
    if (t == _i28.Service) {
      return _i28.Service.fromJson(data) as T;
    }
    if (t == _i29.StreamIncidentUpdate) {
      return _i29.StreamIncidentUpdate.fromJson(data) as T;
    }
    if (t == _i30.StreamServiceStatus) {
      return _i30.StreamServiceStatus.fromJson(data) as T;
    }
    if (t == _i31.StreamSubscription) {
      return _i31.StreamSubscription.fromJson(data) as T;
    }
    if (t == _i32.StreamSubscriptionType) {
      return _i32.StreamSubscriptionType.fromJson(data) as T;
    }
    if (t == _i33.StreamTimelineEvent) {
      return _i33.StreamTimelineEvent.fromJson(data) as T;
    }
    if (t == _i34.StreamUpdateType) {
      return _i34.StreamUpdateType.fromJson(data) as T;
    }
    if (t == _i35.TelemetryEvent) {
      return _i35.TelemetryEvent.fromJson(data) as T;
    }
    if (t == _i36.TelemetryHeartbeat) {
      return _i36.TelemetryHeartbeat.fromJson(data) as T;
    }
    if (t == _i37.TelemetryResources) {
      return _i37.TelemetryResources.fromJson(data) as T;
    }
    if (t == _i38.TelemetrySignalBatch) {
      return _i38.TelemetrySignalBatch.fromJson(data) as T;
    }
    if (t == _i39.TelemetrySignalPayload) {
      return _i39.TelemetrySignalPayload.fromJson(data) as T;
    }
    if (t == _i1.getType<_i5.Playbook?>()) {
      return (data != null ? _i5.Playbook.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.PlaybookExecution?>()) {
      return (data != null ? _i6.PlaybookExecution.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.PlaybookStepExecution?>()) {
      return (data != null ? _i7.PlaybookStepExecution.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i8.StepExecutorPayload?>()) {
      return (data != null ? _i8.StepExecutorPayload.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i9.ExecutionStatus?>()) {
      return (data != null ? _i9.ExecutionStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.IncidentSeverity?>()) {
      return (data != null ? _i10.IncidentSeverity.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.IncidentStatus?>()) {
      return (data != null ? _i11.IncidentStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.PlaybookType?>()) {
      return (data != null ? _i12.PlaybookType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.ServiceStatus?>()) {
      return (data != null ? _i13.ServiceStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.ServiceTier?>()) {
      return (data != null ? _i14.ServiceTier.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.SignalType?>()) {
      return (data != null ? _i15.SignalType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.TimelineItemType?>()) {
      return (data != null ? _i16.TimelineItemType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.Greeting?>()) {
      return (data != null ? _i17.Greeting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.Incident?>()) {
      return (data != null ? _i18.Incident.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.IncidentTimelineItem?>()) {
      return (data != null ? _i19.IncidentTimelineItem.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i20.ReportSnapshot?>()) {
      return (data != null ? _i20.ReportSnapshot.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i21.AuditLog?>()) {
      return (data != null ? _i21.AuditLog.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.OpsUser?>()) {
      return (data != null ? _i22.OpsUser.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i23.Role?>()) {
      return (data != null ? _i23.Role.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i24.ServiceToken?>()) {
      return (data != null ? _i24.ServiceToken.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i25.UserRole?>()) {
      return (data != null ? _i25.UserRole.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i26.HealthSignal?>()) {
      return (data != null ? _i26.HealthSignal.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i27.Rule?>()) {
      return (data != null ? _i27.Rule.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i28.Service?>()) {
      return (data != null ? _i28.Service.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i29.StreamIncidentUpdate?>()) {
      return (data != null ? _i29.StreamIncidentUpdate.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i30.StreamServiceStatus?>()) {
      return (data != null ? _i30.StreamServiceStatus.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i31.StreamSubscription?>()) {
      return (data != null ? _i31.StreamSubscription.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i32.StreamSubscriptionType?>()) {
      return (data != null ? _i32.StreamSubscriptionType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i33.StreamTimelineEvent?>()) {
      return (data != null ? _i33.StreamTimelineEvent.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i34.StreamUpdateType?>()) {
      return (data != null ? _i34.StreamUpdateType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i35.TelemetryEvent?>()) {
      return (data != null ? _i35.TelemetryEvent.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i36.TelemetryHeartbeat?>()) {
      return (data != null ? _i36.TelemetryHeartbeat.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i37.TelemetryResources?>()) {
      return (data != null ? _i37.TelemetryResources.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i38.TelemetrySignalBatch?>()) {
      return (data != null ? _i38.TelemetrySignalBatch.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i39.TelemetrySignalPayload?>()) {
      return (data != null ? _i39.TelemetrySignalPayload.fromJson(data) : null)
          as T;
    }
    if (t == List<_i6.PlaybookExecution>) {
      return (data as List)
              .map((e) => deserialize<_i6.PlaybookExecution>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i6.PlaybookExecution>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i6.PlaybookExecution>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i19.IncidentTimelineItem>) {
      return (data as List)
              .map((e) => deserialize<_i19.IncidentTimelineItem>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i19.IncidentTimelineItem>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i19.IncidentTimelineItem>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i25.UserRole>) {
      return (data as List).map((e) => deserialize<_i25.UserRole>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i25.UserRole>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i25.UserRole>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i28.Service>) {
      return (data as List).map((e) => deserialize<_i28.Service>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i28.Service>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<_i28.Service>(e)).toList()
              : null)
          as T;
    }
    if (t == List<_i18.Incident>) {
      return (data as List).map((e) => deserialize<_i18.Incident>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i18.Incident>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i18.Incident>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i21.AuditLog>) {
      return (data as List).map((e) => deserialize<_i21.AuditLog>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i21.AuditLog>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i21.AuditLog>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == List<_i26.HealthSignal>) {
      return (data as List)
              .map((e) => deserialize<_i26.HealthSignal>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i26.HealthSignal>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i26.HealthSignal>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i27.Rule>) {
      return (data as List).map((e) => deserialize<_i27.Rule>(e)).toList() as T;
    }
    if (t == _i1.getType<List<_i27.Rule>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<_i27.Rule>(e)).toList()
              : null)
          as T;
    }
    if (t == List<_i39.TelemetrySignalPayload>) {
      return (data as List)
              .map((e) => deserialize<_i39.TelemetrySignalPayload>(e))
              .toList()
          as T;
    }
    try {
      return _i3.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i4.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i5.Playbook => 'Playbook',
      _i6.PlaybookExecution => 'PlaybookExecution',
      _i7.PlaybookStepExecution => 'PlaybookStepExecution',
      _i8.StepExecutorPayload => 'StepExecutorPayload',
      _i9.ExecutionStatus => 'ExecutionStatus',
      _i10.IncidentSeverity => 'IncidentSeverity',
      _i11.IncidentStatus => 'IncidentStatus',
      _i12.PlaybookType => 'PlaybookType',
      _i13.ServiceStatus => 'ServiceStatus',
      _i14.ServiceTier => 'ServiceTier',
      _i15.SignalType => 'SignalType',
      _i16.TimelineItemType => 'TimelineItemType',
      _i17.Greeting => 'Greeting',
      _i18.Incident => 'Incident',
      _i19.IncidentTimelineItem => 'IncidentTimelineItem',
      _i20.ReportSnapshot => 'ReportSnapshot',
      _i21.AuditLog => 'AuditLog',
      _i22.OpsUser => 'OpsUser',
      _i23.Role => 'Role',
      _i24.ServiceToken => 'ServiceToken',
      _i25.UserRole => 'UserRole',
      _i26.HealthSignal => 'HealthSignal',
      _i27.Rule => 'Rule',
      _i28.Service => 'Service',
      _i29.StreamIncidentUpdate => 'StreamIncidentUpdate',
      _i30.StreamServiceStatus => 'StreamServiceStatus',
      _i31.StreamSubscription => 'StreamSubscription',
      _i32.StreamSubscriptionType => 'StreamSubscriptionType',
      _i33.StreamTimelineEvent => 'StreamTimelineEvent',
      _i34.StreamUpdateType => 'StreamUpdateType',
      _i35.TelemetryEvent => 'TelemetryEvent',
      _i36.TelemetryHeartbeat => 'TelemetryHeartbeat',
      _i37.TelemetryResources => 'TelemetryResources',
      _i38.TelemetrySignalBatch => 'TelemetrySignalBatch',
      _i39.TelemetrySignalPayload => 'TelemetrySignalPayload',
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
      case _i5.Playbook():
        return 'Playbook';
      case _i6.PlaybookExecution():
        return 'PlaybookExecution';
      case _i7.PlaybookStepExecution():
        return 'PlaybookStepExecution';
      case _i8.StepExecutorPayload():
        return 'StepExecutorPayload';
      case _i9.ExecutionStatus():
        return 'ExecutionStatus';
      case _i10.IncidentSeverity():
        return 'IncidentSeverity';
      case _i11.IncidentStatus():
        return 'IncidentStatus';
      case _i12.PlaybookType():
        return 'PlaybookType';
      case _i13.ServiceStatus():
        return 'ServiceStatus';
      case _i14.ServiceTier():
        return 'ServiceTier';
      case _i15.SignalType():
        return 'SignalType';
      case _i16.TimelineItemType():
        return 'TimelineItemType';
      case _i17.Greeting():
        return 'Greeting';
      case _i18.Incident():
        return 'Incident';
      case _i19.IncidentTimelineItem():
        return 'IncidentTimelineItem';
      case _i20.ReportSnapshot():
        return 'ReportSnapshot';
      case _i21.AuditLog():
        return 'AuditLog';
      case _i22.OpsUser():
        return 'OpsUser';
      case _i23.Role():
        return 'Role';
      case _i24.ServiceToken():
        return 'ServiceToken';
      case _i25.UserRole():
        return 'UserRole';
      case _i26.HealthSignal():
        return 'HealthSignal';
      case _i27.Rule():
        return 'Rule';
      case _i28.Service():
        return 'Service';
      case _i29.StreamIncidentUpdate():
        return 'StreamIncidentUpdate';
      case _i30.StreamServiceStatus():
        return 'StreamServiceStatus';
      case _i31.StreamSubscription():
        return 'StreamSubscription';
      case _i32.StreamSubscriptionType():
        return 'StreamSubscriptionType';
      case _i33.StreamTimelineEvent():
        return 'StreamTimelineEvent';
      case _i34.StreamUpdateType():
        return 'StreamUpdateType';
      case _i35.TelemetryEvent():
        return 'TelemetryEvent';
      case _i36.TelemetryHeartbeat():
        return 'TelemetryHeartbeat';
      case _i37.TelemetryResources():
        return 'TelemetryResources';
      case _i38.TelemetrySignalBatch():
        return 'TelemetrySignalBatch';
      case _i39.TelemetrySignalPayload():
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
    if (dataClassName == 'Playbook') {
      return deserialize<_i5.Playbook>(data['data']);
    }
    if (dataClassName == 'PlaybookExecution') {
      return deserialize<_i6.PlaybookExecution>(data['data']);
    }
    if (dataClassName == 'PlaybookStepExecution') {
      return deserialize<_i7.PlaybookStepExecution>(data['data']);
    }
    if (dataClassName == 'StepExecutorPayload') {
      return deserialize<_i8.StepExecutorPayload>(data['data']);
    }
    if (dataClassName == 'ExecutionStatus') {
      return deserialize<_i9.ExecutionStatus>(data['data']);
    }
    if (dataClassName == 'IncidentSeverity') {
      return deserialize<_i10.IncidentSeverity>(data['data']);
    }
    if (dataClassName == 'IncidentStatus') {
      return deserialize<_i11.IncidentStatus>(data['data']);
    }
    if (dataClassName == 'PlaybookType') {
      return deserialize<_i12.PlaybookType>(data['data']);
    }
    if (dataClassName == 'ServiceStatus') {
      return deserialize<_i13.ServiceStatus>(data['data']);
    }
    if (dataClassName == 'ServiceTier') {
      return deserialize<_i14.ServiceTier>(data['data']);
    }
    if (dataClassName == 'SignalType') {
      return deserialize<_i15.SignalType>(data['data']);
    }
    if (dataClassName == 'TimelineItemType') {
      return deserialize<_i16.TimelineItemType>(data['data']);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_i17.Greeting>(data['data']);
    }
    if (dataClassName == 'Incident') {
      return deserialize<_i18.Incident>(data['data']);
    }
    if (dataClassName == 'IncidentTimelineItem') {
      return deserialize<_i19.IncidentTimelineItem>(data['data']);
    }
    if (dataClassName == 'ReportSnapshot') {
      return deserialize<_i20.ReportSnapshot>(data['data']);
    }
    if (dataClassName == 'AuditLog') {
      return deserialize<_i21.AuditLog>(data['data']);
    }
    if (dataClassName == 'OpsUser') {
      return deserialize<_i22.OpsUser>(data['data']);
    }
    if (dataClassName == 'Role') {
      return deserialize<_i23.Role>(data['data']);
    }
    if (dataClassName == 'ServiceToken') {
      return deserialize<_i24.ServiceToken>(data['data']);
    }
    if (dataClassName == 'UserRole') {
      return deserialize<_i25.UserRole>(data['data']);
    }
    if (dataClassName == 'HealthSignal') {
      return deserialize<_i26.HealthSignal>(data['data']);
    }
    if (dataClassName == 'Rule') {
      return deserialize<_i27.Rule>(data['data']);
    }
    if (dataClassName == 'Service') {
      return deserialize<_i28.Service>(data['data']);
    }
    if (dataClassName == 'StreamIncidentUpdate') {
      return deserialize<_i29.StreamIncidentUpdate>(data['data']);
    }
    if (dataClassName == 'StreamServiceStatus') {
      return deserialize<_i30.StreamServiceStatus>(data['data']);
    }
    if (dataClassName == 'StreamSubscription') {
      return deserialize<_i31.StreamSubscription>(data['data']);
    }
    if (dataClassName == 'StreamSubscriptionType') {
      return deserialize<_i32.StreamSubscriptionType>(data['data']);
    }
    if (dataClassName == 'StreamTimelineEvent') {
      return deserialize<_i33.StreamTimelineEvent>(data['data']);
    }
    if (dataClassName == 'StreamUpdateType') {
      return deserialize<_i34.StreamUpdateType>(data['data']);
    }
    if (dataClassName == 'TelemetryEvent') {
      return deserialize<_i35.TelemetryEvent>(data['data']);
    }
    if (dataClassName == 'TelemetryHeartbeat') {
      return deserialize<_i36.TelemetryHeartbeat>(data['data']);
    }
    if (dataClassName == 'TelemetryResources') {
      return deserialize<_i37.TelemetryResources>(data['data']);
    }
    if (dataClassName == 'TelemetrySignalBatch') {
      return deserialize<_i38.TelemetrySignalBatch>(data['data']);
    }
    if (dataClassName == 'TelemetrySignalPayload') {
      return deserialize<_i39.TelemetrySignalPayload>(data['data']);
    }
    if (dataClassName.startsWith('serverpod.')) {
      data['className'] = dataClassName.substring(10);
      return _i2.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _i3.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _i4.Protocol().deserializeByClassName(data);
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
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i5.Playbook:
        return _i5.Playbook.t;
      case _i6.PlaybookExecution:
        return _i6.PlaybookExecution.t;
      case _i7.PlaybookStepExecution:
        return _i7.PlaybookStepExecution.t;
      case _i18.Incident:
        return _i18.Incident.t;
      case _i19.IncidentTimelineItem:
        return _i19.IncidentTimelineItem.t;
      case _i20.ReportSnapshot:
        return _i20.ReportSnapshot.t;
      case _i21.AuditLog:
        return _i21.AuditLog.t;
      case _i22.OpsUser:
        return _i22.OpsUser.t;
      case _i23.Role:
        return _i23.Role.t;
      case _i24.ServiceToken:
        return _i24.ServiceToken.t;
      case _i25.UserRole:
        return _i25.UserRole.t;
      case _i26.HealthSignal:
        return _i26.HealthSignal.t;
      case _i27.Rule:
        return _i27.Rule.t;
      case _i28.Service:
        return _i28.Service.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'serverpod_sentinel';
}
