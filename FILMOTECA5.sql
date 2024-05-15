-- SELECT DE TODOS OS FILMES COM ANO ANTERIOR A 2000
/*

*/

SELECT *
FROM FILME 
WHERE ANO_FILME <2000
	

-- SELECT DE FILMES ENTRE 2005 E 2010

SELECT *
FROM FILME
WHERE ANO_FILME >=2005 AND ANO_FILME <=2010

SELECT *
FROM FILME
WHERE ANO_FILME BETWEEN 2005 AND 2010


--01 - SELECIONAR TODOS OS DIRETORES

SELECT *
FROM DIRETOR

--02 - SELECIONAR TODOS OS ATORES

SELECT *
FROM FILME_ATOR

--03 - SELECIONAR TODOS OS GENEROS

SELECT *
FROM GENERO

--04 - SELECIONAR TODOS OS FILMES, EXCLU�DOS, OU N�O 

SELECT NOME_FILME, DATA_EXCLUSAO_FILME
FROM FILME

--05 - SELECIONAR OS DIRETORES EM ORDEM DE NOME 

SELECT * 
FROM DIRETOR 
ORDER BY NOME_DIRETOR

--06 - SELECIONAR OS ATORES EM ORDEM DE C�DIGO

SELECT *
FROM ATOR
ORDER BY ID_ATOR 

--07 - SELECIONAR OS GENEROS EM ORDEM DECRESCENTE DO NOME

SELECT *
FROM GENERO
ORDER BY NOME_GENERO DESC

--08 - SELECIONAR O ANO, O NOME ORIGINAL, O NOME EM PORTUGU�S E O C�DIGO IMDB DOS FILMES

SELECT ANO_FILME, NOME_ORIGINAL_FILME, NOME_FILME, ID_IMDB_FILME
FROM FILME

--09 - SELECIONAR O NOME ORIGINAL DO FILME, O NOME DO DIRETOR, OS NOMES DOS ATORES E O NOME DOS G�NEROS

SELECT NOME_ORIGINAL_FILME, NOME_DIRETOR
FROM FILME 
JOIN DIRETOR 
ON FILME.ID_DIRETOR = DIRETOR.ID_DIRETOR

SELECT NOME_ORIGINAL_FILME, NOME_DIRETOR
FROM FILME AS F
JOIN DIRETOR AS D
ON F.ID_DIRETOR = D.ID_DIRETOR

--COMECEI A FAZER DE NOVO AQUI, PARA TREINAR PARA PROVA
-- SELECT DE TODOS OS FILMES COM ANO ANTERIOR A 2000

select NOME_FILME, ANO_FILME
from filme 
where ANO_FILME <2000

-- SELECT DE FILMES ENTRE 2005 E 2010

SELECT *
FROM FILME
WHERE ANO_FILME BETWEEN 2005 AND 2010

--SELECT DE FILMES ONDE CONTEM RAMBO NA COLUNA NOME_ORIGINAL_FILME


SELECT *
FROM FILME 
WHERE NOME_ORIGINAL_FILME LIKE '%RAMBO%'


--01 - SELECIONAR TODOS OS DIRETORES

SELECT *
FROM DIRETOR

--02 - SELECIONAR TODOS OS ATORES

SELECT *
FROM ATOR

--03 - SELECIONAR TODOS OS GENEROS

SELECT *
FROM GENERO

--04 - SELECIONAR TODOS OS FILMES, EXCLU�DOS, OU N�O 

SELECT NOME_FILME, DATA_EXCLUSAO_FILME
FROM FILME

--05 - SELECIONAR OS DIRETORES EM ORDEM DE NOME 

SELECT *
FROM DIRETOR
ORDER BY NOME_DIRETOR ASC

--06 - SELECIONAR OS ATORES EM ORDEM DE C�DIGO

SELECT *
FROM ATOR
ORDER BY ID_ATOR ASC

--07 - SELECIONAR OS GENEROS EM ORDEM DECRESCENTE DO NOME

SELECT *
FROM GENERO 
ORDER BY NOME_GENERO DESC

--08 - SELECIONAR O ANO, O NOME ORIGINAL, O NOME EM PORTUGU�S E O C�DIGO IMDB DOS FILMES

SELECT ANO_FILME, NOME_ORIGINAL_FILME, NOME_FILME, ID_IMDB_FILME
FROM FILME 

