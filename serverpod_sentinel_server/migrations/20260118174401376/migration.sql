BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "ai_insight" (
    "id" bigserial PRIMARY KEY,
    "type" text NOT NULL,
    "title" text NOT NULL,
    "content" text NOT NULL,
    "severity" text,
    "serviceId" bigint,
    "incidentId" bigint,
    "confidence" double precision NOT NULL,
    "metadata" text,
    "expiresAt" timestamp without time zone,
    "createdAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX "ai_insight_service_idx" ON "ai_insight" USING btree ("serviceId");
CREATE INDEX "ai_insight_type_idx" ON "ai_insight" USING btree ("type");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "ai_insight"
    ADD CONSTRAINT "ai_insight_fk_0"
    FOREIGN KEY("serviceId")
    REFERENCES "service"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "ai_insight"
    ADD CONSTRAINT "ai_insight_fk_1"
    FOREIGN KEY("incidentId")
    REFERENCES "incident"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR serverpod_sentinel
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_sentinel', '20260118174401376', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260118174401376', "timestamp" = now();

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
