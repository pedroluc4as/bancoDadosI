--1. Qual é o menor preço entre os veículos da Ferrari?
SELECT 

--2. Qual é o maior preço entre os veículos da Tesla?

--3. Qual é a quilometragem média dos veículos elétricos cadastrados?

--4. Quantos veículos possuem pintura metalizada?

SELECT COUNT (*) quant_carros_metalizados
FROM Carro Join Cor ON Carro.cor_id = Cor.id
WHERE Cor.metalizada =  true;

--5. Qual é a diferença entre o ano de fabricação do veículo mais antigo e o do mais novo?

SELECT MAX(ano) - min(ano) diferenca
FROM carro;

--6. Qual é a quantidade de veículos e o preço médio dos automóveis com menos de 10.000 quilômetros rodados?

--7. Quantos veículos cada fabricante possui? Apresente os fabricantes do maior para o menor número de veículos.

--8. Qual é o valor total dos veículos cadastrados, excluindo aqueles fabricados antes de 2010?

--9. Qual é o valor total dos veículos pertencentes a pessoas nascidas antes de 1980?

--10. Quantos veículos foram fabricados em cada década?

--11. Qual é o preço médio dos veículos de cada fabricante? Apresente os resultados do maior para o menor preço médio.

--12. Quantos veículos existem de cada tipo de propulsão?

--13. Quantos veículos existem de cada cor comercial?

--14. Qual é o valor total dos veículos com acabamento perolizado?

--15. Qual é a quilometragem média dos veículos de cada modelo?

--16. Qual é a quantidade de veículos em cada condição de conservação?

--17. Qual é o maior preço registrado para os veículos de cada modelo?

--18. Quantos veículos de cada modelo estão cadastrados em cada fabricante?

--19. Quantos veículos de cada fabricante possuem acabamento metálico ou perolizado?

--20. Quantos veículos de cada modelo da Ferrari foram fabricados em cada ano?

--21. Qual é o preço médio dos veículos de cada fabricante para cada cor comercial?

--22. Qual é a quantidade de veículos, o valor total e o preço médio dos automóveis pertencentes a cada proprietário? Apresente os resultados do maior para o menor patrimônio automobilístico.

--23. Quais fabricantes possuem a maior quantidade de veículos elétricos e híbridos? Apresente a quantidade de veículos de cada tipo de propulsão por fabricante, em ordem decrescente de quantidade.

--24. Qual é a quantidade de veículos, o valor total e a quilometragem média dos automóveis de cada fabricante, em cada estado de conservação e tipo de propulsão?

--25. Quais são as cores comerciais mais utilizadas em cada fabricante? Apresente a quantidade de veículos de cada cor, em ordem decrescente de quantidade.

--26. Qual é a potência média dos veículos de cada fabricante, separados por tipo de propulsão?

--27. Qual é o preço médio, o menor preço e o maior preço dos veículos de cada fabricante, em cada condição de conservação?

--28. Quais fabricantes possuem modelos com maior consumo médio? Apresente o consumo médio e a potência média dos modelos de cada fabricante, em ordem decrescente de consumo médio.

--29. Qual é a quantidade de veículos, o valor total, o preço médio, o menor preço e o maior preço dos automóveis de cada fabricante, modelo e tipo de propulsão?

--30. Para o proprietário com maior número de veículos, quantos veículos de cada fabricante e modelo ele possui?