--09 - SELECIONAR O NOME ORIGINAL DO FILME, O NOME DO DIRETOR, OS NOMES DOS ATORES E O NOME DOS G�NEROS

SELECT NOME_ORIGINAL_FILME, NOME_DIRETOR, NOME_ATOR, NOME_GENERO
FROM FILME 
JOIN DIRETOR
ON FILME.ID_DIRETOR = DIRETOR.ID_DIRETOR

JOIN FILME_ATOR
ON FILME.ID_FILME = FILME_ATOR.ID_FILME
JOIN ATOR
ON FILME_ATOR.ID_ATOR = ATOR.ID_ATOR

JOIN FILME_GENERO
ON FILME.ID_FILME = FILME_GENERO.ID_FILME
JOIN GENERO
ON FILME_GENERO.ID_GENERO = GENERO.ID_GENERO


--10 - SELECIONAR TODOS OS G�NEROS COM AS QUANTIDADES DE FILMES DE CADA UM

SELECT GENERO.NOME_GENERO, COUNT(*) as 'Qtde de filmes'
FROM GENERO
JOIN FILME_GENERO
ON GENERO.ID_GENERO = FILME_GENERO.ID_GENERO
GROUP BY NOME_GENERO

---SELECT COM TODOS OS FILMES DOS ANOS 2010,2012 E 2014

SELECT *
FROM FILME
WHERE ANO_FILME IN (2010,2012,2014)

---- SELECIONAR TODOS OS FILMES MAIS ANTIGOS DO ALIEN, OU SEJA, ONDE O ANO � MENOR QUE 2000 E TODOS OS FILMES NOVOS DO HIGHLANDER, OU SEJA, ONDE O ANO � POSTERIOR A 2000

SELECT *
FROM FILME
WHERE NOME_FILME LIKE '%ALIEN%' AND ANO_FILME <2000 OR NOME_FILME LIKE '%HIGHLANDER%'AND ANO_FILME >2000

--11 - SELECIONAR TODOS OS ANOS DOS FILMES, COM AS QUANTIDADES DE FILMES DE CADA UM, ORDENADO DO ANO MAIS RECENTE PARA O MAIS ANTIGO

SELECT ANO_FILME, COUNT(*) AS 'QTDE DE FILMES ANO' 
FROM FILME
GROUP BY ANO_FILME
ORDER BY ANO_FILME DESC

--11,5 - SELECIONAR TODOS OS ANOS DOS FILMES, COM AS QUANTIDADES DE FILMES DE CADA UM, ORDENADO DO ANO MAIS RECENTE PARA O MAIS ANTIGO, POREM RETORNAR APENAS OS ANOS QUE TIVEREM MAIS DE 5 FILMES


SELECT ANO_FILME, COUNT(*) AS 'QTDE DE FILMES ANO' 
FROM FILME
GROUP BY ANO_FILME
HAVING COUNT (*)>5
ORDER BY ANO_FILME DESC

--12 - SELECIONAR TODOS OS FILMES DE ANOS COM MAIS DE 3 FILMES
SELECT ANO_FILME, COUNT(*) AS 'QTDE DE FILMES ANO' 
FROM FILME
GROUP BY ANO_FILME
HAVING COUNT (*)>3

--13 - SELECIONAR TODOS OS DIRETORES QUE FIZERAM MAIS DE UM FILME
SELECT DIRETOR.NOME_DIRETOR, COUNT(*) AS 'QTDE DE FILMES FEITOS'
FROM DIRETOR
JOIN FILME
ON DIRETOR.ID_DIRETOR = FILME.ID_DIRETOR
GROUP BY NOME_DIRETOR
HAVING COUNT(*)>1

--14 - SELECIONAR TODOS OS FILMES EM QUE O PERSONAGEM SINESTRO APARECE (FAZER UTILIZANDO JOIN E SUB QUERY)

SELECT NOME_FILME, FILME_ATOR.NOME_PERSONAGEM
FROM FILME 
JOIN FILME_ATOR
ON FILME.ID_FILME = FILME_ATOR.ID_FILME
WHERE FILME_ATOR.NOME_PERSONAGEM LIKE '%SINESTRO'

-- SUB QUERY

SELECT NOME_FILME
FROM FILME	
WHERE ID_FILME IN (SELECT ID_FILME
FROM FILME_ATOR
WHERE NOME_PERSONAGEM LIKE '%SINESTRO%')



--15 - SELECIONAR TODOS OS FILMES EM QUE O ATOR JAMES EARL JONES TRABALHOU, RETORNAR TAMBEM A COLUNA COM O NOME DO ATOR

