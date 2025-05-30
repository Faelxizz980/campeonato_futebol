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
    escudo VARCHAR(5000) NOT NULL,
    presidente VARCHAR(100) DEFAULT NULL,
    data_fundacao DATE  DEFAULT NULL,
    Num_titulos INT DEFAULT 0
);
SET @ID_Clube := LAST_INSERT_ID();
INSERT INTO Clube (
    nome, escudo, presidente, data_fundacao, Num_titulos
)
VALUES
('Botafogo','https://ssl.gstatic.com/onebox/media/sports/logos/KLDWYp-H8CAOT9H_JgizRg_48x48.png', 'John Textor', '1904-08-12', 2),
('Palmeiras','https://ssl.gstatic.com/onebox/media/sports/logos/7spurne-xDt2p6C0imYYNA_48x48.png','Leila Pereira', '1914-08-26', 12),
('Flamengo','https://ssl.gstatic.com/onebox/media/sports/logos/orE554NToSkH6nuwofe7Yg_48x48.png','Rodolfo Landim', '1895-11-15', 8),
('Fortaleza','https://ssl.gstatic.com/onebox/media/sports/logos/me10ephzRxdj45zVq1Risg_48x48.png','Marcelo Paz', '1918-10-18', 0),
('Internacional','https://ssl.gstatic.com/onebox/media/sports/logos/OWVFKuHrQuf4q2Wk0hEmSA_48x48.png','Alessandro Barcellos', '1909-04-04', 3),
('São Paulo','https://ssl.gstatic.com/onebox/media/sports/logos/4w2Z97Hf9CSOqICK3a8AxQ_48x48.png','Julio Casares', '1930-01-25', 6),
('Corinthians','https://ssl.gstatic.com/onebox/media/sports/logos/tCMSqgXVHROpdCpQhzTo1g_48x48.png','Augusto Melo', '1910-09-01', 7),
('Bahia','https://ssl.gstatic.com/onebox/media/sports/logos/nIdbR6qIUDyZUBO9vojSPw_48x48.png','Guilherme Bellintani', '1931-01-01', 3),
('Cruzeiro','https://ssl.gstatic.com/onebox/media/sports/logos/Tcv9X__nIh-6wFNJPMwIXQ_48x48.png','Sérgio Santos Rodrigues', '1921-01-02', 4),
('Vasco da Gama','https://ssl.gstatic.com/onebox/media/sports/logos/hHwT8LwRmYCAGxQ-STLxYA_48x48.png','Pedrinho', '1898-08-21', 4),
('EC Vitória','https://ssl.gstatic.com/onebox/media/sports/logos/LHSM6VchpkI4NIptoSTHOg_48x48.png','Fábio Mota', '1899-05-13', 0),
('Atlético-MG','https://ssl.gstatic.com/onebox/media/sports/logos/q9fhEsgpuyRq58OgmSndcQ_48x48.png','Sérgio Coelho', '1908-03-25', 2),
('Fluminense','https://ssl.gstatic.com/onebox/media/sports/logos/fCMxMMDF2AZPU7LzYKSlig_48x48.png','Mário Bittencourt', '1902-07-21', 4),
('Grêmio','https://ssl.gstatic.com/onebox/media/sports/logos/Ku-73v_TW9kpex-IEGb0ZA_48x48.png','Alberto Guerra', '1903-09-15', 2),
('Juventude','https://ssl.gstatic.com/onebox/media/sports/logos/JrXw-m4Dov0gE2Sh6XJQMQ_48x48.png','Walter Dal Zotto Jr.', '1913-06-29', 1),
('Bragantino','https://ssl.gstatic.com/onebox/media/sports/logos/lMyw2zn1Z4cdkaxKJWnsQw_48x48.png','Marco Antonio Chedid', '1928-01-08', 0),
('Atlético-PR','https://ssl.gstatic.com/onebox/media/sports/logos/9LkdBR4L5plovKM8eIy7nQ_48x48.png','Mario Celso Petraglia', '1924-03-26', 1),
('Criciúma','https://ssl.gstatic.com/onebox/media/sports/logos/u_L7Mkp33uNmFTv3uUlXeQ_48x48.png','Vilmar Guedes', '1947-05-13', 0),
('Atlético-GO','https://ssl.gstatic.com/onebox/media/sports/logos/9mqMGndwoR9og_Z0uEl2kw_48x48.png','Adson Batista', '1937-04-02', 0),
('Cuiabá','https://ssl.gstatic.com/onebox/media/sports/logos/j6U8Rgt_6yyf0Egs9nREXw_48x48.png', 'Cristiano Dresch', '2001-12-12', 0),
('Santos','data:image/png;base64,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','Andrés Rueda', '1912-04-14', 8),
('Coritiba','https://ssl.gstatic.com/onebox/media/sports/logos/LaFlBADLmsjHfGTehCYtuA_48x48.png','Samir Namur', '1909-10-12', 1),
('Sport Recife','https://ssl.gstatic.com/onebox/media/sports/logos/u9Ydy0qt6JJjWhTaI6r10A_48x48.png','Mário Bittencourt', '1905-05-13', 1),
('Chapecoense','https://ssl.gstatic.com/onebox/media/sports/logos/K7JQUKTRsuXfO9YrD5dq5g_48x48.png','Paulo Magro', '1973-05-10', 0);


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
    capacidade INT
);

