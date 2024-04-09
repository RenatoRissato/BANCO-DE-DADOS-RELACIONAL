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

--04 - SELECIONAR TODOS OS FILMES, EXCLUÍDOS, OU NÃO 

SELECT NOME_FILME, DATA_EXCLUSAO_FILME
FROM FILME

--05 - SELECIONAR OS DIRETORES EM ORDEM DE NOME 

SELECT * 
FROM DIRETOR 
ORDER BY NOME_DIRETOR

--06 - SELECIONAR OS ATORES EM ORDEM DE CÓDIGO

SELECT *
FROM ATOR
ORDER BY ID_ATOR 

--07 - SELECIONAR OS GENEROS EM ORDEM DECRESCENTE DO NOME

SELECT *
FROM GENERO
ORDER BY NOME_GENERO DESC

--08 - SELECIONAR O ANO, O NOME ORIGINAL, O NOME EM PORTUGUÊS E O CÓDIGO IMDB DOS FILMES

SELECT ANO_FILME, NOME_ORIGINAL_FILME, NOME_FILME, ID_IMDB_FILME
FROM FILME

--09 - SELECIONAR O NOME ORIGINAL DO FILME, O NOME DO DIRETOR, OS NOMES DOS ATORES E O NOME DOS GÊNEROS

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

--04 - SELECIONAR TODOS OS FILMES, EXCLUÍDOS, OU NÃO 

SELECT NOME_FILME, DATA_EXCLUSAO_FILME
FROM FILME

--05 - SELECIONAR OS DIRETORES EM ORDEM DE NOME 

SELECT *
FROM DIRETOR
ORDER BY NOME_DIRETOR ASC

--06 - SELECIONAR OS ATORES EM ORDEM DE CÓDIGO

SELECT *
FROM ATOR
ORDER BY ID_ATOR ASC

--07 - SELECIONAR OS GENEROS EM ORDEM DECRESCENTE DO NOME

SELECT *
FROM GENERO 
ORDER BY NOME_GENERO DESC

--08 - SELECIONAR O ANO, O NOME ORIGINAL, O NOME EM PORTUGUÊS E O CÓDIGO IMDB DOS FILMES

SELECT ANO_FILME, NOME_ORIGINAL_FILME, NOME_FILME, ID_IMDB_FILME
FROM FILME 

--09 - SELECIONAR O NOME ORIGINAL DO FILME, O NOME DO DIRETOR, OS NOMES DOS ATORES E O NOME DOS GÊNEROS

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


--10 - SELECIONAR TODOS OS GÊNEROS COM AS QUANTIDADES DE FILMES DE CADA UM

SELECT GENERO.NOME_GENERO, COUNT(*) as 'Qtde de filmes'
FROM GENERO
JOIN FILME_GENERO
ON GENERO.ID_GENERO = FILME_GENERO.ID_GENERO
GROUP BY NOME_GENERO

---SELECT COM TODOS OS FILMES DOS ANOS 2010,2012 E 2014

SELECT *
FROM FILME
WHERE ANO_FILME IN (2010,2012,2014)

---- SELECIONAR TODOS OS FILMES MAIS ANTIGOS DO ALIEN, OU SEJA, ONDE O ANO É MENOR QUE 2000 E TODOS OS FILMES NOVOS DO HIGHLANDER, OU SEJA, ONDE O ANO É POSTERIOR A 2000

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

--15 - SELECIONAR TODOS OS FILMES EM QUE O ATOR JAMES EARL JONES TRABALHOU, RETORNAR TAMBEM A COLUNA COM O NOME DO ATOR

SELECT FILME.NOME_FILME, ATOR.NOME_ATOR
FROM FILME
JOIN FILME_ATOR 
ON FILME.ID_FILME = FILME_ATOR.ID_FILME
JOIN ATOR
ON FILME_ATOR.ID_ATOR = ATOR.ID_ATOR
WHERE ATOR.NOME_ATOR LIKE 'JAMES EARL JONES'


