CREATE DATABASE IF NOT EXISTS Campeonato_Futebol;

drop DATABASE Campeonato_Futebol;
USE Campeonato_Futebol;

--tabela Campeonato------------------------------

DROP TABLE IF EXISTS campeonato;
CREATE TABLE IF NOT EXISTS Campeonato (
    ID_Campeonato INT PRIMARY KEY AUTO_INCREMENT NOT NULL ,
    nome VARCHAR(100),
    ano INT,
    local_realizado VARCHAR(100),
    data_inicio DATE,
    data_fim DATE
);

INSERT INTO Campeonato (nome, ano, local_realizado, data_inicio, data_fim)
 VALUES 
('Campeonato Inter-Estadual Brasileiro',
    2025,
    'Brasil',
    '2025-04-13',
    '2025-12-08'
);


--tabela clube--------------------------------------
DROP TABLE IF EXISTS Clube;
 CREATE TABLE IF NOT EXISTS Clube (
    ID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    escudo varchar(1000)
);
SET @ID_Clube := LAST_INSERT_ID();
INSERT INTO Clube (
    nome, escudo
)
VALUES
(  'Botafogo','https://ssl.gstatic.com/onebox/media/sports/logos/KLDWYp-H8CAOT9H_JgizRg_48x48.png'),
( 'Palmeiras','https://ssl.gstatic.com/onebox/media/sports/logos/7spurne-xDt2p6C0imYYNA_48x48.png'),
(  'Flamengo','https://ssl.gstatic.com/onebox/media/sports/logos/orE554NToSkH6nuwofe7Yg_48x48.png'),
( 'Fortaleza','https://ssl.gstatic.com/onebox/media/sports/logos/me10ephzRxdj45zVq1Risg_48x48.png'),
( 'Internacional','https://ssl.gstatic.com/onebox/media/sports/logos/OWVFKuHrQuf4q2Wk0hEmSA_48x48.png'),
( 'São Paulo','https://ssl.gstatic.com/onebox/media/sports/logos/4w2Z97Hf9CSOqICK3a8AxQ_48x48.png'),
(  'Corinthians','https://ssl.gstatic.com/onebox/media/sports/logos/tCMSqgXVHROpdCpQhzTo1g_48x48.png'),
(  'Bahia','https://ssl.gstatic.com/onebox/media/sports/logos/nIdbR6qIUDyZUBO9vojSPw_48x48.png'),
( 'Cruzeiro','https://ssl.gstatic.com/onebox/media/sports/logos/Tcv9X__nIh-6wFNJPMwIXQ_48x48.png'),
(  'Vasco da Gama','https://ssl.gstatic.com/onebox/media/sports/logos/hHwT8LwRmYCAGxQ-STLxYA_48x48.png'),
( 'EC Vitória','https://ssl.gstatic.com/onebox/media/sports/logos/LHSM6VchpkI4NIptoSTHOg_48x48.png'),
(   'Atlético-MG','https://ssl.gstatic.com/onebox/media/sports/logos/q9fhEsgpuyRq58OgmSndcQ_48x48.png'),
( 'Fluminense','https://ssl.gstatic.com/onebox/media/sports/logos/fCMxMMDF2AZPU7LzYKSlig_48x48.png'),
('Grêmio','https://ssl.gstatic.com/onebox/media/sports/logos/Ku-73v_TW9kpex-IEGb0ZA_48x48.png'),
('Juventude','https://ssl.gstatic.com/onebox/media/sports/logos/JrXw-m4Dov0gE2Sh6XJQMQ_48x48.png'),
( 'Bragantino','https://ssl.gstatic.com/onebox/media/sports/logos/lMyw2zn1Z4cdkaxKJWnsQw_48x48.png'),
( 'Atlético-PR','https://ssl.gstatic.com/onebox/media/sports/logos/9LkdBR4L5plovKM8eIy7nQ_48x48.png'),
(  'Criciúma','https://ssl.gstatic.com/onebox/media/sports/logos/u_L7Mkp33uNmFTv3uUlXeQ_48x48.png'),
( 'Atlético-GO','https://ssl.gstatic.com/onebox/media/sports/logos/9mqMGndwoR9og_Z0uEl2kw_48x48.png'),
(  'Cuiabá','https://ssl.gstatic.com/onebox/media/sports/logos/j6U8Rgt_6yyf0Egs9nREXw_48x48.pngs');


SELECT * FROM Clube;
--rodada--------------------------------------
CREATE table Rodada(
    id INT AUTO_INCREMENT PRIMARY KEY,
    numero_rodada INT,
    data_começo DATE,
    data_termino DATE,
     FOREIGN KEY (fk_Campeonato) REFERENCES Campeonato(ID_Campeonato),    
);

INSERT INTO Rodada (numero_rodada, data_começo, data_termino, fk_Campeonato) VALUES
(1, '2025-04-16','2025-04-20',1),
(2, '2025-04-24', '2025-04-28',1),
(3, '2025-04-02', '2025-04-04',1)
()
()
()
()
()
()
()
()
()
()
()
()
()
()
()
()
()
()
()
()
()
()
()
()
()
()
()
()
()
()
()
()
()
()
()
--Tabela jogador-------------------------------------------
DROP TABLE IF EXISTS jogador ;
CREATE TABLE IF NOT EXISTS Jogador (
    ID INT PRIMARY KEY AUTO_INCREMENT NOT NULL, 
    Nome VARCHAR (100),
    Nacionalidade VARCHAR (50),
    Posicao VARCHAR (50),
    Pe_dominante VARCHAR(50),
    numero_camisa INT,
    fk_clube INT,
    -- chaves estrangeiras --
    FOREIGN KEY (fk_clube) REFERENCES Clube(ID)
);
--
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

--Tabela Arbitro--------------------------------------------
DROP TABLE IF EXISTS Arbitro;

CREATE TABLE IF NOT EXISTS Arbitro(
    ID_Arbitro INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Nome VARCHAR(100),
    Data_Nascimento DATE,
    Nacionalidade VARCHAR (50),
    experiencia INT
);

create table if not exists Arbitro_da_partida (
    ID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    fk_arbitro INT,
    fk_partida INT,
    -- chaves estrangeiras --
    FOREIGN KEY (fk_arbitro) REFERENCES Arbitro(ID_Arbitro),
    FOREIGN KEY (fk_partida) REFERENCES Partida(ID)
);

INSERT INTO Arbitro_da_partida (fk_arbitro, fk_partida) VALUES (1, 1);
INSERT INTO Arbitro_da_partida (fk_arbitro, fk_partida) VALUES (2, 1);



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

INSERT INTO Partida (data, hora, fk_campeonato, fk_estadio, fk_timeMandante, fk_timeVisitante) VALUES ('2025-04-13', '16:00:00', 1, 1, 1, 2);

INSERT INTO Partida (data, hora, fk_campeonato, fk_estadio, fk_timeMandante, fk_timeVisitante) VALUES ('2025-04-14', '18:00:00', 1, 1, '2', '1');
SELECT * from Partida;
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


DROP TABLE IF EXISTS estadio_campeonato;
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

DROP TABLE IF EXISTS jogador_partida;
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



