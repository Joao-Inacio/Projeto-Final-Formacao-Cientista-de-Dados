-- Active: 1780585782525@@127.0.0.1@5432@db-credito

SELECT * FROM "ESTADOCIVIL";

ALTER TABLE "ESTADOCIVIL" RENAME TO estadocivil;

SELECT * FROM estadocivil;

ALTER TABLE estadocivil RENAME COLUMN "IDESTADOCIVIL" TO idestadocivil;

ALTER TABLE estadocivil RENAME COLUMN "ESTADOCIVIL" TO descricao;

SELECT MAX(idestadocivil) + 1 FROM estadocivil;

CREATE SEQUENCE estadocivil_id_seq MINVALUE 5;

ALTER TABLE estadocivil ALTER idestadocivil SET DEFAULT NEXTVAL('estadocivil_id_seq');

ALTER SEQUENCE estadocivil_id_seq OWNED BY estadocivil.idestadocivil;

ALTER TABLE estadocivil ALTER idestadocivil SET NOT NULL;

ALTER TABLE
    estadocivil
ADD CONSTRAINT
    pk_epg_idestadocivil
PRIMARY KEY
    (idestadocivil);
