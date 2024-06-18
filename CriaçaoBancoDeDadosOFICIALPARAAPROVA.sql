CREATE DATABASE TADS

--DROP DATABASE TADS

--ALTER

CREATE TABLE TESTE
(
  ID INTEGER PRIMARY KEY,
  NOME VARCHAR(100) NOT NULL,
  DATA DATE,
  VALOR DECIMAL(10,2) --(10) TOTAL DE CARÁCTER E (2) NÚMEROS APÓS A VÍRUGLA

)
CREATE TABLE TESTE2
(
  ID INTEGER PRIMARY KEY,
  NOME VARCHAR(100) NOT NULL,
  DATA DATE,
  VALOR DECIMAL(10,2) --(10) TOTAL DE CARÁCTER E (2) NÚMEROS APÓS A VÍRUGLA

)
-- SQL AUTO INCREMENT
-- SQL CHECK
-- SQL DEFAULT
-- SQL FOREIGN KEY



DROP TABLE Persons (
    Personid int IDENTITY(1,1) PRIMARY KEY,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int CHECK (AGE>=18),
	City varchar(255) DEFAULT 'Sandnes'
);

CREATE TABLE Persons (
    Personid int IDENTITY(1,1) PRIMARY KEY,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int CHECK (AGE>=18),
	City varchar(255) DEFAULT 'Sandnes'
);


CREATE TABLE Orders (
    OrderID int NOT NULL PRIMARY KEY,
    OrderNumber int NOT NULL,
    PersonID int FOREIGN KEY REFERENCES Persons(PersonID)
);

--Alteração de tabelas, colunas e exclusão
ALTER TABLE Orders
ADD teste varchar(20)

ALTER TABLE Orders
drop column teste 

ALTER TABLE Orders
Alter column OrderNumber char(2)



CREATE DATABASE TESTE

CREATE TABLE ALUNOS
(
ID_ALUNOS int IDENTITY(1,1) PRIMARY KEY,
NOME_ALUNOS VARCHAR(50),
CELULAR VARCHAR(20),
DATA_NASCIMENTO DATE
);

CREATE TABLE MATERIAS
(
ID_MATERIA int IDENTITY(1,1) PRIMARY KEY,
NOME_MATERIA VARCHAR(20)
)

CREATE TABLE PROVA
(
ID_PROVA int IDENTITY(1,1) PRIMARY KEY,
ID_ALUNO int FOREIGN KEY REFERENCES ALUNOS(ID_ALUNOS),
ID_MATERIA int FOREIGN KEY REFERENCES MATERIAS(ID_MATERIA),
NOTA_P1 INT,
NOTA_P2 int
)

ALTER TABLE PROVA
Alter column NOTA_P1 DECIMAL(4,2)

ALTER TABLE PROVA
Alter column NOTA_P2 DECIMAL(4,2)

ALTER TABLE ALUNOS
Alter column CELULAR VARCHAR(20)



-- sql insert into

INSERT INTO ALUNOS(NOME_ALUNOS, CELULAR, DATA_NASCIMENTO)
VALUES
('Ana', '(19)98877-6655', '10/01/2000'),
('Bruno', '(19)98844-3322', '15/05/2002'),
('Caio', '(19)98811-0099', '20/09/2005');

INSERT INTO MATERIAS(NOME_MATERIA)
VALUES
('Banco de Dados'),
('IA');


INSERT INTO PROVA(ID_ALUNO, ID_MATERIA, NOTA_P1)
VALUES
('1', '1','8'),
('1','2','7'),
('2','1','7'),
('2','2','6'),
('3','1','6'),
('3','2','5');



UPDATE Customers
SET ContactName = 'Alfred Schmidt', City= 'Frankfurt'
WHERE CustomerID = 1;

--UPDATE Table

UPDATE PROVA
SET NOTA_P1 = NOTA_P1 - 0.5
WHERE ID_MATERIA = '1';

UPDATE MATERIAS
SET NOME_MATERIA = 'REDES'
WHERE NOME_MATERIA = 'IA'
/*
SELECT * FROM MATERIAS 
WHERE NOME_MATERIA = 'IA'
*/

delete 
insert 
update 
--para os alterar os dados que estao na tabela

drop
create
alter
-- para alterar ou incluir na estrutura de dados que seria tabela e coluna 

DELETE FROM PROVA
WHERE ID_ALUNO = '1'

DELETE FROM PROVA
WHERE ID_ALUNO IN (SELECT ID_ALUNO FROM ALUNO WHERE NOME_ALUNO = 'ANA')

 
https://www.macoratti.net/11/03/sql_nv1.htm#:~:text=Quando%20usar%20CHAR%20ou%20VARCHAR,sabemos%20o%20que%20vamos%20armazenar.

Quando usar CHAR ou VARCHAR ?

O tipo CHAR deve ser usado quando sabemos que todos os dados armazenados em determinada coluna não são variáveis como, por exemplo, uma coluna que armazena a sigla do estado ou o cep que sempre terão o mesmo tamanho.

Já o VARCHAR deve ser utilizado quando não sabemos o que vamos armazenar. Um exemplo pode ser o nome do cliente, endereço, o email que sempre variam de tamanho.

Qual a diferença entre NVARCHAR E NCHAR ?