/* Um banco de dados relacional é um tipo de banco de dados que organiza os dados em tabelas com colunas e linhas. Essas tabelas são relacionadas entre si por meio de chaves primárias e estrangeiras
ele possui entidade(tabela) tendo atributos e registros que sao linhas e colunas. Já a relação que precisa ter na que sao primary key e foreign key.
Em um banco de dados relacional, cada tabela representa uma entidade do mundo real, como clientes, produtos ou pedidos. Cada coluna em uma tabela representa um atributo dessa entidade, e cada linha contém uma instância específica desses atributos.

As relações entre as tabelas são estabelecidas por meio de chaves primárias e estrangeiras. A chave primária é um atributo ou conjunto de atributos que identifica exclusivamente cada linha em uma tabela. A chave estrangeira é um atributo em uma tabela que estabelece uma relação com a chave primária em outra tabela.
sql server e Oracle 

Um banco de dados não relacional, também conhecido como NoSQL (Not Only SQL), é um tipo de banco de dados que difere dos bancos de dados relacionais em sua estrutura e modelo de dados. Enquanto os bancos de dados relacionais organizam os dados em tabelas com linhas e colunas e seguem um esquema pré-definido, os bancos de dados não relacionais adotam uma abordagem mais flexível e podem armazenar dados de forma mais variada.
não precisa usar a linguagem SQL para acessar os dados.


MER é um modelo de entidade e relacionamento é uma maneira sistematica de descrever e definir um processo de negocio.

MER é a sigla para Modelo Entidade-Relacionamento. Trata-se de uma técnica utilizada na área de banco de dados para representar e descrever o modelo de dados de um sistema. O MER é uma ferramenta de modelagem conceitual, que visa capturar as entidades (objetos ou conceitos do mundo real), os atributos que descrevem essas entidades e os relacionamentos entre elas.

DER é a representação grafica disso 

Entidade: representa um tipo especifico de objeto. Cada entidade e representada por uma tabela

Atributo é uma propriedade ou caracteristica que descreve uma entidade. culuna 
os relacionamentos representam a associação entre duas ou mais entidades. eles descreve como as entidades estao conectadas uma com  as outras 

Pk primary key = é basicamente uma coluna ou grupo de colunas, usada para identificar unicamente uma linha de tabela.
pk = identificador unico que nao se repete na tabela.

fk foreign key chave estrangeira usado para relacionar uma tabela a outra, referencia uma primary key em outra tabela.

HAVING COUNT(*) > 1 filtra os grupos onde o número de ocorrências de product_id é maior que 1, ou seja, onde o produto foi pedido mais de uma vez.
Portanto, a cláusula HAVING permite filtrar os resultados da agregação após o agrupamento ter sido feito. É útil quando você deseja aplicar condições a grupos específicos de linhas, em vez de a todas as linhas da tabela.

ssms sitema de gerenciamento de banco de dados 
sql = banco de dados 
*/


SELECT NOME_ATOR, NOME_PERSONAGEM
FROM FILME F
JOIN FILME_ATOR FA
ON F.ID_FILME = FA.ID_FILME
JOIN ATOR A
ON FA.ID_ATOR = A.ID_ATOR
WHERE NOME_ATOR = NOME_PERSONAGEM

SELECT *
FROM FILME 
WHERE ANO_FILME BETWEEN 1990 AND 1999 OR ANO_FILME >=2010

SELECT NOME_FILME, ANO_FILME, NOME_GENERO
FROM FILME F
JOIN FILME_GENERO FG
ON F.ID_FILME = FG.ID_FILME 
JOIN GENERO G
ON FG.ID_GENERO = G.ID_GENERO
ORDER BY ANO_FILME ASC

SELECT NOME_GENERO, COUNT (*) AS 'FILMES PRODUZIDOS'
FROM GENERO G
JOIN FILME_GENERO FG
ON G.ID_GENERO = FG.ID_GENERO
JOIN FILME F
ON FG.ID_FILME = F.ID_FILME
GROUP BY NOME_GENERO
ORDER BY [FILMES PRODUZIDOS] DESC
