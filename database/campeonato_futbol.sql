CREATE DATABASE IF NOT EXISTS Campeonato_Futebol;

USE Campeonato_Futebol;

--tabela clube--------------------------------------
DROP TABLE IF EXISTS Clube;
 CREATE TABLE IF NOT EXISTS Clube (
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
SET @ID_Clube := LAST_INSERT_ID();

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

--Tabela jogador-------------------------------------------
DROP TABLE IF EXISTS jogador ;
CREATE TABLE IF NOT EXISTS Jogador (
    ID INT PRIMARY KEY AUTO_INCREMENT NOT NULL, 
    Nome VARCHAR (100),
    Data_Nascimento Date,
    Nacionalidade VARCHAR (50),
    Posicao VARCHAR (50),
    Pe_dominante VARCHAR(50),
    numero_camisa INT,
    fk_clube INT,
    -- chaves estrangeiras --
    FOREIGN KEY (fk_clube) REFERENCES Clube(ID)
);

INSERT INTO Jogador (Nome, Data_Nascimento, Nacionalidade, Posicao, Pe_Dominante, numero_camisa) VALUES ('Cristiano Ronaldo', '1985-02-05', 'Portugal', 'Atacante', 'Direito', 7);
SELECT * FROM Jogador;

--tabela técnico------------------------------------
DROP TABLE IF EXISTS Tecnico;
CREATE TABLE IF NOT EXISTS Tecnico(
    id_tecnico INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Nome VARCHAR(100),
    Data_Nascimento DATE,
    Nacionalidade VARCHAR (50),
    experiencia INT,
    fk_clube INT,
    -- chaves estrangeiras --
    FOREIGN KEY (fk_clube) REFERENCES Clube(ID)
);
SET @id_tecnico := LAST_INSERT_ID();
INSERT INTO Tecnico (Nome, Data_Nascimento, Nacionalidade, experiencia) VALUES ( 'Carlo Ancelotti', '1959-06-10', 'Itália', 29);
INSERT INTO Tecnico (Nome, Data_Nascimento, Nacionalidade, experiencia) VALUES ( 'António Oliveira', '1982-10-10', 'Portugal', 10);

--Tabela Estadio--------------------------------------------

DROP TABLE IF EXISTS Estadio;

CREATE TABLE IF NOT EXISTS Estadio(
    ID_Estadio INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome VARCHAR(100),
    localizacao VARCHAR(100),
    data_construçao DATE,
    capacidade INT,
    Clube_ID INT
);

INSERT INTO Estadio (nome, localizacao, data_construçao, capacidade, Clube_ID ) VALUES ('Santiago Bernabeu', 'Real Madrid', '1947-12-14', 83184, @ID_Clube);

SELECT * FROM Estadio;

--tabela Campeonato------------------------------

DROP TABLE IF EXISTS campeonato;
CREATE TABLE IF NOT EXISTS Campeonato (
    ID_Campeonato INT PRIMARY KEY AUTO_INCREMENT NOT NULL ,
    nome VARCHAR(100),
    ano INT,
    numero_de_times INT,
    categoria VARCHAR(70),
    local_realizado VARCHAR(100),
    data_inicio DATE,
    data_fim DATE,
    regulamento VARCHAR(100),
    organizador VARCHAR(100)
);

INSERT INTO Campeonato (nome, ano, numero_de_times, categoria, local_realizado, data_inicio, data_fim, regulamento, organizador)
 VALUES 
('Campeonato Brasileiro Série A',
    2025,
    20,
    'Adulto Masculino',
    'Brasil',
    '2025-04-13',
    '2025-12-08',
    'Regulamento oficial disponível no site da CBF.',
    'Confederação Brasileira de Futebol (CBF)'
);

SELECT * FROM Campeonato;

-- tabela Partdida -------------------------------------
DROP TABLE IF EXISTS Partida;
CREATE TABLE IF NOT EXISTS Partida (
    ID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    data DATE,
    hora TIME,
    gols_timeMandante INT DEFAULT 0,
    gols_timeVisitante INT DEFAULT 0,
    fk_campeonato INT,
    fk_estadio INT,
    fk_timeMandante INT,
    fk_timeVisitante INT,
    -- chaves estrangeiras --
    FOREIGN KEY (fk_campeonato) REFERENCES Campeonato(ID_Campeonato),
    FOREIGN KEY (fk_estadio) REFERENCES Estadio(ID_Estadio),
    FOREIGN KEY (fk_timeMandante) REFERENCES Clube(ID),
    FOREIGN KEY (fk_timeVisitante) REFERENCES Clube(ID)
);

-- tabela Gols -------------------------------------
DROP TABLE IF EXISTS Gols;
CREATE TABLE IF NOT EXISTS Gols (
    ID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    minuto INT,
    tipoGol VARCHAR(50),
    fk_jogador INT,
    fk_partida INT,
    fk_clube INT,
    -- chaves estrangeiras --
    FOREIGN KEY (fk_jogador) REFERENCES Jogador(ID),
    FOREIGN KEY (fk_partida) REFERENCES Partida(ID),
    FOREIGN KEY (fk_clube) REFERENCES Clube(ID)
);

-- tabela Cartões -------------------------------------
DROP TABLE IF EXISTS Cartoes;
CREATE TABLE IF NOT EXISTS Cartoes (
    ID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    tipoCartao VARCHAR(50),
    motivo VARCHAR(100),
    fk_partida INT,
    fk_jogador INT,
    fk_clube INT,
    -- chaves estrangeiras --
    FOREIGN KEY (fk_jogador) REFERENCES Jogador(ID),
    FOREIGN KEY (fk_partida) REFERENCES Partida(ID),
    FOREIGN KEY (fk_clube) REFERENCES Clube(ID)
);

-- tabela Substituicao -------------------------------------
DROP TABLE IF EXISTS Substituicao;
CREATE TABLE IF NOT EXISTS Substituicao (
    ID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    minuto INT,
    fk_jogador_saida INT,
    fk_jogador_entrada INT,
    fk_partida INT,
    fk_clube INT,
    -- chaves estrangeiras --
    FOREIGN KEY (fk_jogador_saida) REFERENCES Jogador(ID),
    FOREIGN KEY (fk_jogador_entrada) REFERENCES Jogador(ID),
    FOREIGN KEY (fk_partida) REFERENCES Partida(ID),
    FOREIGN KEY (fk_clube) REFERENCES Clube(ID)
);

-- TABELAS DE RELACIONAMENTO --------------------
CREATE TABLE IF NOT EXISTS jogador_estadio (
    ID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    fk_jogador INT,
    fk_estadio INT,
    -- chaves estrangeiras --
    FOREIGN KEY (fk_jogador) REFERENCES Jogador(ID),
    FOREIGN KEY (fk_estadio) REFERENCES Estadio(ID_Estadio)
);

CREATE TABLE IF NOT EXISTS estadio_campeonato (
    ID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    fk_estadio INT,
    fk_campeonato INT,
    -- chaves estrangeiras --
    FOREIGN KEY (fk_estadio) REFERENCES Estadio(ID_Estadio),
    FOREIGN KEY (fk_campeonato) REFERENCES Campeonato(ID_Campeonato)
);

CREATE TABLE IF NOT EXISTS clube_campeonato (
    ID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    fk_clube INT,
    fk_campeonato INT,
    -- chaves estrangeiras --
    FOREIGN KEY (fk_clube) REFERENCES Clube(ID),
    FOREIGN KEY (fk_campeonato) REFERENCES Campeonato(ID_Campeonato)
);

CREATE TABLE IF NOT EXISTS jogador_campeonato (
    ID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    fk_jogador INT,
    fk_campeonato INT,
    golsMarcados INT DEFAULT 0,
    -- chaves estrangeiras --
    FOREIGN KEY (fk_jogador) REFERENCES Jogador(ID),
    FOREIGN KEY (fk_campeonato) REFERENCES Campeonato(ID_Campeonato)
);

CREATE TABLE IF NOT EXISTS jogador_partida (
    ID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    fk_jogador INT,
    fk_partida INT,
    golsMarcados INT DEFAULT 0,
    faltasCometidas INT DEFAULT 0,
    faltasSofridas INT DEFAULT 0,
    -- chaves estrangeiras --
    FOREIGN KEY (fk_jogador) REFERENCES Jogador(ID),
    FOREIGN KEY (fk_partida) REFERENCES Partida(ID)
);  