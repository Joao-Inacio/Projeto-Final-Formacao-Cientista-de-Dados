-- Active: 1780585782525@@127.0.0.1@5432@db-credito
SELECT * FROM "INVESTIMENTOS";

-- Renomeando a tabela
ALTER TABLE "INVESTIMENTOS" RENAME TO investimentos;

-- Selecionando todos os registros da tabela
SELECT * FROM investimentos;

-- Renomeando a coluna IDINVESTIMENTOS para idinvestimentos
ALTER TABLE investimentos RENAME COLUMN "IDINVESTIMENTOS" TO idinvestimentos;

-- Renomeando a coluna "INVESTIMENTOS" para investimento
ALTER TABLE investimentos RENAME COLUMN "INVESTIMENTOS" TO investimento;

-- Verificando o proximo ID
SELECT MAX(idinvestimentos) + 1 FROM investimentos;

-- Criando uma sequencia para a tabela investimentos
CREATE SEQUENCE investimentos_idinvestimentos_seq MINVALUE 6;

-- Alterando o proximo valor da sequencia
ALTER TABLE investimentos ALTER COLUMN idinvestimentos SET DEFAULT NEXTVAL('investimentos_idinvestimentos_seq');

-- Alterando a Sequencia
ALTER SEQUENCE investimentos_idinvestimentos_seq OWNED BY investimentos.idinvestimentos;

-- Setando o valor para NOT NULL
ALTER TABLE investimentos ALTER COLUMN idinvestimentos SET NOT NULL;

-- Criando a chave primaria
ALTER TABLE
    investimentos
ADD CONSTRAINT
    pk_investimentos_idinvestimentos
PRIMARY KEY
    (idinvestimentos);