SELECT FILME.NOME_FILME, ATOR.NOME_ATOR
FROM FILME
JOIN FILME_ATOR 
ON FILME.ID_FILME = FILME_ATOR.ID_FILME
JOIN ATOR
ON FILME_ATOR.ID_ATOR = ATOR.ID_ATOR
WHERE ATOR.NOME_ATOR LIKE 'JAMES EARL JONES'

--16 - SELECIONAR TODOS OS FILMES DE 2012, EXCLU�DOS, OU N�O

SELECT *
FROM FILME
WHERE ANO_FILME = 2012

--17 - SELECIONAR TODOS OS FILMES DO DIRETOR RIDLEY SCOTT. RETORNAR TAMBEM A COLUNA COM O NOME DO DIRETOR

SELECT F.NOME_FILME, D.NOME_DIRETOR
FROM FILME F
JOIN DIRETOR D
ON F.ID_DIRETOR = D.ID_DIRETOR
WHERE NOME_DIRETOR = 'RIDLEY SCOTT'

--18 - SELECIONAR OS NOMES DE TODOS OS ATORES QUE TAMB�M FORAM DIRETORES EM ALGUM FILME

SELECT F.NOME_FILME, D.NOME_DIRETOR, A.NOME_ATOR
FROM FILME F
JOIN FILME_ATOR FA 
ON F.ID_FILME = FA.ID_FILME
JOIN ATOR A 
ON FA.ID_ATOR = A.ID_ATOR
JOIN DIRETOR D 
ON F.ID_DIRETOR = D.ID_DIRETOR
WHERE A.NOME_ATOR = NOME_DIRETOR

--20 - SELECIONAR OS TR�S DIRETORES QUE FIZERAM MAIS FILMES

SELECT TOP (3) WITH TIES NOME_DIRETOR, COUNT (*) AS 'QTDE DE FILME'
FROM DIRETOR D
JOIN FILME F
ON D.ID_DIRETOR = F.ID_DIRETOR
GROUP BY NOME_DIRETOR
ORDER BY COUNT(*) DESC

--20.5 - SELECIONAR OS TR�S ATORES QUE FIZERAM MENOS FILMES
SELECT TOP (3) WITH TIES NOME_ATOR, COUNT (*) AS 'QTDE DE FILME'
FROM ATOR A
JOIN FILME_ATOR FA
ON A.ID_ATOR = FA.ID_ATOR
JOIN FILME F
ON FA.ID_FILME = F.ID_FILME
GROUP BY NOME_ATOR
ORDER BY COUNT (*) ASC

--21 - SELECIONAR OS CINCO G�NEROS COM MENOS FILMES

SELECT TOP (5) WITH TIES G.ID_GENERO, G.NOME_GENERO, COUNT (*) AS 'QTDE DE GENERO'
FROM FILME F
JOIN FILME_GENERO FG
ON F.ID_FILME = FG.ID_FILME
JOIN GENERO G
ON FG.ID_GENERO = G.ID_GENERO
GROUP BY G.ID_GENERO, G.NOME_GENERO
ORDER BY [QTDE DE GENERO]	


--22 - SELECIONAR OS G�NEROS DE TODOS OS FILMES DO ANO QUE TEM A MAIOR QUANTIDADE DE FILMES

SELECT F.ANO_FILME,NOME_GENERO, count (*) as 'QTDE DE FILMES'
FROM GENERO G
JOIN FILME_GENERO FG
ON G.ID_GENERO = FG.ID_GENERO
JOIN FILME F
ON FG.ID_FILME = F.ID_FILME
WHERE ANO_FILME = 2011
GROUP BY F.ANO_FILME, NOME_GENERO
ORDER BY  [QTDE DE FILMES] DESC

--23 - SELECIONAR TODOS OS ATORES QUE TENHAM O MESMO NOME DO PERSONAGEM QUE ENCENARAM NOS FILMES

SELECT A.NOME_ATOR
FROM ATOR A
JOIN FILME_ATOR FA
ON A.ID_ATOR = FA.ID_ATOR
WHERE A.NOME_ATOR = FA.NOME_PERSONAGEM

--24 - SELECIONAR TODOS OS ATORES QUE TENHAM FEITO MAIS DE UM PERSONAGEM NO MESMO FILME

