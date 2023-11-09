-- Esse banco de dados e destinado as aulas do Curso em vídeo
drop database if exists Cadastro;

CREATE DATABASE Cadastro 
default character set utf8mb4
default collate utf8_general_ci;

USE Cadastro;

-- Tipos primitivos
-- |Numéricos|------------------------------------------
-- •Inteiro: TinyInt, SmallInt, Int, MediumInt, BigInt.
-- •Real: Decimal, Float, Double, Real.
-- •Lógico: Bit, Boolean. 

-- |Data/Tempo|-----------------------------------------
-- •Date, DateTime, TimeStamp, Time, Year.

-- |Literal|--------------------------------------------
-- •Caractere: Char e VarChar.
-- •Texto: TinyText, Text, MediumText, LongText.
-- •Binário: TinyNlob, Blob, MediumBlob, LongBlob.
-- •Coleção: Enum e Set.

-- |Espacial|-------------------------------------------
-- • Geometry, Point, Polygon, MultiPolygon.


-- -----------------------------------------------------
-- Constrante
-- • Not null
-- • default ''
-- • unsigned

-- -----------------------------------------------------
-- Cria uma tabela pessoas para cadastro
CREATE TABLE Pessoas(
	`id_Pessoa` int not null auto_increment,
	`nome` varchar(30) not null,
    `nascimento` date,
    `sexo` enum ('M','F'),
    `peso` decimal(5,2),
    `altura` decimal(3,2),
    `nascionalidade` varchar(20) default 'Brasil',
    primary key (id_pessoa) 
)DEFAULT CHARSET = utf8mb4;
-- -----------------------------------------------------
-- Inserindo dados para tabela pessoas
insert into Pessoas values 
	(default, 'Godofredo', '1984-01-02', 'M', '78.5', '1.83','Brasil'),
	(default, 'Maria', '1999-12-30', 'F', '55.5', '1.65','Portugal'),
    (default, 'Guanabara', '1987-01-17', 'M', '78.5', '1.83','Brasil'),
    (default, 'Creuza', '1920-12-30', 'F', '50.2', '1.65',default);
    
select * from Pessoas;
-- -----------------------------------------------------
-- Alterando dados para tabela pessoas add para adicionar coluna

 -- Para adicionar a coluna primeiro 
	alter table Pessoas add column codigo int first;

-- Para colocar a coluna no final da tabela
	alter table Pessoas add column profissao varchar(10); 

-- Para colocar a coluna depois de uma coluna
	alter table Pessoas add column profissao varchar(10) after nome; 

-- Para apagar coluna use...
	alter table Pessoas drop column profissao; 
    
-- Para modificar a coluna use...
	alter table Pessoas modify column profissao varchar(20) not null;

-- Para mudar o nome da coluna e seus tipos primitivos use
	alter table Pessoas change column profissao prof varchar(20);
    
-- Para mudar o nome da tabela inteira use
 alter table Pessoas rename to pessoas;

-- describe Pessoas ou
	desc Pessoas;
	select * from Pessoas; 
-- ----------------------------------------------------- 


create table if not exists cursos(
	nome varchar(30) not null unique,
	descricao text,
	carga int unsigned,
	totaulas int,
	ano year default '2016'
)default charset = utf8mb4;
    