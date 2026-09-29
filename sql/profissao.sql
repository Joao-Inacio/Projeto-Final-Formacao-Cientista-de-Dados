-- Active: 1780585782525@@127.0.0.1@5432@db-credito
SELECT * FROM "PROFISSAO";

-- Alteração do nome da tabela de "PROFISSAO" para profissoes
ALTER TABLE "PROFISSAO" RENAME TO profissoes;

-- Selecionando a tabela profissoes
SELECT * FROM profissoes;

-- Alteração do nome da coluna de "IDPROFISSAO" para idprofissao
ALTER TABLE profissoes RENAME COLUMN "IDPROFISSAO" TO idprofissao;

-- Alteração do nome da coluna de "PROFISSAO" para nomeprofissao
ALTER TABLE profissoes RENAME COLUMN "PROFISSAO" TO nomeprofissao;

-- Verificando o proximo ID do idprofissao
SELECT MAX(idprofissao) + 1 FROM profissoes;

-- Criando uma sequencia para a coluna idprofissao
CREATE SEQUENCE profissoes_idprofissao_seq MINVALUE 5;

-- Alterando o proximo valor da sequencia
ALTER TABLE profissoes ALTER COLUMN idprofissao SET DEFAULT NEXTVAL('profissoes_idprofissao_seq');

-- Alterando a Sequencia
ALTER SEQUENCE profissoes_idprofissao_seq OWNED BY profissoes.idprofissao;

-- Setando o valor para NOT NULL
ALTER TABLE profissoes ALTER COLUMN idprofissao SET NOT NULL;

-- Criando uma chave primaria para a tabela profissoes
ALTER TABLE
    profissoes
ADD CONSTRAINT
    pk_profissoes_idprofissao
PRIMARY KEY
    (idprofissao);



