BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "telemetry_heartbeat" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "telemetry_heartbeat" (
    "id" bigserial PRIMARY KEY,
    "serviceId" bigint NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    "uptimeSeconds" bigint NOT NULL,
    "version" text NOT NULL,
    "status" text NOT NULL,
    "resources" json
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "telemetry_heartbeat"
    ADD CONSTRAINT "telemetry_heartbeat_fk_0"
    FOREIGN KEY("serviceId")
    REFERENCES "service"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR serverpod_sentinel
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_sentinel', '20260126174308278', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260126174308278', "timestamp" = now();

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