SELECT A.NOME_ATOR
FROM ATOR A
JOIN FILME_ATOR FA
ON A.ID_ATOR = FA.ID_ATOR
JOIN FILME F
ON FA.ID_FILME = F.ID_FILME
GROUP BY A.NOME_ATOR, FA.ID_FILME
HAVING COUNT (FA.ID_ATOR) >1

--25 - SELECIONAR OS NOMES ORIGINAIS DE TODOS OS FILMES QUE TENHAM MENOS DE 10 ATORES

SELECT F.NOME_ORIGINAL_FILME, COUNT (*) AS 'QTDE DE ATOR'
FROM FILME F
JOIN FILME_ATOR FA
ON F.ID_FILME = FA.ID_FILME
JOIN ATOR A
ON FA.ID_ATOR = A.ID_ATOR
GROUP BY F.NOME_ORIGINAL_FILME
HAVING COUNT (*) <10

--26 - CONTAR QUANTOS FILMES DO DIRETOR JON FAVREAU EXISTEM NO CADASTRO

SELECT D.NOME_DIRETOR, COUNT (*) AS 'QTDE DE FILME'
FROM FILME F 
JOIN DIRETOR D
ON F.ID_DIRETOR = D.ID_DIRETOR
WHERE D.NOME_DIRETOR LIKE '%JON FAVREAU%'
GROUP BY D.NOME_DIRETOR

--27 - CONTAR QUANTOS PERSONAGENS EXISTEM NOS FILMES DO DIRETOR RIDLEY SCOTT

SELECT NOME_DIRETOR, COUNT (NOME_PERSONAGEM) AS 'QTDE'
FROM FILME F
JOIN FILME_ATOR FA
ON FA.ID_FILME = F.ID_FILME
JOIN DIRETOR D 
ON F.ID_DIRETOR = D.ID_DIRETOR
WHERE D.NOME_DIRETOR LIKE '%RIDLEY SCOTT%'
GROUP BY NOME_DIRETOR

--28 - SELECIONAR QUAIS ATORES FIZERAM FILMES DE ACTION OU CRIME OU THRILLER

SELECT NOME_ATOR, COUNT(*) AS 'QTDE'
FROM ATOR A 
JOIN FILME_ATOR FA 
ON A.ID_ATOR = FA.ID_ATOR 
JOIN FILME_GENERO FG
ON FA.ID_FILME = FG.ID_FILME
WHERE NOME_GENERO LIKE 'ACTION' AND 'CRIME' AND 'THRILLER'
GROUP BY NOME_ATOR

--28 - SELECIONAR QUAIS ATORES FIZERAM FILMES DE ACTION OU CRIME OU THRILLER



--29 - SELECIONAR OS DIRETORES QUE N�O TEM FILMES ASSOCIADOS

SELECT D.NOME_DIRETOR, F.NOME_FILME
FROM DIRETOR D
LEFT JOIN FILME F
ON D.ID_DIRETOR = F.ID_DIRETOR
WHERE NOME_FILME IS NULL

--30 - SELECIONAR OS GENEROS QUE N�O TEM FILMES ASSOCIADOS

SELECT G.NOME_GENERO, F.NOME_FILME
FROM GENERO G
LEFT JOIN FILME_GENERO FG
ON G.ID_GENERO = FG.ID_GENERO
LEFT JOIN FILME F 
ON FG.ID_FILME = F.ID_FILME
WHERE NOME_FILME IS NULL

-- PROFESSOR FEZ
SELECT G.NOME_GENERO, FG.ID_FILME
FROM GENERO G
LEFT JOIN FILME_GENERO FG
ON G.ID_GENERO = FG.ID_GENERO
WHERE ID_FILME IS NULL

--31 - SELECIONAR OS FILMES DO GENERO ACTION DO ANO 2009 QUE TENHAM SCARLETT JOHANSSON NO ELENCO

SELECT A.NOME_ATOR, G.NOME_GENERO, FA.NOME_PERSONAGEM, F.ANO_FILME
FROM FILME F 
JOIN FILME_GENERO FG
ON F.ID_FILME = FG.ID_FILME
JOIN GENERO G
ON FG.ID_GENERO = G.ID_GENERO
JOIN FILME_ATOR FA
ON F.ID_FILME = FA.ID_FILME
JOIN ATOR A 
ON FA.ID_ATOR = A.ID_ATOR
WHERE NOME_ATOR LIKE 'SCARLETT JOHANSSON' AND NOME_GENERO LIKE 'ACTION' AND ANO_FILME LIKE '2009'

