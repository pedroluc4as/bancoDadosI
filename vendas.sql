\c eng5_vendas

DROP TABLE IF EXISTS Venda;
DROP TABLE IF EXISTS Cliente;


CREATE TABLE Cliente
(
    id int NOT NULL PRIMARY KEY,
    nome varchar(60) NOT NULL,
    cpf varchar(14) NULL UNIQUE,
    data_nasc date,
    telefone1 varchar(16) NOT NULL,
    telefone2 VarCHAR(16) NULL
);

CREATE TABLE Venda
(
    codigo int NOT NULL PRIMARY KEY,
    data_hora timestamp NOT NULL,
    valor_total numeric(9,2) NOT NULL,
    forma_pagto varchar(20) NOT NULL,
    cliente_id int NOT NULL REFERENCES Cliente(ID)
);

INSERT INTO Cliente (id, nome, telefone1)
   VALUES (7, 'Isadora Martins', '67 99991-1111');

INSERT INTO Cliente (id, nome, telefone1, cpf)
   VALUES (10, 'Pedro Henrique', '67 9988-0000', '000.000.000-00');

SELECT *
FROM Cliente;
