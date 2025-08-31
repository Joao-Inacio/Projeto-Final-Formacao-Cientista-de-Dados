SELECT * FROM "OUTROSFINANC";

-- Renomeando a tabela
ALTER TABLE "OUTROSFINANC" RENAME TO outrasfinancas;

-- Consultando a tabela
SELECT * FROM outrasfinancas;

ALTER TABLE outrasfinancas RENAME TO outrosfinanciamentos;

SELECT * FROM outrosfinanciamentos;


-- Renomeando a coluna IDOUTROSFINANC para idoutrasfinancas
ALTER TABLE outrosfinanciamentos RENAME COLUMN "IDOUTROSFINANC" TO idoutrosfinanc;

-- Renomeando a coluna "OUTROSFINANCIAMENTOS" para outrosfinanciamentos
ALTER TABLE outrosfinanciamentos RENAME COLUMN "OUTROSFINANCIAMENTOS" TO outrosfinanciamentos;

-- Verificando o proximo ID de idoutrosfinanc
SELECT MAX(idoutrosfinanc) + 1 FROM outrosfinanciamentos;

-- Criando uma sequencia para a tabela idoutrosfinanc
CREATE SEQUENCE outrosfinanciamentos_idoutrosfinanc_seq MINVALUE 4;

-- Alterando o proximo valor da sequencia
ALTER TABLE outrosfinanciamentos ALTER COLUMN idoutrosfinanc SET DEFAULT NEXTVAL('outrosfinanciamentos_idoutrosfinanc_seq');

-- Alterando a Sequencia
ALTER SEQUENCE outrosfinanciamentos_idoutrosfinanc_seq OWNED BY outrosfinanciamentos.idoutrosfinanc;

-- Setando o valor para NOT NULL para a coluna idoutrosfinanc
ALTER TABLE outrosfinanciamentos ALTER COLUMN idoutrosfinanc SET NOT NULL;

-- Criando a chave primaria para a coluna idoutrosfinanc
ALTER TABLE
    outrosfinanciamentos
ADD CONSTRAINT
    pk_outrosfinanciamentos_idoutrosfinanc
PRIMARY KEY
    (idoutrosfinanc);
