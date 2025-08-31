-- Active: 1756674705566@@127.0.0.1@5432@credito
SELECT * FROM "HISTORICO_CREDITO";


-- Renomeando a tabela HISTORICO_CREDITO para historico_credito
ALTER TABLE "HISTORICO_CREDITO" RENAME TO historico_credito;

--
SELECT * FROM historico_credito;

-- Renomeando a coluna IDHISTCRED para idhistcred
ALTER TABLE historico_credito RENAME COLUMN "IDHISTCRED" TO idhistcred;

-- Renomeando a coluna HISTORICO para historico
ALTER TABLE historico_credito RENAME COLUMN "HISTORICO" TO historico;

-- Verificando o proximo ID
SELECT MAX(idhistcred) + 1 FROM historico_credito;

-- Criando uma sequencia para a tabela historico_credito
CREATE SEQUENCE historico_credito_id_seq MINVALUE 6;

-- Alterando o proximo valor da sequencia
ALTER TABLE historico_credito ALTER idhistcred SET DEFAULT NEXTVAL('historico_credito_id_seq');

-- Alterando a sequencia para a coluna idhistcred
ALTER SEQUENCE historico_credito_id_seq OWNED BY historico_credito.idhistcred;

-- Setando o valor para NOT NULL
ALTER TABLE historico_credito ALTER idhistcred SET NOT NULL;

-- Criando uma chave primaria para a tabela historico_credito
ALTER TABLE
    historico_credito
ADD CONSTRAINT
    pk_histcred_idhistcred
PRIMARY KEY
    (idhistcred);
