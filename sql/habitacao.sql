-- Active: 1756674705566@@127.0.0.1@5432@credito
SELECT * FROM "HABITACAO";

-- Alterando o nome
ALTER TABLE "HABITACAO" RENAME TO habitacao;

-- Selecionando a coluna
SELECT * FROM habitacao;

-- Alterando o nome da coluna de id
ALTER TABLE habitacao RENAME COLUMN "IDHABITACAO" TO idhabitacao;

-- Alternado o nome da coluna de tipo
ALTER TABLE habitacao RENAME COLUMN "HABITACAO" TO tipohabitacao;

-- vendo o proximo valor de id para criar a chave primaria
SELECT MAX(idhabitacao) + 1 FROM habitacao;

-- Criando a sequencia
CREATE SEQUENCE habitacao_id_seq MINVALUE 4;

-- Alterando o valor
ALTER TABLE habitacao ALTER idhabitacao SET DEFAULT NEXTVAL('habitacao_id_seq');

-- Alterando a sequencia
ALTER SEQUENCE habitacao_id_seq OWNED BY habitacao.idhabitacao;

-- Alterando a configuração da coluna
ALTER TABLE habitacao ALTER idhabitacao SET NOT NULL;

-- Criando a chave primaria
ALTER TABLE
    habitacao
ADD CONSTRAINT
    pk_hbt_idhabitacao
PRIMARY KEY
    (idhabitacao);