INSERT INTO Estadio (nome, localizacao, data_construçao, capacidade) VALUES
('Estádio Nilton Santos', 'Rio de Janeiro', '2007-06-30', 46731), -- Botafogo
('Allianz Parque', 'São Paulo', '2014-11-19', 43713), -- Palmeiras
('Maracanã', 'Rio de Janeiro', '1950-06-16', 78838), -- Flamengo
('Arena Castelão', 'Fortaleza', '1973-11-11', 63903), -- Fortaleza
('Beira-Rio', 'Porto Alegre', '1969-04-06', 50000), -- Internacional
('Morumbi', 'São Paulo', '1960-10-02', 66795), -- São Paulo
('Neo Química Arena', 'São Paulo', '2014-05-10', 49205), -- Corinthians
('Fonte Nova', 'Salvador', '1951-01-28', 50000), -- Bahia
('Mineirão', 'Belo Horizonte', '1965-09-05', 61846), -- Cruzeiro
('São Januário', 'Rio de Janeiro', '1927-04-21', 21880), -- Vasco da Gama
('Barradão', 'Salvador', '1986-11-11', 35000), -- EC Vitória
('Mineirão', 'Belo Horizonte', '1965-09-05', 61846), -- Atlético-MG
('Maracanã', 'Rio de Janeiro', '1950-06-16', 78838), -- Fluminense
('Arena do Grêmio', 'Porto Alegre', '2012-12-08', 60540), -- Grêmio
('Alfredo Jaconi', 'Caxias do Sul', '1975-03-23', 30519), -- Juventude
('Nabi Abi Chedid', 'Bragança Paulista', '1949-01-06', 17724), -- Bragantino
('Arena da Baixada', 'Curitiba', '1914-06-06', 42372), -- Atlético-PR
('Heriberto Hülse', 'Criciúma', '1955-10-16', 19300), -- Criciúma
('Antônio Accioly', 'Goiânia', '2018-08-18', 12500), -- Atlético-GO
('Arena Pantanal', 'Cuiabá', '2014-04-26', 44003), -- Cuiabá
('Vila Belmiro', 'Santos', '1916-10-12', 16068), -- Santos
('Couto Pereira', 'Curitiba', '1932-11-20', 40502), -- Coritiba
('Ilha do Retiro', 'Recife', '1937-07-04', 32000), -- Sport Recife
('Arena Condá', 'Chapecó', '2009-02-01', 20089); -- Chapecoense

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



