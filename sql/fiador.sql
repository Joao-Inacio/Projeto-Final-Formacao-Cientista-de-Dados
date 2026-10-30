-- Active: 1792517032271@@127.0.0.1@5432@db_creditos
ALTER TABLE "FIADOR" RENAME TO fiador;

SELECT * FROM fiador;

ALTER TABLE fiador RENAME COLUMN "IDFIADOR" TO idfiador;

ALTER TABLE fiador RENAME COLUMN "FIADOR" TO descricao;

SELECT MAX(idfiador) + 1 FROM fiador;

CREATE SEQUENCE fiador_id_seq MINVALUE 5;

ALTER TABLE fiador ALTER idfiador SET DEFAULT NEXTVAL('fiador_id_seq');

ALTER SEQUENCE fiador_id_seq OWNED BY fiador.idfiador;

ALTER TABLE fiador ALTER idfiador SET NOT NULL;

ALTER TABLE
    fiador
ADD CONSTRAINT
    pk_fdr_idfiador
PRIMARY KEY
    (idfiador);