--32 - SELECIONAR OS DIRETORES DOS FILMES EM QUE JON FAVREAU ATUOU

SELECT D.NOME_DIRETOR, F.NOME_FILME, A.NOME_ATOR
FROM DIRETOR D 
JOIN FILME F
ON D.ID_DIRETOR = F.ID_DIRETOR
JOIN FILME_ATOR FA
ON F.ID_FILME = FA.ID_FILME
JOIN ATOR A
ON FA.ID_ATOR = A.ID_ATOR
WHERE A.NOME_ATOR LIKE 'JON FAVREAU'

--33 - SELECIONAR OS PERSONAGENS DO ATOR KARL URBAN, EXCLU�DOS, OU N�O

SELECT DISTINCT A.NOME_ATOR, FA.NOME_PERSONAGEM
FROM ATOR A
JOIN FILME_ATOR FA
ON A.ID_ATOR = FA.ID_ATOR
JOIN FILME F
ON FA.ID_FILME = F.ID_FILME
WHERE A.NOME_ATOR LIKE 'KARL URBAN'

--34 - SELECIONAR OS ATORES QUE FIZERAM PERSONAGENS SEM NOME EM FILMES

SELECT A.NOME_ATOR, FA.NOME_PERSONAGEM
FROM ATOR A 
LEFT JOIN FILME_ATOR FA
ON A.ID_ATOR = FA.ID_ATOR
LEFT JOIN FILME F
ON FA.ID_FILME = F.ID_FILME
WHERE FA.NOME_PERSONAGEM = ''

SELECT DISTINCT FA.NOME_PERSONAGEM, A.NOME_ATOR
FROM ATOR A
JOIN FILME_ATOR FA
ON A.ID_ATOR = FA.ID_ATOR
JOIN FILME F
ON FA.ID_FILME = F.ID_FILME
WHERE FA.NOME_PERSONAGEM = ''


--35 - SELECIONAR OS NOMES DOS FILMES EM QUE O ATOR KARL URBAN ATUOU

SELECT F.NOME_FILME, A.NOME_ATOR
FROM FILME F 
JOIN FILME_ATOR FA
ON F.ID_FILME = FA.ID_FILME
JOIN ATOR A
ON FA.ID_ATOR = A.ID_ATOR
WHERE A.NOME_ATOR LIKE 'KARL URBAN' 

--37 - SELECIONAR OS ATORES QUE N�O ATUARAM

SELECT A.NOME_ATOR, F.NOME_FILME
FROM ATOR A
LEFT JOIN FILME_ATOR FA
ON A.ID_ATOR = FA.ID_ATOR
LEFT JOIN FILME F 
ON FA.ID_FILME = F.ID_FILME
WHERE F.NOME_FILME IS NULL

--38 - SELECIONAR OS NOMES DE TODOS OS ATORES QUE INTERPRETARAM O PERSONAGEM CONAN

SELECT DISTINCT A.NOME_ATOR, FA.NOME_PERSONAGEM
FROM ATOR A
JOIN FILME_ATOR FA
ON A.ID_ATOR = FA.ID_ATOR
WHERE FA.NOME_PERSONAGEM = 'CONAN'

--39 - SELECIONAR OS NOMES DE TODOS OS ATORES QUE INTERPRETARAM O PERSONAGEM CONAN EM MAIS DE UM FILME

SELECT DISTINCT A.NOME_ATOR, COUNT (FA.NOME_PERSONAGEM) AS 'QTDE DE VEZES'
FROM ATOR A
JOIN FILME_ATOR FA
ON A.ID_ATOR = FA.ID_ATOR
WHERE FA.NOME_PERSONAGEM = 'CONAN'
GROUP BY A.NOME_ATOR
HAVING COUNT (FA.NOME_PERSONAGEM) >1


-- 40 DOS GENEROS QUE TEM MAIS FILMES, SELECIONAR APENAS DO 3� AO 5�

SELECT G.NOME_GENERO, COUNT(F.NOME_FILME) AS 'QTDE DE FILMES'
FROM GENERO G 
JOIN FILME_GENERO FG
ON G.ID_GENERO = FG.ID_GENERO 
JOIN FILME F
ON FG.ID_FILME = F.ID_FILME
GROUP BY G.NOME_GENERO
ORDER BY [QTDE DE FILMES] DESC
OFFSET 2 ROWS
FETCH NEXT 3 ROWS ONLY