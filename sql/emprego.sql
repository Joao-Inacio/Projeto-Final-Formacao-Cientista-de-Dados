-- Active: 1756674705566@@127.0.0.1@5432@credito
SELECT * FROM "EMPREGO";

ALTER TABLE "EMPREGO" RENAME TO emprego;

ALTER TABLE emprego RENAME TO empregos;

SELECT * FROM empregos;

ALTER TABLE empregos RENAME COLUMN "IDEMPREGO" TO idemprego;

ALTER TABLE empregos RENAME COLUMN "EMPREGO" TO emprego;

SELECT MAX(idemprego) + 1 FROM empregos;

CREATE SEQUENCE emprego_id_seq MINVALUE 6;

ALTER TABLE empregos ALTER idemprego SET DEFAULT NEXTVAL('emprego_id_seq');

ALTER SEQUENCE emprego_id_seq OWNED BY empregos.idemprego;

ALTER TABLE empregos ALTER idemprego SET NOT NULL;

ALTER TABLE
    empregos
ADD CONSTRAINT
    pk_epg_idemprego
PRIMARY KEY
    (idemprego);
