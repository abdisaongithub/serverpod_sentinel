BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "chaos_experiment" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "description" text,
    "serviceId" bigint NOT NULL,
    "type" text NOT NULL,
    "config" text NOT NULL,
    "status" text NOT NULL,
    "scheduledAt" timestamp without time zone,
    "startedAt" timestamp without time zone,
    "finishedAt" timestamp without time zone,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL
);

--
-- ACTION ALTER TABLE
--
ALTER TABLE "ops_user" ADD COLUMN "mfaSecret" text;
ALTER TABLE "ops_user" ADD COLUMN "mfaEnabled" boolean NOT NULL DEFAULT false;
--
-- ACTION CREATE TABLE
--
CREATE TABLE "outgoing_webhook" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "url" text NOT NULL,
    "events" json NOT NULL,
    "secret" text,
    "isEnabled" boolean NOT NULL,
    "lastTriggeredAt" timestamp without time zone,
    "lastResponseCode" bigint,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "remediation_policy" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "event" text NOT NULL,
    "serviceId" bigint,
    "playbookId" bigint NOT NULL,
    "autoExecute" boolean NOT NULL DEFAULT true,
    "requireApproval" boolean NOT NULL DEFAULT false,
    "isEnabled" boolean NOT NULL DEFAULT true,
    "maxRetries" bigint NOT NULL DEFAULT 3,
    "cooldownPeriod" bigint NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "sentinel_api_key" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "key" text NOT NULL,
    "keyHash" text NOT NULL,
    "scopes" json NOT NULL,
    "userId" bigint,
    "lastUsedAt" timestamp without time zone,
    "expiresAt" timestamp without time zone,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "sentinel_api_key_hash_idx" ON "sentinel_api_key" USING btree ("keyHash");

--
-- ACTION ALTER TABLE
--
ALTER TABLE "service" ADD COLUMN "region" text NOT NULL DEFAULT 'us-east-1'::text;
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "chaos_experiment"
    ADD CONSTRAINT "chaos_experiment_fk_0"
    FOREIGN KEY("serviceId")
    REFERENCES "service"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "remediation_policy"
    ADD CONSTRAINT "remediation_policy_fk_0"
    FOREIGN KEY("serviceId")
    REFERENCES "service"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "remediation_policy"
    ADD CONSTRAINT "remediation_policy_fk_1"
    FOREIGN KEY("playbookId")
    REFERENCES "playbook"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "sentinel_api_key"
    ADD CONSTRAINT "sentinel_api_key_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "ops_user"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR serverpod_sentinel
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_sentinel', '20260129111637483', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260129111637483', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20251208110333922-v3-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251208110333922-v3-0-0', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_idp
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_idp', '20260109031533194', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260109031533194', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth', '20250825102351908-v3-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250825102351908-v3-0-0', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_core
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_core', '20251208110412389-v3-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251208110412389-v3-0-0', "timestamp" = now();


COMMIT;
