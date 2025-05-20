CREATE database Campeonato_Futebol;

use Campeonato_Futebol;

--Tabela jogador-------------------------------------------
DROP table jogador ;
CREATE TABLE Jogador (
    ID INT PRIMARY KEY AUTO_INCREMENT NOT NULL, 
    Nome VARCHAR (100),
    Data_Nascimento Date,
    Nacionalidade VARCHAR (50),
    Posicao VARCHAR (50),
    Pe_dominante VARCHAR(50),
    numero_camisa INT
);

INSERT into Jogador (Nome, Data_Nascimento, Nacionalidade, Posicao, Pe_Dominante, numero_camisa) VALUES ('Cristiano Ronaldo', '1985-02-05', 'Portugal', 'Atacante', 'Direito', 7);
SELECT * FROM Jogador;

--tabela técnico------------------------------------

drop table Tecnico;
Create Table Tecnico(
    id_tecnico INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Nome VARCHAR(100),
     Data_Nascimento Date,
    Nacionalidade VARCHAR (50),
    experiencia INT
);
SET @id_tecnico := LAST_INSERT_ID();
insert into Tecnico (Nome, Data_Nascimento, Nacionalidade, experiencia) VALUES ( 'Carlo Ancelotti', '1959-06-10', 'Itália', 29);
insert into Tecnico (Nome, Data_Nascimento, Nacionalidade, experiencia) VALUES ( 'António Oliveira', '1982-10-10', 'Portugal', 10);

--tabela clube--------------------------------------

DROP TABLE Clube;
 CREATE TABLE Clube (
    ID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    escudo varchar(1000),
    apelido VARCHAR(50),
    fundacao DATE,
    pais varchar (100),
    estado VARCHAR(100),
    cidade VARCHAR(50),
    estadio VARCHAR(50),
    presidente VARCHAR(50),
    tecnico_id INT
);

INSERT INTO Clube (
    nome, escudo, apelido, fundacao, pais, estado, cidade, estadio, presidente, tecnico_id
)
VALUES
(
    'Real Madrid Club de Fútbol',
    'https://upload.wikimedia.org/wikipedia/pt/thumb/9/98/Real_Madrid.png/120px-Real_Madrid.png',
    'Real Madrid',
    '1902-03-06',
    'Espanha',
    'Madrid',
    'Madrid',
    'Santiago Bernabéu',
    'Florentino Pérez',
   @id_tecnico
);
INSERT INTO Clube (
    nome, escudo, apelido, fundacao, pais, estado, cidade, estadio, presidente, tecnico_id
)
VALUES
(
  ' Sport Club Corinthians Paulista',
    'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/874.png',
    'Timão',
    '1910-09-01',
    'Brasil',
    'São Paulo',
    'São Paulo',
    'Neo Química Arena',
    'Augusto Melo',
   @id_tecnico
);


SELECT * FROM Clube;


