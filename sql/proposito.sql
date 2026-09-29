-- Active: 1780585782525@@127.0.0.1@5432@db-credito
SELECT * FROM "PROPOSITO";

-- Alterando o nome da tabela "PROPOSITO" para propósitos
ALTER TABLE "PROPOSITO" RENAME TO propositos;

-- Consultando a tabela propositos
SELECT * FROM propositos;

-- Alterando o nome da coluna "IDPROPOSITO" para idproposito
ALTER TABLE propositos RENAME COLUMN "IDPROPOSITO" TO idproposito;

-- Alterando o nome da coluna "PROPOSITO" para proposito
ALTER TABLE propositos RENAME COLUMN "PROPOSITO" TO proposito;

-- Visualizando o proximo valor de idproposito
SELECT MAX(idproposito) + 1 FROM propositos;

-- Criando uma sequencia para a coluna idproposito
CREATE SEQUENCE propositos_idproposito_seq MINVALUE 11;

-- Alterando o proximo valor da sequencia
ALTER TABLE propositos ALTER COLUMN idproposito SET DEFAULT NEXTVAL('propositos_idproposito_seq');

-- Alterando a sequencia para a coluna idproposito
ALTER SEQUENCE propositos_idproposito_seq OWNED BY propositos.idproposito;

-- Setando o valor NOT NULL
ALTER TABLE propositos ALTER COLUMN idproposito SET NOT NULL;

-- Criando uma chave primária para a tabela propositos
ALTER TABLE
    propositos
ADD CONSTRAINT
    pk_propositos_idproposito
PRIMARY KEY
    (idproposito);
