-- Active: 1756674705566@@127.0.0.1@5432@credito

-- Visualizando a tabela "CLIENTES"
SELECT * FROM "CLIENTES";

-- Renomeando a tabela "CLIENTES"
ALTER TABLE "CLIENTES" RENAME TO clientes;

-- Visualizando a tabela clientes
SELECT * FROM clientes;

-- Verificando valores duplicados
SELECT
    idcliente,
    COUNT(*)
FROM
    clientes
GROUP BY
    idcliente
HAVING
    COUNT(*) > 1;

-- Verificando valores nulos
SELECT * FROM clientes WHERE idcliente IS NULL;

-- Encontrar o próximo valor de idcliente
SELECT MAX(idcliente) + 1 FROM clientes;

-- Criar uma sequência
CREATE SEQUENCE clientes_id_seq MINVALUE 6;

-- Alterar a tabela para usar a sequência
ALTER TABLE clientes ALTER idcliente SET DEFAULT NEXTVAL('clientes_id_seq');

-- Associar a sequência à coluna
ALTER SEQUENCE clientes_id_seq OWNED BY clientes.idcliente;

-- Adicionando uma restrição NOT NULL à coluna
ALTER TABLE clientes ALTER idcliente SET NOT NULL;

-- Adicionando a Chave Primária
ALTER TABLE
    clientes
ADD CONSTRAINT
    pk_clt_idcliente
PRIMARY KEY
    (idcliente);

