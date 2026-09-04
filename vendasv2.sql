
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

INSERT INTO Cliente (id, nome, telefone1, cpf)
   VALUES (15, 'Fernando Lemos', '67 1200-3579', NULL);

INSERT INTO Cliente (id, nome, telefone1, cpf)
   VALUES (1, 'André Silva', '81 9988-0000', NULL);

INSERT INTO Cliente (id, data_nasc, nome, telefone1)
   VALUES (100, '1967/10/12', 'ANDRÉ Silva', '81 9988-0000');

INSERT INTO Cliente (id, data_nasc, nome, telefone1)
   VALUES (420, '1567/10/12', 'André Silva', '81 9988-0000');



SELECT * FROM Cliente;

select nome, cpf from cliente;

select cpf, nome from cliente;

SELECT * FROM Cliente ORDER BY ID;
SELECT * FROM Cliente ORDER BY nome;
SELECT * FROM Cliente ORDER BY data_nasc ASC;

SELECT * FROM Cliente ORDER BY nome DESC;

SELECT ID, data_nasc, nome FROM Cliente ORDER BY nome DESC;

SELECT ID, data_nasc, nome 
FROM Cliente 
WHERE id > 10
ORDER BY nome DESC;

SELECT * 
FROM Cliente 
WHERE id > 10
ORDER BY nome DESC;

SELECT * 
FROM Cliente 
WHERE id = 10
ORDER BY nome DESC;


SELECT ID, data_nasc, nome 
FROM Cliente 
WHERE nome = 'André Silva'
ORDER BY nome DESC;

SELECT * 
FROM Cliente 
ORDER BY nome, id desc;

SELECT id, data_nasc,  
 --  now(),
   AGE(data_nasc),
   AGE('1900/1/1', data_nasc),
   nome
FROM Cliente
ORDER BY ID;


/*
CREATE TABLE Venda
(
    codigo int NOT NULL PRIMARY KEY,
    data_hora timestamp NOT NULL,
    valor_total numeric(9,2) NOT NULL,
    forma_pagto varchar(20) NOT NULL,
    cliente_id int NOT NULL REFERENCES Cliente(ID)
);
*/

INSERT INTO Venda (codigo, data_hora, valor_total, forma_pagto, cliente_id)
   VALUES (1, '2020/10/15 12:00', 10000, 'PIX', 7);

INSERT INTO Venda (codigo, data_hora, valor_total, forma_pagto, cliente_id)
   VALUES (2, '2026/1/20 10:30', 350, 'pix', 10);

INSERT INTO Venda (codigo, data_hora, valor_total, forma_pagto, cliente_id)
   VALUES (40, '2025/09/15 2:47', 350, 'pix', 10);

INSERT INTO Venda (codigo, data_hora, valor_total, forma_pagto, cliente_id)
   VALUES (115, '2025/09/15 2:47', 500, 'crédito', 420);

SELECT * FROM Venda;

SELECT * FROM Venda
order by codigo;


SELECT *
FROM Venda
order by cliente_id;


SELECT *
FROM Venda
order by valor_total DESC;

SELECT Venda.data_hora, Cliente.nome, 
  venda.forma_pagto, venda.valor_total
FROM Venda JOIN Cliente 
   ON (Venda.cliente_ID = Cliente.ID)
WHERE venda.valor_total > 400;


SELECT Venda.data_hora, Cliente.nome, 
  venda.forma_pagto, venda.valor_total,
  date_part('month', Venda.data_hora)
FROM Venda JOIN Cliente 
   ON (Venda.cliente_ID = Cliente.ID);

SELECT Venda.data_hora, Cliente.nome, 
  venda.forma_pagto, venda.valor_total,
  date_part('month', Venda.data_hora)
FROM Venda JOIN Cliente 
   ON (Venda.cliente_ID = Cliente.ID)
WHERE date_part('month', Venda.data_hora) >= 9;

CREATE TABLE Produto 
(
    ID INT NOT NULL PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    preco Numeric(9,2) NOT NULL,
    estoque INT NOT NULL
);

CREATE TABLE Produto_Venda
(
    ID
);