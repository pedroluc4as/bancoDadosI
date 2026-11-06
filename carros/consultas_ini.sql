/*
SELECT  placa,  dono,   preco,  ano,  km, modelo_id,  cor_id 
FROM carro
LIMIT 15;

SELECT COUNT(*) FROM Carro;

*/
\x off
SELECT * FROM Fabricante;

\x on
SELECT SUM(numero_funcionarios) total_funcionarios, 
   SUM(numero_fabricas) total_fabricas
FROM Fabricante;


SELECT SUM(numero_funcionarios) total_funcionarios, 
   AVG(numero_funcionarios) media_funcionarios,
   SUM(numero_funcionarios) / count(*) media_funcionarios,
   min(numero_funcionarios) min_funcionarios,
   MAX(numero_funcionarios) max_funcionarios
FROM Fabricante;

\x off
SELECT * FROM Fabricante
WHERE numero_funcionarios IN 
  (SELECT MAX(numero_funcionarios) from Fabricante);

SELECT * FROM Fabricante
WHERE ano_fundacao IN (1911, 1500, 2003, 1886);

\x off
SELECT pais_origem, SUM(numero_funcionarios)
FROM Fabricante
GROUP BY pais_origem;

select * from fabricante;

SELECT id, nome, ano_fundacao,
    CASE WHEN ano_fundacao <= 1930 then 'Antiga'
       ELSE 'Nova'
    END Fundacao
FROM Fabricante;

SELECT 
    CASE WHEN ano_fundacao <= 1930 then 'Antiga'
       ELSE 'Nova'
    END Fundacao,
    AVG(numero_funcionarios)::numeric(8,2) AS media_funcionarios
FROM Fabricante
GROUP BY Fundacao;