CREATE DATABASE IF NOT EXISTS Campeonato_Futebol;
DROP DATABASE Campeonato_Futebol;
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
('Bragantino','https://ssl.gstatic.com/onebox/media/sports/logos/lMyw2zn1Z4cdkaxKJWnsQw_48x48.png','Marco Antonio Chedid', '1928-01-08', 0),
('Atlético-PR','https://ssl.gstatic.com/onebox/media/sports/logos/9LkdBR4L5plovKM8eIy7nQ_48x48.png','Mario Celso Petraglia', '1924-03-26', 1),
('Atlético-GO','https://ssl.gstatic.com/onebox/media/sports/logos/9mqMGndwoR9og_Z0uEl2kw_48x48.png','Adson Batista', '1937-04-02', 0),
('Cuiabá','https://ssl.gstatic.com/onebox/media/sports/logos/j6U8Rgt_6yyf0Egs9nREXw_48x48.png', 'Cristiano Dresch', '2001-12-12', 0),
('Santos','data:image/png;base64,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','Andrés Rueda', '1912-04-14', 8),
('Chapecoense','https://ssl.gstatic.com/onebox/media/sports/logos/K7JQUKTRsuXfO9YrD5dq5g_48x48.png','Paulo Magro', '1973-05-10', 0);
SELECT * FROM Clube;



-- Tabela de Gol--------------------------------------
DROP TABLE IF EXISTS Gol;
CREATE TABLE IF NOT EXISTS Gol (
    ID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    minuto INT,
    tipo VARCHAR(50), -- Ex: 'Normal', 'Pênalti', 'Contra'
    fk_partida INT,
    fk_jogador INT,
    fk_clube INT,
    fk_arbitro INT,
    -- chaves estrangeiras --
    FOREIGN KEY (fk_partida) REFERENCES Partida(ID),
    FOREIGN KEY (fk_jogador) REFERENCES Jogador(ID),
    FOREIGN KEY (fk_clube) REFERENCES Clube(ID),
    FOREIGN KEY (fk_arbitro) REFERENCES Arbitro(ID_Arbitro) -- Descomente se houver tabela de árbitros
);

INSERT INTO Gol (minuto, tipo, fk_partida, fk_jogador, fk_clube, fk_arbitro) VALUES
(12, 'Normal', 1, 10, 1, 1), -- Exemplo: Tiquinho Soares (Botafogo) marcou aos 12 do 1º tempo na partida 1
(45, 'Pênalti', 1, 11, 2, 2), -- Exemplo: Rony (Palmeiras) marcou de pênalti aos 45 do 1º tempo na partida 1
(67, 'Normal', 2, 10, 3, 3), -- Gabriel Barbosa (Flamengo) marcou aos 67 do 2º tempo na partida 2
(23, 'Contra', 3, 5, 6, 4), -- Luciano (São Paulo) gol contra aos 23 do 1º tempo na partida 3
(78, 'Normal', 4, 9, 4, 5), -- Marinho (Fortaleza) marcou aos 78 do 2º tempo na partida 4
(15, 'Pênalti', 5, 3, 5, 6), -- Vitão (Internacional) marcou de pênalti aos 15 do 1º tempo na partida 5
(90, 'Normal', 6, 7, 6, 7), -- Luciano (São Paulo) marcou aos 90 do 2º tempo na partida 6
(34, 'Normal', 7, 8, 7, 8), -- Wesley (Corinthians) marcou aos 34 do 1º tempo na partida 7
(50, 'Contra', 8, 2, 8, 9), -- Gilberto (Bahia) gol contra aos 50 do 2º tempo na partida 8
(22, 'Normal', 9, 4, 9, 10), -- Enner Valencia (Internacional) marcou aos 22 do 1º tempo na partida 9
(60, 'Pênalti', 10, 6, 10, 11), -- Calleri (São Paulo) marcou de pênalti aos 60 do 2º tempo na partida 10
(88, 'Normal', 11, 5, 11, 12), -- Fabricio Bustos (Internacional) marcou aos 88 do 2º tempo na partida 11
(40, 'Contra', 12, 1, 12, 13), -- Gatito Fernández (Botafogo) gol contra aos 40 do 1º tempo na partida 12
(30, 'Normal', 13, 2, 13, 14), -- Marcos Rocha (Palmeiras) marcou aos 30 do 1º tempo na partida 13
(75, 'Pênalti', 14, 3, 14, 15), -- Rossi (Flamengo) marcou de pênalti aos 75 do 2º tempo na partida 14
(55, 'Normal', 15, 4, 1, 1), -- Tinga (Fortaleza) marcou aos 55 do 2º tempo na partida 15
(10, 'Contra', 16, 6, 16, 1); -- Arboleda (São Paulo) gol contra aos 10 do 1º tempo na partida 16

SELECT * FROM Gol;

-- Tabela de Cartão
DROP TABLE IF EXISTS Cartao;
CREATE TABLE IF NOT EXISTS Cartao (
    ID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    tipo VARCHAR(20), -- Ex: 'Amarelo', 'Vermelho'
    minuto INT,
    fk_partida INT,
    fk_jogador INT,
    fk_clube INT,
    -- chaves estrangeiras --
    FOREIGN KEY (fk_partida) REFERENCES Partida(ID),
    FOREIGN KEY (fk_jogador) REFERENCES Jogador(ID),
    FOREIGN KEY (fk_clube) REFERENCES Clube(ID)
);

-- Cartões
INSERT INTO Cartao (tipo, minuto, fk_partida, fk_jogador, fk_clube) VALUES
('Amarelo', 30, 1, 6, 1), -- Marlon Freitas (Botafogo) levou amarelo aos 30 do 1º tempo na partida 1
('Vermelho', 80, 2, 7, 4), -- Pochettino (Fortaleza) levou vermelho aos 80 do 2º tempo na partida 2
('Amarelo', 55, 3, 3, 5), -- Vitão (Internacional) levou amarelo aos 55 do 2º tempo na partida 3
('Amarelo', 12, 4, 2, 8), -- Gilberto (Bahia) levou amarelo aos 12 do 1º tempo na partida 4
('Vermelho', 90, 5, 4, 9), -- Enner Valencia (Internacional) levou vermelho aos 90 do 2º tempo na partida 5
('Amarelo', 45, 6, 5, 10), -- Fabricio Bustos (Internacional) levou amarelo aos 45 do 1º tempo na partida 6
('Amarelo', 20, 7, 8, 11), -- Wesley (Corinthians) levou amarelo aos 20 do 1º tempo na partida 7
('Vermelho', 70, 8, 9, 12), -- Tinga (Fortaleza) levou vermelho aos 70 do 2º tempo na partida 8
('Amarelo', 15, 9, 10, 13), -- Calleri (São Paulo) levou amarelo aos 15 do 1º tempo na partida 9
('Amarelo', 60, 10, 11, 14), -- Rossi (Flamengo) levou amarelo aos 60 do 2º tempo na partida 10
('Vermelho', 50, 11, 12, 15), -- Gatito Fernández (Botafogo) levou vermelho aos 50 do 2º tempo na partida 11
('Amarelo', 25, 12, 13, 16), -- Arboleda (São Paulo) levou amarelo aos 25 do primeiro tempo na partida12
('Amarelo', 35, 13, 14, 17), -- Calleri (São Paulo) levou amarelo aos 35 do primeiro tempo na partida13
('Vermelho', 65, 14, 15, 18), -- Rossi (Flamengo) levou vermelho aos 65 do segundo tempo na partida14
('Amarelo', 45, 15, 16, 19), -- Gatito Fernández (Botafogo) levou amarelo aos 45 do primeiro tempo na partida15
('Amarelo', 55, 16, 17, 20); -- Arboleda (São Paulo) levou amarelo aos 55 do segundo tempo na partida16



--rodada--------------------------------------
DROP TABLE IF EXISTS Rodada;
CREATE TABLE IF NOT EXISTS Rodada(
    id INT AUTO_INCREMENT PRIMARY KEY,
    numero_rodada INT,
    data_começo DATE,
    data_termino DATE,
    fk_Campeonato INT,
     FOREIGN KEY (fk_Campeonato) REFERENCES Campeonato(ID_Campeonato)  
);
SET @id := LAST_INSERT_ID();

INSERT INTO Rodada (numero_rodada, data_começo, data_termino, fk_Campeonato) VALUES
(1,  '2025-04-16', '2025-04-20', 1),
(2,  '2025-04-21', '2025-04-25', 1),
(3,  '2025-04-26', '2025-04-30', 1),
(4,  '2025-05-01', '2025-05-05', 1),
(5,  '2025-05-06', '2025-05-10', 1),
(6,  '2025-05-11', '2025-05-15', 1),
(7,  '2025-05-16', '2025-05-20', 1),
(8,  '2025-05-21', '2025-05-25', 1),
(9,  '2025-05-26', '2025-05-30', 1),
(10, '2025-05-31', '2025-06-04', 1),
(11, '2025-06-05', '2025-06-09', 1),
(12, '2025-06-10', '2025-06-14', 1),
(13, '2025-06-15', '2025-06-19', 1),
(14, '2025-06-20', '2025-06-24', 1),
(15, '2025-06-25', '2025-06-29', 1),
(16, '2025-06-30', '2025-07-04', 1),
(17, '2025-07-05', '2025-07-09', 1),
(18, '2025-07-10', '2025-07-14', 1),
(19, '2025-07-15', '2025-07-19', 1),
(20, '2025-07-20', '2025-07-24', 1),
(21, '2025-07-25', '2025-07-29', 1),
(22, '2025-07-30', '2025-08-03', 1),
(23, '2025-08-04', '2025-08-08', 1),
(24, '2025-08-09', '2025-08-13', 1),
(25, '2025-08-14', '2025-08-18', 1),
(26, '2025-08-19', '2025-08-23', 1),
(27, '2025-08-24', '2025-08-28', 1),
(28, '2025-08-29', '2025-09-02', 1),
(29, '2025-09-03', '2025-09-07', 1),
(30, '2025-09-08', '2025-09-12', 1),
(31, '2025-09-13', '2025-09-17', 1),
(32, '2025-09-18', '2025-09-22', 1),
(33, '2025-09-23', '2025-09-27', 1),
(34, '2025-09-28', '2025-10-02', 1),
(35, '2025-10-03', '2025-10-07', 1),
(36, '2025-10-08', '2025-10-12', 1),
(37, '2025-10-13', '2025-10-17', 1),
(38, '2025-10-18', '2025-10-22', 1);
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

SELECT * from jogador;
----Botafogo-----------------------------------
INSERT INTO Jogador (Nome, Nacionalidade, Posicao, Pe_dominante, numero_camisa, fk_clube) VALUES
('Gatito Fernández', 'Paraguai', 'Goleiro', 'Direito', 1, 1),
('Di Plácido', 'Argentina', 'Lateral Direito', 'Direito', 24, 1),
('Adryelson', 'Brasil', 'Zagueiro', 'Direito', 34, 1),
('Victor Cuesta', 'Argentina', 'Zagueiro', 'Esquerdo', 15, 1),
('Hugo', 'Brasil', 'Lateral Esquerdo', 'Esquerdo', 16, 1),
('Marlon Freitas', 'Brasil', 'Volante', 'Direito', 17, 1),
('Tchê Tchê', 'Brasil', 'Meia', 'Direito', 6, 1),
('Eduardo', 'Brasil', 'Meia', 'Direito', 33, 1),
('Luiz Henrique', 'Brasil', 'Atacante', 'Esquerdo', 7, 1),
('Júnior Santos', 'Brasil', 'Atacante', 'Direito', 11, 1),
('Tiquinho Soares', 'Brasil', 'Atacante', 'Direito', 9, 1);

----Palmeiras-----------------------------------
INSERT INTO Jogador (Nome, Nacionalidade, Posicao, Pe_dominante, numero_camisa, fk_clube) VALUES
('Weverton', 'Brasil', 'Goleiro', 'Direito', 21, 2),
('Marcos Rocha', 'Brasil', 'Lateral Direito', 'Direito', 2, 2),
('Gustavo Gómez', 'Paraguai', 'Zagueiro', 'Direito', 15, 2),
('Murilo', 'Brasil', 'Zagueiro', 'Esquerdo', 26, 2),
('Piquerez', 'Uruguai', 'Lateral Esquerdo', 'Esquerdo', 22, 2),
('Zé Rafael', 'Brasil', 'Volante', 'Esquerdo', 8, 2),
('Richard Ríos', 'Colômbia', 'Volante', 'Direito', 27, 2),
('Raphael Veiga', 'Brasil', 'Meia', 'Direito', 23, 2),
('Mayke', 'Brasil', 'Lateral', 'Direito', 12, 2),
('Endrick', 'Brasil', 'Atacante', 'Esquerdo', 9, 2),
('Rony', 'Brasil', 'Atacante', 'Direito', 10, 2);

----Flamengo-----------------------------------
INSERT INTO Jogador (Nome, Nacionalidade, Posicao, Pe_dominante, numero_camisa, fk_clube) VALUES
('Rossi', 'Brasil', 'Goleiro', 'Direito', 1, 3),
('Varela', 'Uruguai', 'Lateral Direito', 'Direito', 2, 3),
('Fabrício Bruno', 'Brasil', 'Zagueiro', 'Direito', 15, 3),
('Léo Pereira', 'Brasil', 'Zagueiro', 'Esquerdo', 4, 3),
('Ayrton Lucas', 'Brasil', 'Lateral Esquerdo', 'Esquerdo', 6, 3),
('Allan', 'Brasil', 'Volante', 'Direito', 21, 3),
('De la Cruz', 'Uruguai', 'Meia', 'Direito', 18, 3),
('Arrascaeta', 'Uruguai', 'Meia', 'Esquerdo', 14, 3),
('Everton Cebolinha', 'Brasil', 'Atacante', 'Direito', 11, 3),
('Pedro', 'Brasil', 'Atacante', 'Direito', 9, 3),
('Gabriel Barbosa', 'Brasil', 'Atacante', 'Esquerdo', 10, 3);
----Fortaleza-----------------------------------
INSERT INTO Jogador (Nome, Nacionalidade, Posicao, Pe_dominante, numero_camisa, fk_clube) VALUES
('João Ricardo', 'Brasil', 'Goleiro', 'Direito', 1, 4),
('Tinga', 'Brasil', 'Lateral Direito', 'Direito', 2, 4),
('Titi', 'Brasil', 'Zagueiro', 'Esquerdo', 4, 4),
('Brítez', 'Argentina', 'Zagueiro', 'Direito', 19, 4),
('Bruno Pacheco', 'Brasil', 'Lateral Esquerdo', 'Esquerdo', 6, 4),
('Caio Alexandre', 'Brasil', 'Volante', 'Direito', 8, 4),
('Zé Welison', 'Brasil', 'Volante', 'Direito', 17, 4),
('Pochettino', 'Argentina', 'Meia', 'Direito', 7, 4),
('Yago Pikachu', 'Brasil', 'Meia', 'Direito', 22, 4),
('Lucero', 'Argentina', 'Atacante', 'Direito', 9, 4),
('Marinho', 'Brasil', 'Atacante', 'Esquerdo', 11, 4);

----Internacional-----------------------------------
INSERT INTO Jogador (Nome, Nacionalidade, Posicao, Pe_dominante, numero_camisa, fk_clube) VALUES
('Sergio Rochet', 'Uruguai', 'Goleiro', 'Direito', 33, 5),
('Fabricio Bustos', 'Argentina', 'Lateral Direito', 'Direito', 16, 5),
('Vitão', 'Brasil', 'Zagueiro', 'Direito', 44, 5),
('Mercado', 'Argentina', 'Zagueiro', 'Direito', 25, 5),
('Renê', 'Brasil', 'Lateral Esquerdo', 'Esquerdo', 6, 5),
('Aránguiz', 'Chile', 'Volante', 'Direito', 20, 5),
('Bruno Henrique', 'Brasil', 'Volante', 'Direito', 8, 5),
('Alan Patrick', 'Brasil', 'Meia', 'Esquerdo', 10, 5),
('Maurício', 'Brasil', 'Meia', 'Direito', 27, 5),
('Wanderson', 'Brasil', 'Atacante', 'Esquerdo', 11, 5),
('Enner Valencia', 'Equador', 'Atacante', 'Direito', 13, 5);
----São Paulo-----------------------------------
INSERT INTO Jogador (Nome, Nacionalidade, Posicao, Pe_dominante, numero_camisa, fk_clube) VALUES
('Rafael', 'Brasil', 'Goleiro', 'Direito', 23, 6),
('Rafinha', 'Brasil', 'Lateral Direito', 'Direito', 13, 6),
('Arboleda', 'Equador', 'Zagueiro', 'Direito', 5, 6),
('Alan Franco', 'Argentina', 'Zagueiro', 'Esquerdo', 28, 6),
('Welington', 'Brasil', 'Lateral Esquerdo', 'Esquerdo', 6, 6),
('Alisson', 'Brasil', 'Meia', 'Direito', 25, 6),
('Pablo Maia', 'Brasil', 'Volante', 'Direito', 29, 6),
('Rodrigo Nestor', 'Brasil', 'Meia', 'Esquerdo', 11, 6),
('Luciano', 'Brasil', 'Atacante', 'Direito', 10, 6),
('Calleri', 'Argentina', 'Atacante', 'Esquerdo', 9, 6),
('Ferraresi', 'Venezuela', 'Zagueiro', 'Direito', 32, 6);
----Corinthians-----------------------------------
INSERT INTO Jogador (Nome, Nacionalidade, Posicao, Pe_dominante, numero_camisa, fk_clube) VALUES
('Cássio', 'Brasil', 'Goleiro', 'Direito', 12, 7),
('Fagner', 'Brasil', 'Lateral Direito', 'Direito', 23, 7),
('Félix Torres', 'Equador', 'Zagueiro', 'Direito', 3, 7),
('Gustavo Henrique', 'Brasil', 'Zagueiro', 'Direito', 4, 7),
('Hugo', 'Brasil', 'Lateral Esquerdo', 'Esquerdo', 46, 7),
('Raniele', 'Brasil', 'Volante', 'Direito', 14, 7),
('Maycon', 'Brasil', 'Meia', 'Esquerdo', 7, 7),
('Fausto Vera', 'Argentina', 'Meia', 'Direito', 5, 7),
('Wesley', 'Brasil', 'Atacante', 'Direito', 36, 7),
('Pedro Raul', 'Brasil', 'Atacante', 'Direito', 9, 7),
('Yuri Alberto', 'Brasil', 'Atacante', 'Direito', 9, 7);
----Bahia-----------------------------------
INSERT INTO Jogador (Nome, Nacionalidade, Posicao, Pe_dominante, numero_camisa, fk_clube) VALUES
('Marcos Felipe', 'Brasil', 'Goleiro', 'Direito', 1, 8),
('Gilberto', 'Brasil', 'Lateral Direito', 'Direito', 2, 8),
('Kanu', 'Brasil', 'Zagueiro', 'Direito', 4, 8),
('Victor Cuesta', 'Argentina', 'Zagueiro', 'Esquerdo', 33, 8),
('Luciano Juba', 'Brasil', 'Lateral Esquerdo', 'Esquerdo', 6, 8),
('Caio Alexandre', 'Brasil', 'Volante', 'Direito', 8, 8),
('Jean Lucas', 'Brasil', 'Meia', 'Direito', 6, 8),
('Cauly', 'Brasil', 'Meia', 'Direito', 8, 8),
('Everton Ribeiro', 'Brasil', 'Meia', 'Esquerdo', 10, 8),
('Biel', 'Brasil', 'Atacante', 'Esquerdo', 11, 8),
('Everton', 'Brasil', 'Atacante', 'Direito', 7, 8);
----Cruzeiro-----------------------------------
INSERT INTO Jogador (Nome, Nacionalidade, Posicao, Pe_dominante, numero_camisa, fk_clube) VALUES
('Rafael Cabral', 'Brasil', 'Goleiro', 'Direito', 1, 9),
('Raúl Cáceres', 'Paraguai', 'Lateral Direito', 'Direito', 2, 9),
('Eduardo Brock', 'Brasil', 'Zagueiro', 'Esquerdo', 4, 9),
('Luciano Castán', 'Brasil', 'Zagueiro', 'Direito', 3, 9),
('Matheus Pereira', 'Brasil', 'Lateral Esquerdo', 'Esquerdo', 6, 9),
('Felipe Machado', 'Brasil', 'Volante', 'Direito', 5, 9),
('Lucas Oliveira', 'Brasil', 'Meia', 'Direito', 8, 9),
('Matheus Vital', 'Brasil', 'Meia', 'Esquerdo', 10, 9),
('Bruno Rodrigues', 'Brasil', 'Atacante', 'Esquerdo', 11, 9),
('Eduardo Vargas', 'Chile', 'Atacante', 'Direito', 7, 9),
('Rodolfo Pagliuca Júnior','Brasil','Atacante','Direito' ,20 ,9);
----Vasco da Gama-----------------------------------
INSERT INTO Jogador (Nome, Nacionalidade, Posicao, Pe_dominante, numero_camisa, fk_clube) VALUES
('Léo Jardim', 'Brasil', 'Goleiro', 'Direito', 1, 10),
('Puma Rodríguez', 'Uruguai', 'Lateral Direito', 'Direito', 2, 10),
('Léo', 'Brasil', 'Zagueiro', 'Esquerdo', 3, 10),
('Medel', 'Chile', 'Zagueiro', 'Direito', 17, 10),
('Lucas Piton', 'Brasil', 'Lateral Esquerdo', 'Esquerdo', 6, 10),
('Zé Gabriel', 'Brasil', 'Volante', 'Direito', 23, 10),
('Sforza', 'Argentina', 'Volante', 'Direito', 8, 10),
('Payet', 'França', 'Meia', 'Direito', 10, 10),
('Galdames', 'Chile', 'Meia', 'Direito', 27, 10),
('Adson', 'Brasil', 'Atacante', 'Esquerdo', 28, 10),
('Vegetti', 'Argentina', 'Atacante', 'Direito', 99, 10);
----EC Vitória-----------------------------------
INSERT INTO Jogador (Nome, Nacionalidade, Posicao, Pe_dominante, numero_camisa, fk_clube) VALUES
('Lucas Arcanjo', 'Brasil', 'Goleiro', 'Direito', 1, 11),
('Zeca', 'Brasil', 'Lateral Direito', 'Direito', 2, 11),
('Wagner Leonardo', 'Brasil', 'Zagueiro', 'Esquerdo', 4, 11),
('João Victor', 'Brasil', 'Zagueiro', 'Direito', 13, 11),
('Patric Calmon', 'Brasil', 'Lateral Esquerdo', 'Esquerdo', 6, 11),
('Dudu', 'Brasil', 'Volante', 'Direito', 5, 11),
('Rodrigo Andrade', 'Brasil', 'Meia', 'Direito', 8, 11),
('Matheusinho', 'Brasil', 'Meia', 'Esquerdo', 10, 11),
('Osvaldo', 'Brasil', 'Atacante', 'Direito', 11, 11),
('Iury Castilho', 'Brasil', 'Atacante', 'Direito', 9, 11),
('Caio Dantas', 'Brasil', 'Atacante', 'Esquerdo', 99, 11);
----Atlético-MG-----------------------------------
INSERT INTO Jogador (Nome, Nacionalidade, Posicao, Pe_dominante, numero_camisa, fk_clube) VALUES
('Everson', 'Brasil', 'Goleiro', 'Esquerdo', 22, 12),
('Saravia', 'Argentina', 'Lateral Direito', 'Direito', 26, 12),
('Bruno Fuchs', 'Brasil', 'Zagueiro', 'Direito', 3, 12),
('Mauricio Lemos', 'Uruguai', 'Zagueiro', 'Direito', 4, 12),
('Guilherme Arana', 'Brasil', 'Lateral Esquerdo', 'Esquerdo', 13, 12),
('Otávio', 'Brasil', 'Volante', 'Direito', 5, 12),
('Battaglia', 'Argentina', 'Volante', 'Direito', 21, 12),
('Paulinho', 'Brasil', 'Meia', 'Esquerdo', 10, 12),
('Zaracho', 'Argentina', 'Meia', 'Direito', 15, 12),
('Hulk', 'Brasil', 'Atacante', 'Esquerdo', 7, 12),
('Eduardo Vargas', 'Chile', 'Atacante', 'Direito', 11, 12);
----Fluminense-----------------------------------
INSERT INTO Jogador (Nome, Nacionalidade, Posicao, Pe_dominante, numero_camisa, fk_clube) VALUES
('Fábio', 'Brasil', 'Goleiro', 'Direito', 1, 13),
('Samuel Xavier', 'Brasil', 'Lateral Direito', 'Direito', 2, 13),
('Felipe Melo', 'Brasil', 'Zagueiro', 'Esquerdo', 30, 13),
('Manoel', 'Brasil', 'Zagueiro', 'Direito', 26, 13),
('Marcelo', 'Brasil', 'Lateral Esquerdo', 'Esquerdo', 12, 13),
('André', 'Brasil', 'Volante', 'Direito', 7, 13),
('Martinelli', 'Brasil', 'Volante', 'Direito', 8, 13),
('Ganso', 'Brasil', 'Meia', 'Esquerdo', 10, 13),
('Arias', 'Colômbia', 'Meia', 'Esquerdo', 21, 13),
('Keno', 'Brasil', 'Atacante', 'Direito', 11, 13),
('Germán Cano', 'Argentina', 'Atacante', 'Direito', 14, 13);
----Grêmio-----------------------------------
INSERT INTO Jogador (Nome, Nacionalidade, Posicao, Pe_dominante, numero_camisa, fk_clube) VALUES
('Marchesín', 'Argentina', 'Goleiro', 'Direito', 1, 14),
('João Pedro', 'Brasil', 'Lateral Direito', 'Direito', 18, 14),
('Kannemann', 'Argentina', 'Zagueiro', 'Esquerdo', 4, 14),
('Rodrigo Ely', 'Brasil', 'Zagueiro', 'Direito', 34, 14),
('Reinaldo', 'Brasil', 'Lateral Esquerdo', 'Esquerdo', 6, 14),
('Pepê', 'Brasil', 'Volante', 'Esquerdo', 23, 14),
('Carballo', 'Uruguai', 'Volante', 'Direito', 8, 14),
('Cristaldo', 'Argentina', 'Meia', 'Esquerdo', 10, 14),
('Franco Cristaldo', 'Argentina', 'Meia', 'Esquerdo', 19, 14),
('Soteldo', 'Venezuela', 'Atacante', 'Esquerdo', 7, 14),
('Diego Costa', 'Brasil', 'Atacante', 'Direito', 19, 14);
----Bragantino-----------------------------------
INSERT INTO Jogador (Nome, Nacionalidade, Posicao, Pe_dominante, numero_camisa, fk_clube) VALUES
('Cleiton', 'Brasil', 'Goleiro', 'Direito', 18, 15),
('Aderlan', 'Brasil', 'Lateral Direito', 'Direito', 13, 15),
('Léo Ortiz', 'Brasil', 'Zagueiro', 'Direito', 3, 15),
('Eduardo Santos', 'Brasil', 'Zagueiro', 'Esquerdo', 14, 15),
('Juninho Capixaba', 'Brasil', 'Lateral Esquerdo', 'Esquerdo', 29, 15),
('Jadsom Silva', 'Brasil', 'Volante', 'Direito', 5, 15),
('Eric Ramires', 'Brasil', 'Meia', 'Direito', 8, 15),
('Lucas Evangelista', 'Brasil', 'Meia', 'Direito', 8, 15),
('Helinho', 'Brasil', 'Atacante', 'Esquerdo', 11, 15),
('Eduardo Sasha', 'Brasil', 'Atacante', 'Direito', 19, 15),
('Thiago Borbas', 'Uruguai', 'Atacante', 'Direito', 9, 15);
----Atlético-PR-----------------------------------
INSERT INTO Jogador (Nome, Nacionalidade, Posicao, Pe_dominante, numero_camisa, fk_clube) VALUES
('Bento', 'Brasil', 'Goleiro', 'Direito', 1, 16),
('Madson', 'Brasil', 'Lateral Direito', 'Direito', 23, 16),
('Thiago Heleno', 'Brasil', 'Zagueiro', 'Direito', 44, 16),
('Kaique Rocha', 'Brasil', 'Zagueiro', 'Esquerdo', 4, 16),
('Vinicius Kauê', 'Brasil', 'Lateral Esquerdo', 'Esquerdo', 16, 16),
('Fernandinho', 'Brasil', 'Volante', 'Direito', 5, 16),
('Erick', 'Brasil', 'Volante', 'Direito', 26, 16),
('Christian', 'Brasil', 'Meia', 'Esquerdo', 88, 16),
('Vitor Bueno', 'Brasil', 'Meia', 'Direito', 8, 16),
('Canobbio', 'Uruguai', 'Atacante', 'Direito', 9, 16),
('Pablo', 'Brasil', 'Atacante', 'Direito', 92, 16);
----Atlético-GO-----------------------------------
INSERT INTO Jogador (Nome, Nacionalidade, Posicao, Pe_dominante, numero_camisa, fk_clube) VALUES
('Ronaldo', 'Brasil', 'Goleiro', 'Direito', 1, 17),
('Bruno Tubarão', 'Brasil', 'Lateral Direito', 'Direito', 2, 17),
('Alix', 'Brasil', 'Zagueiro', 'Direito', 4, 17),
('Lucas Rocha', 'Brasil', 'Zagueiro', 'Esquerdo', 3, 17),
('Guilherme Romão', 'Brasil', 'Lateral Esquerdo', 'Esquerdo', 6, 17),
('Rhaldney', 'Brasil', 'Volante', 'Direito', 5, 17),
('Baralhas', 'Brasil', 'Meia', 'Direito', 8, 17),
('Shaylon', 'Brasil', 'Meia', 'Esquerdo', 10, 17),
('Luiz Fernando', 'Brasil', 'Atacante', 'Direito', 11, 17),
('Derek', 'Brasil', 'Atacante', 'Direito', 9, 17),
('Vagner Love', 'Brasil', 'Atacante', 'Direito', 99, 17);
----Cuiabá-----------------------------------
INSERT INTO Jogador (Nome, Nacionalidade, Posicao, Pe_dominante, numero_camisa, fk_clube) VALUES
('Walter', 'Brasil', 'Goleiro', 'Direito', 1, 18),
('Matheus Alexandre', 'Brasil', 'Lateral Direito', 'Direito', 2, 18),
('Alan Empereur', 'Brasil', 'Zagueiro', 'Esquerdo', 4, 18),
('Marllon', 'Brasil', 'Zagueiro', 'Direito', 3, 18),
('Patric Calmon', 'Brasil', 'Lateral Esquerdo', 'Esquerdo', 6, 18),
('Denilson', 'Brasil', 'Volante', 'Direito', 8, 18),
('Raniele', 'Brasil', 'Volante', 'Direito', 5, 18),
('Clayson', 'Brasil', 'Meia', 'Esquerdo', 10, 18),
('Lucas Fernandes', 'Brasil', 'Meia', 'Direito', 7, 18),
('Deyverson', 'Brasil', 'Atacante', 'Esquerdo', 9, 18),
('Isidro Pitta', 'Paraguai', 'Atacante', 'Direito', 19, 18);
----Santos-----------------------------------
INSERT INTO Jogador (Nome, Nacionalidade, Posicao, Pe_dominante, numero_camisa, fk_clube) VALUES
('João Paulo', 'Brasil', 'Goleiro', 'Direito', 1, 19),
('Aderlan', 'Brasil', 'Lateral Direito', 'Direito', 2, 19),
('Gil', 'Brasil', 'Zagueiro', 'Direito', 4, 19),
('Joaquim', 'Brasil', 'Zagueiro', 'Esquerdo', 28, 19),
('Felipe Jonatan', 'Brasil', 'Lateral Esquerdo', 'Esquerdo', 3, 19),
('Tomás Rincón', 'Venezuela', 'Volante', 'Direito', 8, 19),
('Diego Pituca', 'Brasil', 'Volante', 'Esquerdo', 21, 19),
('Giuliano', 'Brasil', 'Meia', 'Direito', 10, 19),
('Neymar', 'Brasil', 'Atacante', 'Destro', 11, 19),
('Otero', 'Venezuela', 'Meia', 'Direito', 7, 19),
('Julio Furch', 'Argentina', 'Atacante', 'Direito', 9, 19);

----Chapecoense----------------------------------0
INSERT INTO Jogador (Nome, Nacionalidade, Posicao, Pe_dominante, numero_camisa, fk_clube) VALUES
('Airton', 'Brasil', 'Goleiro', 'Direito', 1, 20),
('Cristovam', 'Brasil', 'Lateral Direito', 'Direito', 2, 20),
('Joilson', 'Brasil', 'Zagueiro', 'Direito', 3, 20),
('Victor Ramos', 'Brasil', 'Zagueiro', 'Esquerdo', 4, 20),
('Fernando', 'Brasil', 'Lateral Esquerdo', 'Esquerdo', 6, 20),
('Ralf', 'Brasil', 'Volante', 'Direito', 5, 20),
('Bruno Silva', 'Brasil', 'Volante', 'Direito', 8, 20),
('Marcinho', 'Brasil', 'Meia', 'Direito', 10, 20),
('Felipe Ferreira', 'Brasil', 'Meia', 'Esquerdo', 11, 20),
('Perotti', 'Brasil', 'Atacante', 'Direito', 9, 20),
('Maxwell', 'Brasil', 'Atacante', 'Esquerdo', 7, 20);
--tabela técnico------------------------------------

SELECT * from jogador;
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


INSERT INTO Tecnico (Nome, Data_Nascimento, Nacionalidade, fk_clube) VALUES
('Renato Paiva','1970-03-22' ,'Portuguesa', 1 ),
('Abel Ferreira','1978-12-22','Portuguesa',2 ),
('Filipe Luís','1985-08-09','Brasileiro',3 ),
('Pablo Vojvoda','1975-01-13','Argentino',4 ),
('Roger Machado','1975-03-04','Brasileiro',5 ),
('Luis Zubeldia','1981-01-13','Argentino',6 ),
('Dorival Júnior','1962-04-25','Brasileiro',7 ),
('Rogério Ceni','1973-01-22','Brasileiro',8 ),
('Leonardo Jardim','1974-08-1','Venezuelano',9 ),
('Fernando Diniz','1974-03-27','Brasileiro',10 ),
('Thiago Carpini','1984-07-16','Brasileiro',11 ),
('Cuca','1963-06-07','Brasileiro',12 ),
('Renato Gaúcho','1962-09-09','Brasileiro',13 ),
('Mano Menezes','1962-06-11','Brasileiro',14 ),
('Fernando Seabra','1977-06-19','Brasileiro',15 ),
('Odair Hellmann','1977-01-22','Brasileiro',16),
('Umberto Louzer','1980-02-24','brasileiro',17),
('Guto Ferreira','1965-09-07','Brasileiro',18 ),
('Cléber Xavier','1964-03-29','Brasileiro',19 ),
('Gilmar Dal Pozzo','1969-09-01','Brasileiro',20 );

--Tabela Arbitro--------------------------------------------
DROP TABLE IF EXISTS Arbitro;
CREATE TABLE IF NOT EXISTS Arbitro(
    ID_Arbitro INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Nome VARCHAR(100),
    Data_Nascimento DATE,
    Nacionalidade VARCHAR (50),
    experiencia INT
);

INSERT INTO Arbitro (Nome, Data_Nascimento, Nacionalidade, experiencia) VALUES
('Wilton Pereira Sampaio', '1982-12-28', 'Brasileiro', 10),
('Raphael Claus', '1983-05-15', 'Brasileiro', 8),
('Anderson Daronco', '1982-09-16', 'Brasileiro', 12),
('Bruno Arleu de Araújo', '1985-03-01', 'Brasileiro', 7),
('Rodrigo Carvalhaes de Miranda', '1984-11-20', 'Brasileiro', 9),
('Leandro Pedro Vuaden', '1980-01-01', 'Brasileiro', 11),
('Sandro Meira Ricci', '1974-09-10', 'Brasileiro', 15),
('Paulo César de Oliveira', '1965-05-20', 'Brasileiro', 20),
('Ricardo Marques Ribeiro', '1981-07-01', 'Brasileiro', 14),
('Flávio Rodrigues de Souza', '1983-04-10', 'Brasileiro', 6),
('Márcio Henrique de Gois', '1980-08-15', 'Brasileiro', 5),
('Thiago Duarte Peixoto', '1986-02-20', 'Brasileiro', 4),
('Rafael Traci', '1981-11-30', 'Brasileiro', 3),
('Jean Pierre Gonçalves Lima', '1982-06-10', 'Brasileiro', 2),
('Wilmar Roldán', '1978-01-01', 'Colombiano', 1);

CREATE TABLE IF NOT EXISTS Arbitro_da_partida (
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
    nome_estadio VARCHAR(100),
    localizacao VARCHAR(100),
    data_construçao DATE,
    capacidade INT
);
SET @ID_Estadio := LAST_INSERT_ID();

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

-- Tabela Partida -------------------------------------
DROP TABLE IF EXISTS Partida;
CREATE TABLE IF NOT EXISTS Partida (
    ID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    resultado_jogo VARCHAR(50),
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
SET @ID := LAST_INSERT_ID();

ALTER TABLE partida
ADD COLUMN fk_arbitro INT,
ADD CONSTRAINT fk_arbitro FOREIGN KEY (fk_arbitro) REFERENCES arbitro(ID_Arbitro);

INSERT INTO Partida (resultado_jogo, data, hora, gols_timeMandante, gols_timeVisitante, fk_campeonato, fk_estadio, fk_timeMandante, fk_timeVisitante, fk_arbitro)
VALUES 
('2-1', '2025-04-16', '16:00:00', 2, 1, 1, 1, 1, 2, 7),
('3-0', '2025-04-17', '18:00:00', 3, 0, 1, 2, 3, 4, 12),
('1-1', '2025-04-17', '20:00:00', 1, 1, 1, 3, 5, 6, 3),
('0-0', '2025-04-18', '15:00:00', 0, 0, 1, 4, 7, 8, 15),
('2-2', '2025-04-18', '17:00:00', 2, 2, 1, 5, 9, 10, 9),
('4-1', '2025-04-19', '19:00:00', 4, 1, 1, 6, 11, 12, 1),
('1-0', '2025-04-19', '14:00:00', 1, 0, 1, 7, 13, 14, 11),
('2-3', '2025-04-20', '16:30:00', 2, 3, 1, 8, 15, 16, 5),
('0-0', '2025-04-20', '18:30:00', 0, 0, 1, 9, 17, 18, 14),
('5-2', '2025-04-20', '20:30:00', 5, 2, 1, 10, 19, 20, 8);

-- Rodada 2: 2025-04-21 a 2025-04-25
INSERT INTO Partida (resultado_jogo, data, hora, gols_timeMandante, gols_timeVisitante, fk_campeonato, fk_estadio, fk_timeMandante, fk_timeVisitante, fk_arbitro)
VALUES 
('1-1', '2025-04-21', '16:00:00', 1, 1, 1, 11, 20, 1, 6),
('2-0', '2025-04-22', '18:00:00', 2, 0, 1, 12, 2, 3, 10),
('3-3', '2025-04-22', '20:00:00', 3, 3, 1, 13, 4, 5, 2),
('0-2', '2025-04-23', '15:00:00', 0, 2, 1, 14, 6, 7, 13),
('4-0', '2025-04-23', '17:00:00', 4, 0, 1, 15, 8, 9, 4),
('1-1', '2025-04-24', '19:00:00', 1, 1, 1, 16, 10, 11, 8),
('2-2', '2025-04-24', '14:00:00', 2, 2, 1, 17, 12, 13, 15),
('0-4', '2025-04-25', '16:30:00', 0, 4, 1, 18, 14, 15, 9),
('3-3', '2025-04-25', '18:30:00', 3, 3, 1, 19, 16, 17, 7),
('2-1', '2025-04-25', '20:30:00', 2, 1, 1, 20, 18, 19, 12);

-- Rodada 3: 2025-04-26 a 2025-04-30INSERT INTO Partida (resultado_jogo, data, hora, gols_timeMandante, gols_timeVisitante, fk_campeonato, fk_estadio, fk_timeMandante, fk_timeVisitante, fk_arbitro)
INSERT INTO Partida (resultado_jogo, data, hora, gols_timeMandante, gols_timeVisitante, fk_campeonato, fk_estadio, fk_timeMandante, fk_timeVisitante, fk_arbitro)
VALUES 
('4-3', '2025-04-26', '16:00:00', 4, 3, 1, 1, 1, 3, 10),
('0-0', '2025-04-26', '18:00:00', 0, 0, 1, 2, 2, 4, 5),
('1-1', '2025-04-27', '20:00:00', 1, 1, 1, 3, 5, 7, 13),
('5-2', '2025-04-27', '15:00:00', 5, 2, 1, 4, 6, 8, 2),
('3-2', '2025-04-28', '17:00:00', 3, 2, 1, 5, 9, 11, 7),
('9-1', '2025-04-28', '19:00:00', 9, 1, 1, 6, 10, 12, 11),
('0-0', '2025-04-29', '14:00:00', 0, 0, 1, 7, 13, 15, 14),
('0-0', '2025-04-29', '16:30:00', 0, 0, 1, 8, 14, 16, 3),
('2-3', '2025-04-30', '18:30:00', 2, 3, 1, 9, 17, 19, 1),
('4-4', '2025-04-30', '20:30:00', 4, 4, 1, 10, 18, 20, 9);

-- Rodada 4: 2025-05-01 a 2025-05-05
INSERT INTO Partida (resultado_jogo, data, hora, gols_timeMandante, gols_timeVisitante, fk_campeonato, fk_estadio, fk_timeMandante, fk_timeVisitante, fk_arbitro)
VALUES 
('2-3', '2025-05-01', '16:00:00', 2, 3, 1, 2, 2, 1, 13),
('0-0', '2025-05-01', '18:00:00', 0, 0, 1, 3, 4, 3, 7),
('3-6', '2025-05-02', '20:00:00', 3, 6, 1, 4, 6, 5, 2),
('8-9', '2025-05-02', '15:00:00', 8, 9, 1, 5, 8, 7, 10),
('2-4', '2025-05-03', '17:00:00', 2, 4, 1, 6, 10, 9, 4),
('5-5', '2025-05-03', '19:00:00', 5, 5, 1, 7, 12, 11, 15),
('8-1', '2025-05-04', '14:00:00', 8, 1, 1, 8, 15, 13, 1),
('1-1', '2025-05-04', '16:30:00', 1, 1, 1, 9, 16, 14, 12),
('0-0', '2025-05-05', '18:30:00', 0, 0, 1, 10, 19, 17, 6),
('0-0', '2025-05-05', '20:30:00', 0, 0, 1, 1, 20, 18, 9);

-- Rodada 5: 2025-05-06 a 2025-05-10
INSERT INTO Partida (resultado_jogo, data, hora, gols_timeMandante, gols_timeVisitante, fk_campeonato, fk_estadio, fk_timeMandante, fk_timeVisitante, fk_arbitro)
VALUES 
('1-1', '2025-05-06', '16:00:00', 1, 1, 1, 3, 3, 1, 11),
('2-2', '2025-05-06', '18:00:00', 2, 2, 1, 4, 5, 2, 5),
('3-1', '2025-05-07', '20:00:00', 3, 1, 1, 5, 7, 4, 14),
('3-1', '2025-05-07', '15:00:00', 3, 1, 1, 6, 9, 6, 8),
('4-2', '2025-05-08', '17:00:00', 4, 2, 1, 7, 11, 8, 3),
('1-4', '2025-05-08', '19:00:00', 1, 4, 1, 8, 13, 10, 15),
('0-2', '2025-05-09', '14:00:00', 0, 2, 1, 9, 15, 12, 10),
('0-1', '2025-05-09', '16:30:00', 0, 1, 1, 10, 17, 14, 2),
('2-1', '2025-05-10', '18:30:00', 2, 1, 1, 1, 19, 16, 6),
('3-4', '2025-05-10', '20:30:00', 3, 4, 1, 2, 20, 18, 13);

INSERT INTO Partida (resultado_jogo, data, hora, gols_timeMandante, gols_timeVisitante, fk_campeonato, fk_estadio, fk_timeMandante, fk_timeVisitante, fk_arbitro)
VALUES 
('2-1', '2025-05-11', '16:00:00', 2, 1, 1, 1, 11, 14, 8),
('1-1', '2025-05-11', '18:00:00', 1, 1, 1, 2, 12, 15, 1),
('0-2', '2025-05-12', '20:00:00', 0, 2, 1, 3, 13, 16, 11),
('3-0', '2025-05-12', '15:00:00', 3, 0, 1, 4, 14, 17, 6),
('2-2', '2025-05-13', '17:00:00', 2, 2, 1, 5, 15, 18, 14),
('1-0', '2025-05-13', '19:00:00', 1, 0, 1, 6, 16, 19, 3),
('0-0', '2025-05-14', '14:00:00', 0, 0, 1, 7, 17, 20, 10),
('1-3', '2025-05-14', '16:30:00', 1, 3, 1, 8, 18, 1, 5),
('2-2', '2025-05-15', '18:30:00', 2, 2, 1, 9, 19, 2, 15),
('0-1', '2025-05-15', '20:30:00', 0, 1, 1, 10, 20, 3, 9);

-- Rodada 7 (2025-05-16 a 2025-05-20)
INSERT INTO Partida (resultado_jogo, data, hora, gols_timeMandante, gols_timeVisitante, fk_campeonato, fk_estadio, fk_timeMandante, fk_timeVisitante, fk_arbitro)
VALUES 
('2-1', '2025-05-11', '16:00:00', 2, 1, 1, 1, 11, 14, 9),
('1-1', '2025-05-11', '18:00:00', 1, 1, 1, 2, 12, 15, 1),
('0-2', '2025-05-12', '20:00:00', 0, 2, 1, 3, 13, 16, 12),
('3-0', '2025-05-12', '15:00:00', 3, 0, 1, 4, 14, 17, 6),
('2-2', '2025-05-13', '17:00:00', 2, 2, 1, 5, 15, 18, 14),
('1-0', '2025-05-13', '19:00:00', 1, 0, 1, 6, 16, 19, 3),
('0-0', '2025-05-14', '14:00:00', 0, 0, 1, 7, 17, 20, 10),
('1-3', '2025-05-14', '16:30:00', 1, 3, 1, 8, 18, 1, 5),
('2-2', '2025-05-15', '18:30:00', 2, 2, 1, 9, 19, 2, 7),
('0-1', '2025-05-15', '20:30:00', 0, 1, 1, 10, 20, 3, 2);

-- Rodada 8 (2025-05-21 a 2025-05-25)
INSERT INTO Partida (resultado_jogo, data, hora, gols_timeMandante, gols_timeVisitante, fk_campeonato, fk_estadio, fk_timeMandante, fk_timeVisitante, fk_arbitro)
VALUES 
('0-0', '2025-05-21', '16:00:00', 0, 0, 1, 1, 14, 17, 4),
('1-2', '2025-05-21', '18:00:00', 1, 2, 1, 2, 15, 18, 11),
('2-2', '2025-05-22', '20:00:00', 2, 2, 1, 3, 16, 19, 7),
('1-0', '2025-05-22', '15:00:00', 1, 0, 1, 4, 17, 20, 15),
('0-1', '2025-05-23', '17:00:00', 0, 1, 1, 5, 18, 1, 9),
('3-3', '2025-05-23', '19:00:00', 3, 3, 1, 6, 19, 2, 2),
('2-1', '2025-05-24', '14:00:00', 2, 1, 1, 7, 20, 3, 13),
('0-0', '2025-05-24', '16:30:00', 0, 0, 1, 8, 1, 4, 6),
('1-1', '2025-05-25', '18:30:00', 1, 1, 1, 9, 2, 5, 10),
('2-2', '2025-05-25', '20:30:00', 2, 2, 1, 10, 3, 6, 8);

-- Rodada 9 (2025-05-26 a 2025-05-30)
INSERT INTO Partida (resultado_jogo, data, hora, gols_timeMandante, gols_timeVisitante, fk_campeonato, fk_estadio, fk_timeMandante, fk_timeVisitante, fk_arbitro)
VALUES 
('1-1', '2025-05-26', '16:00:00', 1, 1, 1, 1, 4, 7, 13),
('0-0', '2025-05-26', '18:00:00', 0, 0, 1, 2, 5, 8, 2),
('2-3', '2025-05-27', '20:00:00', 2, 3, 1, 3, 6, 9, 7),
('1-0', '2025-05-27', '15:00:00', 1, 0, 1, 4, 7, 10, 10),
('2-2', '2025-05-28', '17:00:00', 2, 2, 1, 5, 8, 11, 4),
('0-1', '2025-05-28', '19:00:00', 0, 1, 1, 6, 9, 12, 15),
('3-1', '2025-05-29', '14:00:00', 3, 1, 1, 7, 10, 13, 9),
('1-1', '2025-05-29', '16:30:00', 1, 1, 1, 8, 11, 14, 1),
('0-0', '2025-05-30', '18:30:00', 0, 0, 1, 9, 12, 15, 11),
('2-2', '2025-05-30', '20:30:00', 2, 2, 1, 10, 13, 16, 6);

-- Rodada 10 (2025-05-31 a 2025-06-04)
INSERT INTO Partida (resultado_jogo, data, hora, gols_timeMandante, gols_timeVisitante, fk_campeonato, fk_estadio, fk_timeMandante, fk_timeVisitante, fk_arbitro)
VALUES 
('2-0', '2025-05-31', '16:00:00', 2, 0, 1, 1, 1, 11, 8),
('1-1', '2025-05-31', '18:00:00', 1, 1, 1, 2, 2, 12, 14),
('0-2', '2025-06-01', '20:00:00', 0, 2, 1, 3, 3, 13, 3),
('3-3', '2025-06-01', '15:00:00', 3, 3, 1, 4, 4, 14, 10),
('1-0', '2025-06-02', '17:00:00', 1, 0, 1, 5, 5, 15, 6),
('2-2', '2025-06-02', '19:00:00', 2, 2, 1, 6, 6, 16, 1),
('0-0', '2025-06-03', '14:00:00', 0, 0, 1, 7, 7, 17, 13),
('1-1', '2025-06-03', '16:30:00', 1, 1, 1, 8, 8, 18, 5),
('2-1', '2025-06-04', '18:30:00', 2, 1, 1, 9, 9, 19, 11),
('0-0', '2025-06-04', '20:30:00', 0, 0, 1, 10, 10, 20, 9);

-- Rodada 11 (2025-06-05 a 2025-06-09)
INSERT INTO Partida (resultado_jogo, data, hora, gols_timeMandante, gols_timeVisitante, fk_campeonato, fk_estadio, fk_timeMandante, fk_timeVisitante, fk_arbitro)
VALUES 
('2-1', '2025-06-05', '16:00:00', 2, 1, 1, 1, 1, 12, 5),
('1-1', '2025-06-05', '18:00:00', 1, 1, 1, 2, 2, 13, 10),
('0-2', '2025-06-06', '20:00:00', 0, 2, 1, 3, 3, 14, 13),
('3-0', '2025-06-06', '15:00:00', 3, 0, 1, 4, 4, 15, 2),
('2-2', '2025-06-07', '17:00:00', 2, 2, 1, 5, 5, 16, 8),
('1-0', '2025-06-07', '19:00:00', 1, 0, 1, 6, 6, 17, 15),
('0-1', '2025-06-08', '14:00:00', 0, 1, 1, 7, 7, 18, 4),
('2-3', '2025-06-08', '16:30:00', 2, 3, 1, 8, 8, 19, 11),
('1-0', '2025-06-09', '18:30:00', 1, 0, 1, 9, 9, 20, 7),
('4-4', '2025-06-09', '20:30:00', 4, 4, 1, 10, 10, 11, 1);

-- Rodada 12 (2025-06-10 a 2025-06-14)
INSERT INTO Partida (resultado_jogo, data, hora, gols_timeMandante, gols_timeVisitante, fk_campeonato, fk_estadio, fk_timeMandante, fk_timeVisitante, fk_arbitro)
VALUES 
('1-0', '2025-06-10', '16:00:00', 1, 0, 1, 1, 1, 13, 14),
('2-2', '2025-06-10', '18:00:00', 2, 2, 1, 2, 2, 14, 7),
('0-1', '2025-06-11', '20:00:00', 0, 1, 1, 3, 3, 15, 3),
('3-2', '2025-06-11', '15:00:00', 3, 2, 1, 4, 4, 16, 10),
('1-1', '2025-06-12', '17:00:00', 1, 1, 1, 5, 5, 17, 1),
('2-0', '2025-06-12', '19:00:00', 2, 0, 1, 6, 6, 18, 12),
('0-0', '2025-06-13', '14:00:00', 0, 0, 1, 7, 7, 19, 5),
('1-3', '2025-06-13', '16:30:00', 1, 3, 1, 8, 8, 20, 15),
('2-1', '2025-06-14', '18:30:00', 2, 1, 1, 9, 9, 11, 8),
('0-2', '2025-06-14', '20:30:00', 0, 2, 1, 10, 10, 12, 4);

-- Rodada 13 (2025-06-15 a 2025-06-19)
INSERT INTO Partida (resultado_jogo, data, hora, gols_timeMandante, gols_timeVisitante, fk_campeonato, fk_estadio, fk_timeMandante, fk_timeVisitante, fk_arbitro)
VALUES 
('3-1', '2025-06-15', '16:00:00', 3, 1, 1, 1, 1, 14, 11),
('1-2', '2025-06-15', '18:00:00', 1, 2, 1, 2, 2, 15, 6),
('2-2', '2025-06-16', '20:00:00', 2, 2, 1, 3, 3, 16, 1),
('0-0', '2025-06-16', '15:00:00', 0, 0, 1, 4, 4, 17, 13),
('1-1', '2025-06-17', '17:00:00', 1, 1, 1, 5, 5, 18, 9),
('2-0', '2025-06-17', '19:00:00', 2, 0, 1, 6, 6, 19, 4),
('0-3', '2025-06-18', '14:00:00', 0, 3, 1, 7, 7, 20, 15),
('1-1', '2025-06-18', '16:30:00', 1, 1, 1, 8, 8, 11, 8),
('2-2', '2025-06-19', '18:30:00', 2, 2, 1, 9, 9, 12, 2),
('1-0', '2025-06-19', '20:30:00', 1, 0, 1, 10, 10, 13, 10);

-- Rodada 14 (2025-06-20 a 2025-06-24)
INSERT INTO Partida (resultado_jogo, data, hora, gols_timeMandante, gols_timeVisitante, fk_campeonato, fk_estadio, fk_timeMandante, fk_timeVisitante, fk_arbitro)
VALUES 
('0-1', '2025-06-20', '16:00:00', 0, 1, 1, 1, 1, 15, 7),
('2-2', '2025-06-20', '18:00:00', 2, 2, 1, 2, 2, 16, 12),
('1-3', '2025-06-21', '20:00:00', 1, 3, 1, 3, 3, 17, 3),
('2-0', '2025-06-21', '15:00:00', 2, 0, 1, 4, 4, 18, 15),
('1-1', '2025-06-22', '17:00:00', 1, 1, 1, 5, 5, 19, 9),
('3-2', '2025-06-22', '19:00:00', 3, 2, 1, 6, 6, 20, 2),
('0-0', '2025-06-23', '14:00:00', 0, 0, 1, 7, 7, 11, 13),
('1-2', '2025-06-23', '16:30:00', 1, 2, 1, 8, 8, 12, 6),
('2-1', '2025-06-24', '18:30:00', 2, 1, 1, 9, 9, 13, 10),
('3-3', '2025-06-24', '20:30:00', 3, 3, 1, 10, 10, 14, 8);

-- Rodada 15 (2025-06-25 a 2025-06-29)
INSERT INTO Partida (resultado_jogo, data, hora, gols_timeMandante, gols_timeVisitante, fk_campeonato, fk_estadio, fk_timeMandante, fk_timeVisitante, fk_arbitro)
VALUES 
('2-0', '2025-06-25', '16:00:00', 2, 0, 1, 1, 1, 16, 12),
('1-1', '2025-06-25', '18:00:00', 1, 1, 1, 2, 2, 17, 3),
('0-2', '2025-06-26', '20:00:00', 0, 2, 1, 3, 3, 18, 9),
('3-1', '2025-06-26', '15:00:00', 3, 1, 1, 4, 4, 19, 14),
('2-2', '2025-06-27', '17:00:00', 2, 2, 1, 5, 5, 20, 5),
('1-0', '2025-06-27', '19:00:00', 1, 0, 1, 6, 6, 11, 10),
('0-1', '2025-06-28', '14:00:00', 0, 1, 1, 7, 7, 12, 1),
('2-2', '2025-06-28', '16:30:00', 2, 2, 1, 8, 8, 13, 8),
('1-3', '2025-06-29', '18:30:00', 1, 3, 1, 9, 9, 14, 15),
('0-0', '2025-06-29', '20:30:00', 0, 0, 1, 10, 10, 15, 6);

-- Rodada 16 (2025-06-30 a 2025-07-04)
INSERT INTO Partida (resultado_jogo, data, hora, gols_timeMandante, gols_timeVisitante, fk_campeonato, fk_estadio, fk_timeMandante, fk_timeVisitante, fk_arbitro)
VALUES 
('1-1', '2025-06-30', '16:00:00', 1, 1, 1, 1, 1, 17, 10),
('2-0', '2025-06-30', '18:00:00', 2, 0, 1, 2, 2, 18, 5),
('0-2', '2025-07-01', '20:00:00', 0, 2, 1, 3, 3, 19, 13),
('3-3', '2025-07-01', '15:00:00', 3, 3, 1, 4, 4, 20, 2),
('1-0', '2025-07-02', '17:00:00', 1, 0, 1, 5, 5, 11, 8),
('2-1', '2025-07-02', '19:00:00', 2, 1, 1, 6, 6, 12, 15),
('0-0', '2025-07-03', '14:00:00', 0, 0, 1, 7, 7, 13, 4),
('1-2', '2025-07-03', '16:30:00', 1, 2, 1, 8, 8, 14, 11),
('2-2', '2025-07-04', '18:30:00', 2, 2, 1, 9, 9, 15, 7),
('3-1', '2025-07-04', '20:30:00', 3, 1, 1, 10, 10, 16, 1);

-- Rodada 17 (2025-07-05 a 2025-07-09)
INSERT INTO Partida (resultado_jogo, data, hora, gols_timeMandante, gols_timeVisitante, fk_campeonato, fk_estadio, fk_timeMandante, fk_timeVisitante, fk_arbitro)
VALUES 
('0-0', '2025-07-05', '16:00:00', 0, 0, 1, 1, 1, 18, 14),
('1-2', '2025-07-05', '18:00:00', 1, 2, 1, 2, 2, 19, 7),
('2-1', '2025-07-06', '20:00:00', 2, 1, 1, 3, 3, 20, 2),
('3-3', '2025-07-06', '15:00:00', 3, 3, 1, 4, 4, 11, 10),
('1-0', '2025-07-07', '17:00:00', 1, 0, 1, 5, 5, 12, 4),
('2-2', '2025-07-07', '19:00:00', 2, 2, 1, 6, 6, 13, 15),
('0-1', '2025-07-08', '14:00:00', 0, 1, 1, 7, 7, 14, 9),
('1-1', '2025-07-08', '16:30:00', 1, 1, 1, 8, 8, 15, 1),
('2-0', '2025-07-09', '18:30:00', 2, 0, 1, 9, 9, 16, 11),
('3-2', '2025-07-09', '20:30:00', 3, 2, 1, 10, 10, 17, 6);

-- Rodada 18 (2025-07-10 a 2025-07-14)
INSERT INTO Partida (resultado_jogo, data, hora, gols_timeMandante, gols_timeVisitante, fk_campeonato, fk_estadio, fk_timeMandante, fk_timeVisitante, fk_arbitro)
VALUES 
('1-1', '2025-07-10', '16:00:00', 1, 1, 1, 1, 1, 19, 9),
('2-2', '2025-07-10', '18:00:00', 2, 2, 1, 2, 2, 20, 1),
('0-0', '2025-07-11', '20:00:00', 0, 0, 1, 3, 3, 11, 13),
('3-1', '2025-07-11', '15:00:00', 3, 1, 1, 4, 4, 12, 6),
('1-2', '2025-07-12', '17:00:00', 1, 2, 1, 5, 5, 13, 15),
('2-0', '2025-07-12', '19:00:00', 2, 0, 1, 6, 6, 14, 4),
('0-1', '2025-07-13', '14:00:00', 0, 1, 1, 7, 7, 15, 11),
('1-1', '2025-07-13', '16:30:00', 1, 1, 1, 8, 8, 16, 7),
('2-3', '2025-07-14', '18:30:00', 2, 3, 1, 9, 9, 17, 2),
('0-0', '2025-07-14', '20:30:00', 0, 0, 1, 10, 10, 18, 10);
-- Rodada 19 (2025-07-15 a 2025-07-19)
INSERT INTO Partida (resultado_jogo, data, hora, gols_timeMandante, gols_timeVisitante, fk_campeonato, fk_estadio, fk_timeMandante, fk_timeVisitante, fk_arbitro)
VALUES 
('2-1', '2025-07-15', '16:00:00', 2, 1, 1, 1, 1, 20, 11),
('1-1', '2025-07-15', '18:00:00', 1, 1, 1, 2, 2, 11, 6),
('0-2', '2025-07-16', '20:00:00', 0, 2, 1, 3, 3, 12, 1),
('3-3', '2025-07-16', '15:00:00', 3, 3, 1, 4, 4, 13, 13),
('1-0', '2025-07-17', '17:00:00', 1, 0, 1, 5, 5, 14, 9),
('2-2', '2025-07-17', '19:00:00', 2, 2, 1, 6, 6, 15, 4),
('0-1', '2025-07-18', '14:00:00', 0, 1, 1, 7, 7, 16, 15),
('1-1', '2025-07-18', '16:30:00', 1, 1, 1, 8, 8, 17, 8),
('2-0', '2025-07-19', '18:30:00', 2, 0, 1, 9, 9, 18, 2),
('3-2', '2025-07-19', '20:30:00', 3, 2, 1, 10, 10, 19, 10);

-- Rodada 20 (2025-07-20 a 2025-07-24)
INSERT INTO Partida (resultado_jogo, data, hora, gols_timeMandante, gols_timeVisitante, fk_campeonato, fk_estadio, fk_timeMandante, fk_timeVisitante, fk_arbitro)
VALUES 
('1-1', '2025-07-20', '16:00:00', 1, 1, 1, 1, 1, 2, 7),
('2-0', '2025-07-20', '18:00:00', 2, 0, 1, 2, 3, 4, 12),
('0-2', '2025-07-21', '20:00:00', 0, 2, 1, 3, 5, 6, 3),
('3-3', '2025-07-21', '15:00:00', 3, 3, 1, 4, 7, 8, 15),
('1-0', '2025-07-22', '17:00:00', 1, 0, 1, 5, 9, 10, 9),
('2-2', '2025-07-22', '19:00:00', 2, 2, 1, 6, 11, 12, 1),
('0-1', '2025-07-23', '14:00:00', 0, 1, 1, 7, 13, 14, 11),
('1-1', '2025-07-23', '16:30:00', 1, 1, 1, 8, 15, 16, 5),
('2-0', '2025-07-24', '18:30:00', 2, 0, 1, 9, 17, 18, 14),
('3-2', '2025-07-24', '20:30:00', 3, 2, 1, 10, 19, 20, 8);

-- Rodada 21 (2025-07-25 a 2025-07-29)
INSERT INTO Partida (resultado_jogo, data, hora, gols_timeMandante, gols_timeVisitante, fk_campeonato, fk_estadio, fk_timeMandante, fk_timeVisitante, fk_arbitro)
VALUES 
('2-1', '2025-07-25', '16:00:00', 2, 1, 1, 1, 2, 3, 11),
('1-1', '2025-07-25', '18:00:00', 1, 1, 1, 2, 4, 5, 6),
('0-2', '2025-07-26', '20:00:00', 0, 2, 1, 3, 6, 7, 1),
('3-3', '2025-07-26', '15:00:00', 3, 3, 1, 4, 8, 9, 13),
('1-0', '2025-07-27', '17:00:00', 1, 0, 1, 5, 10, 11, 9),
('2-2', '2025-07-27', '19:00:00', 2, 2, 1, 6, 12, 13, 4),
('0-1', '2025-07-28', '14:00:00', 0, 1, 1, 7, 14, 15, 15),
('1-1', '2025-07-28', '16:30:00', 1, 1, 1, 8, 16, 17, 8),
('2-0', '2025-07-29', '18:30:00', 2, 0, 1, 9, 18, 19, 2),
('3-2', '2025-07-29', '20:30:00', 3, 2, 1, 10, 20, 1, 10);

-- Rodada 22 (2025-07-30 a 2025-08-03)
INSERT INTO Partida (resultado_jogo, data, hora, gols_timeMandante, gols_timeVisitante, fk_campeonato, fk_estadio, fk_timeMandante, fk_timeVisitante, fk_arbitro)
VALUES 
('1-1', '2025-07-30', '16:00:00', 1, 1, 1, 1, 3, 1, 14),
('2-0', '2025-07-30', '18:00:00', 2, 0, 1, 2, 5, 2, 8),
('0-2', '2025-07-31', '20:00:00', 0, 2, 1, 3, 7, 4, 3),
('3-3', '2025-07-31', '15:00:00', 3, 3, 1, 4, 9, 6, 11),
('1-0', '2025-08-01', '17:00:00', 1, 0, 1, 5, 11, 8, 5),
('2-2', '2025-08-01', '19:00:00', 2, 2, 1, 6, 13, 10, 1),
('0-1', '2025-08-02', '14:00:00', 0, 1, 1, 7, 15, 12, 15),
('1-1', '2025-08-02', '16:30:00', 1, 1, 1, 8, 17, 14, 9),
('2-0', '2025-08-03', '18:30:00', 2, 0, 1, 9, 19, 16, 2),
('3-2', '2025-08-03', '20:30:00', 3, 2, 1, 10, 20, 18, 10);

-- Rodada 23 (2025-08-04 a 2025-08-08)
INSERT INTO Partida (resultado_jogo, data, hora, gols_timeMandante, gols_timeVisitante, fk_campeonato, fk_estadio, fk_timeMandante, fk_timeVisitante, fk_arbitro)
VALUES 
('2-1', '2025-08-04', '16:00:00', 2, 1, 1, 1, 4, 2, 6),
('1-1', '2025-08-04', '18:00:00', 1, 1, 1, 2, 6, 3, 11),
('0-2', '2025-08-05', '20:00:00', 0, 2, 1, 3, 8, 5, 1),
('3-3', '2025-08-05', '15:00:00', 3, 3, 1, 4, 10, 7, 13),
('1-0', '2025-08-06', '17:00:00', 1, 0, 1, 5, 12, 9, 9),
('2-2', '2025-08-06', '19:00:00', 2, 2, 1, 6, 14, 11, 4),
('0-1', '2025-08-07', '14:00:00', 0, 1, 1, 7, 16, 13, 15),
('1-1', '2025-08-07', '16:30:00', 1, 1, 1, 8, 18, 15, 8),
('2-0', '2025-08-08', '18:30:00', 2, 0, 1, 9, 20, 17, 2),
('3-2', '2025-08-08', '20:30:00', 3, 2, 1, 10, 1, 19, 10);

-- Rodada 24 (2025-08-09 a 2025-08-13)
INSERT INTO Partida (resultado_jogo, data, hora, gols_timeMandante, gols_timeVisitante, fk_campeonato, fk_estadio, fk_timeMandante, fk_timeVisitante, fk_arbitro)
VALUES 
('1-1', '2025-08-09', '16:00:00', 1, 1, 1, 1, 5, 1, 1),
('2-0', '2025-08-09', '18:00:00', 2, 0, 1, 2, 7, 2, 8),
('0-2', '2025-08-10', '20:00:00', 0, 2, 1, 3, 9, 3, 14),
('3-3', '2025-08-10', '15:00:00', 3, 3, 1, 4, 11, 4, 3),
('1-0', '2025-08-11', '17:00:00', 1, 0, 1, 5, 13, 6, 10),
('2-2', '2025-08-11', '19:00:00', 2, 2, 1, 6, 15, 8, 6),
('0-1', '2025-08-12', '14:00:00', 0, 1, 1, 7, 17, 10, 15),
('1-1', '2025-08-12', '16:30:00', 1, 1, 1, 8, 19, 12, 4),
('2-0', '2025-08-13', '18:30:00', 2, 0, 1, 9, 20, 14, 13),
('3-2', '2025-08-13', '20:30:00', 3, 2, 1, 10, 18, 16, 9);

-- Rodada 25 (2025-08-14 a 2025-08-18)
INSERT INTO Partida (resultado_jogo, data, hora, gols_timeMandante, gols_timeVisitante, fk_campeonato, fk_estadio, fk_timeMandante, fk_timeVisitante, fk_arbitro)
VALUES 
('2-1', '2025-08-14', '16:00:00', 2, 1, 1, 1, 6, 1, 10),
('1-1', '2025-08-14', '18:00:00', 1, 1, 1, 2, 8, 2, 5),
('0-2', '2025-08-15', '20:00:00', 0, 2, 1, 3, 10, 3, 12),
('3-3', '2025-08-15', '15:00:00', 3, 3, 1, 4, 12, 4, 1),
('1-0', '2025-08-16', '17:00:00', 1, 0, 1, 5, 14, 5, 8),
('2-2', '2025-08-16', '19:00:00', 2, 2, 1, 6, 16, 7, 3),
('0-1', '2025-08-17', '14:00:00', 0, 1, 1, 7, 18, 9, 15),
('1-1', '2025-08-17', '16:30:00', 1, 1, 1, 8, 20, 11, 6),
('2-0', '2025-08-18', '18:30:00', 2, 0, 1, 9, 19, 13, 14),
('3-2', '2025-08-18', '20:30:00', 3, 2, 1, 10, 17, 15, 9);

-- Rodada 26 (2025-08-19 a 2025-08-23)
INSERT INTO Partida (resultado_jogo, data, hora, gols_timeMandante, gols_timeVisitante, fk_campeonato, fk_estadio, fk_timeMandante, fk_timeVisitante, fk_arbitro)
VALUES 
('1-1', '2025-08-19', '16:00:00', 1, 1, 1, 1, 7, 1, 13),
('2-0', '2025-08-19', '18:00:00', 2, 0, 1, 2, 9, 2, 2),
('0-2', '2025-08-20', '20:00:00', 0, 2, 1, 3, 11, 3, 7),
('3-3', '2025-08-20', '15:00:00', 3, 3, 1, 4, 13, 4, 10),
('1-0', '2025-08-21', '17:00:00', 1, 0, 1, 5, 15, 5, 4),
('2-2', '2025-08-21', '19:00:00', 2, 2, 1, 6, 17, 6, 15),
('0-1', '2025-08-22', '14:00:00', 0, 1, 1, 7, 19, 8, 9),
('1-1', '2025-08-22', '16:30:00', 1, 1, 1, 8, 20, 10, 1),
('2-0', '2025-08-23', '18:30:00', 2, 0, 1, 9, 18, 12, 11),
('3-2', '2025-08-23', '20:30:00', 3, 2, 1, 10, 16, 14, 6);

-- Rodada 27 (2025-08-24 a 2025-08-28)
INSERT INTO Partida (resultado_jogo, data, hora, gols_timeMandante, gols_timeVisitante, fk_campeonato, fk_estadio, fk_timeMandante, fk_timeVisitante, fk_arbitro)
VALUES 
('2-1', '2025-08-24', '16:00:00', 2, 1, 1, 1, 8, 1),
('1-1', '2025-08-24', '18:00:00', 1, 1, 1, 2, 10, 2),
('0-2', '2025-08-25', '20:00:00', 0, 2, 1, 3, 12, 3),
('3-3', '2025-08-25', '15:00:00', 3, 3, 1, 4, 14, 4),
('1-0', '2025-08-26', '17:00:00', 1, 0, 1, 5, 16, 5),
('2-2', '2025-08-26', '19:00:00', 2, 2, 1, 6, 18, 6),
('0-1', '2025-08-27', '14:00:00', 0, 1, 1, 7, 20, 7),
('1-1', '2025-08-27', '16:30:00', 1, 1, 1, 8, 19, 9),
('2-0', '2025-08-28', '18:30:00', 2, 0, 1, 9, 17, 11),
('3-2', '2025-08-28', '20:30:00', 3, 2, 1, 10, 15, 13);

-- Rodada 28 (2025-08-29 a 2025-09-02)
INSERT INTO Partida (resultado_jogo, data, hora, gols_timeMandante, gols_timeVisitante, fk_campeonato, fk_estadio, fk_timeMandante, fk_timeVisitante, fk_arbitro)
VALUES 
('1-1', '2025-08-29', '16:00:00', 1, 1, 1, 1, 9, 1, 4),
('2-0', '2025-08-29', '18:00:00', 2, 0, 1, 2, 11, 2, 11),
('0-2', '2025-08-30', '20:00:00', 0, 2, 1, 3, 13, 3, 1),
('3-3', '2025-08-30', '15:00:00', 3, 3, 1, 4, 15, 4, 15),
('1-0', '2025-08-31', '17:00:00', 1, 0, 1, 5, 17, 5, 9),
('2-2', '2025-08-31', '19:00:00', 2, 2, 1, 6, 19, 6, 2),
('0-1', '2025-09-01', '14:00:00', 0, 1, 1, 7, 20, 8, 13),
('1-1', '2025-09-01', '16:30:00', 1, 1, 1, 8, 18, 10, 6),
('2-0', '2025-09-02', '18:30:00', 2, 0, 1, 9, 16, 12, 10),
('3-2', '2025-09-02', '20:30:00', 3, 2, 1, 10, 14, 7, 8);

-- Rodada 29 (2025-09-03 a 2025-09-07)
INSERT INTO Partida (resultado_jogo, data, hora, gols_timeMandante, gols_timeVisitante, fk_campeonato, fk_estadio, fk_timeMandante, fk_timeVisitante, fk_arbitro)
VALUES 
('2-1', '2025-09-03', '16:00:00', 2, 1, 1, 1, 10, 1, 7),
('1-1', '2025-09-03', '18:00:00', 1, 1, 1, 2, 12, 2, 12),
('0-2', '2025-09-04', '20:00:00', 0, 2, 1, 3, 14, 3, 3),
('3-3', '2025-09-04', '15:00:00', 3, 3, 1, 4, 16, 4, 15),
('1-0', '2025-09-05', '17:00:00', 1, 0, 1, 5, 18, 5, 9),
('2-2', '2025-09-05', '19:00:00', 2, 2, 1, 6, 20, 6, 1),
('0-1', '2025-09-06', '14:00:00', 0, 1, 1, 7, 19, 8, 11),
('1-1', '2025-09-06', '16:30:00', 1, 1, 1, 8, 17, 10, 5),
('2-0', '2025-09-07', '18:30:00', 2, 0, 1, 9, 15, 12, 14),
('3-2', '2025-09-07', '20:30:00', 3, 2, 1, 10, 13, 11, 8);

-- Rodada 30 (2025-09-08 a 2025-09-12)
INSERT INTO Partida (resultado_jogo, data, hora, gols_timeMandante, gols_timeVisitante, fk_campeonato, fk_estadio, fk_timeMandante, fk_timeVisitante, fk_arbitro)
VALUES 
('1-1', '2025-09-08', '16:00:00', 1, 1, 1, 1, 11, 1, 3),
('2-0', '2025-09-08', '18:00:00', 2, 0, 1, 2, 13, 2, 10),
('0-2', '2025-09-09', '20:00:00', 0, 2, 1, 3, 15, 3, 6),
('3-3', '2025-09-09', '15:00:00', 3, 3, 1, 4, 17, 4, 15),
('1-0', '2025-09-10', '17:00:00', 1, 0, 1, 5, 19, 5, 4),
('2-2', '2025-09-10', '19:00:00', 2, 2, 1, 6, 20, 7, 11),
('0-1', '2025-09-11', '14:00:00', 0, 1, 1, 7, 18, 9, 7),
('1-1', '2025-09-11', '16:30:00', 1, 1, 1, 8, 16, 11, 2),
('2-0', '2025-09-12', '18:30:00', 2, 0, 1, 9, 14, 13, 14),
('3-2', '2025-09-12', '20:30:00', 3, 2, 1, 10, 12, 15, 9);

-- Rodada 31 (2025-09-13 a 2025-09-17)
INSERT INTO Partida (resultado_jogo, data, hora, gols_timeMandante, gols_timeVisitante, fk_campeonato, fk_estadio, fk_timeMandante, fk_timeVisitante, fk_arbitro)
VALUES 
('2-1', '2025-09-13', '16:00:00', 2, 1, 1, 1, 12, 1, 6),
('1-1', '2025-09-13', '18:00:00', 1, 1, 1, 2, 14, 2, 11),
('0-2', '2025-09-14', '20:00:00', 0, 2, 1, 3, 16, 3, 1),
('3-3', '2025-09-14', '15:00:00', 3, 3, 1, 4, 18, 4, 13),
('1-0', '2025-09-15', '17:00:00', 1, 0, 1, 5, 20, 5, 9),
('2-2', '2025-09-15', '19:00:00', 2, 2, 1, 6, 19, 7, 4),
('0-1', '2025-09-16', '14:00:00', 0, 1, 1, 7, 17, 9, 15),
('1-1', '2025-09-16', '16:30:00', 1, 1, 1, 8, 15, 11, 8),
('2-0', '2025-09-17', '18:30:00', 2, 0, 1, 9, 13, 8, 2),
('3-2', '2025-09-17', '20:30:00', 3, 2, 1, 10, 11, 10, 10);

-- Rodada 32 (2025-09-18 a 2025-09-22)
INSERT INTO Partida (resultado_jogo, data, hora, gols_timeMandante, gols_timeVisitante, fk_campeonato, fk_estadio, fk_timeMandante, fk_timeVisitante, fk_arbitro)
VALUES 
('1-1', '2025-09-18', '16:00:00', 1, 1, 1, 1, 13, 1, 8),
('2-0', '2025-09-18', '18:00:00', 2, 0, 1, 2, 15, 2, 1),
('0-2', '2025-09-19', '20:00:00', 0, 2, 1, 3, 17, 3, 11),
('3-3', '2025-09-19', '15:00:00', 3, 3, 1, 4, 19, 4, 6),
('1-0', '2025-09-20', '17:00:00', 1, 0, 1, 5, 20, 5, 14),
('2-2', '2025-09-20', '19:00:00', 2, 2, 1, 6, 18, 7, 3),
('0-1', '2025-09-21', '14:00:00', 0, 1, 1, 7, 16, 9, 10),
('1-1', '2025-09-21', '16:30:00', 1, 1, 1, 8, 14, 11, 5),
('2-0', '2025-09-22', '18:30:00', 2, 0, 1, 9, 12, 13, 15),
('3-2', '2025-09-22', '20:30:00', 3, 2, 1, 10, 10, 15, 9);

-- Rodada 33 (2025-09-23 a 2025-09-27)
INSERT INTO Partida (resultado_jogo, data, hora, gols_timeMandante, gols_timeVisitante, fk_campeonato, fk_estadio, fk_timeMandante, fk_timeVisitante, fk_arbitro)
VALUES 
('2-1', '2025-09-23', '16:00:00', 2, 1, 1, 1, 14, 1, 5),
('1-1', '2025-09-23', '18:00:00', 1, 1, 1, 2, 16, 2, 13),
('0-2', '2025-09-24', '20:00:00', 0, 2, 1, 3, 18, 3, 2),
('3-3', '2025-09-24', '15:00:00', 3, 3, 1, 4, 20, 4, 10),
('1-0', '2025-09-25', '17:00:00', 1, 0, 1, 5, 19, 6, 4),
('2-2', '2025-09-25', '19:00:00', 2, 2, 1, 6, 17, 8, 15),
('0-1', '2025-09-26', '14:00:00', 0, 1, 1, 7, 15, 10, 9),
('1-1', '2025-09-26', '16:30:00', 1, 1, 1, 8, 13, 12, 1),
('2-0', '2025-09-27', '18:30:00', 2, 0, 1, 9, 11, 14, 11),
('3-2', '2025-09-27', '20:30:00', 3, 2, 1, 10, 9, 16, 6);

-- Rodada 34 (2025-09-28 a 2025-10-02)
INSERT INTO Partida (resultado_jogo, data, hora, gols_timeMandante, gols_timeVisitante, fk_campeonato, fk_estadio, fk_timeMandante, fk_timeVisitante, fk_arbitro)
VALUES 
('1-1', '2025-09-28', '16:00:00', 1, 1, 1, 1, 15, 1, 14),
('2-0', '2025-09-28', '18:00:00', 2, 0, 1, 2, 17, 2, 7),
('0-2', '2025-09-29', '20:00:00', 0, 2, 1, 3, 19, 3, 2),
('3-3', '2025-09-29', '15:00:00', 3, 3, 1, 4, 20, 5, 10),
('1-0', '2025-09-30', '17:00:00', 1, 0, 1, 5, 18, 7, 4),
('2-2', '2025-09-30', '19:00:00', 2, 2, 1, 6, 16, 9, 15),
('0-1', '2025-10-01', '14:00:00', 0, 1, 1, 7, 14, 11, 9),
('1-1', '2025-10-01', '16:30:00', 1, 1, 1, 8, 12, 13, 1),
('2-0', '2025-10-02', '18:30:00', 2, 0, 1, 9, 10, 15, 11),
('3-2', '2025-10-02', '20:30:00', 3, 2, 1, 10, 8, 17, 6);

-- Rodada 35 (2025-10-03 a 2025-10-07)
INSERT INTO Partida (resultado_jogo, data, hora, gols_timeMandante, gols_timeVisitante, fk_campeonato, fk_estadio, fk_timeMandante, fk_timeVisitante, fk_arbitro)
VALUES 
('2-1', '2025-10-03', '16:00:00', 2, 1, 1, 1, 16, 1, 9),
('1-1', '2025-10-03', '18:00:00', 1, 1, 1, 2, 18, 2, 2),
('0-2', '2025-10-04', '20:00:00', 0, 2, 1, 3, 20, 3, 7),
('3-3', '2025-10-04', '15:00:00', 3, 3, 1, 4, 19, 5, 10),
('1-0', '2025-10-05', '17:00:00', 1, 0, 1, 5, 17, 7, 4),
('2-2', '2025-10-05', '19:00:00', 2, 2, 1, 6, 15, 9, 15),
('0-1', '2025-10-06', '14:00:00', 0, 1, 1, 7, 13, 11, 8),
('1-1', '2025-10-06', '16:30:00', 1, 1, 1, 8, 11, 13, 1),
('2-0', '2025-10-07', '18:30:00', 2, 0, 1, 9, 9, 15, 11),
('3-2', '2025-10-07', '20:30:00', 3, 2, 1, 10, 7, 17, 6);

-- Rodada 36 (2025-10-08 a 2025-10-12)
INSERT INTO Partida (resultado_jogo, data, hora, gols_timeMandante, gols_timeVisitante, fk_campeonato, fk_estadio, fk_timeMandante, fk_timeVisitante, fk_arbitro)
VALUES 
('1-1', '2025-10-08', '16:00:00', 1, 1, 1, 1, 17, 1, 13),
('2-0', '2025-10-08', '18:00:00', 2, 0, 1, 2, 19, 2, 2),
('0-2', '2025-10-09', '20:00:00', 0, 2, 1, 3, 20, 4, 7),
('3-3', '2025-10-09', '15:00:00', 3, 3, 1, 4, 18, 6, 10),
('1-0', '2025-10-10', '17:00:00', 1, 0, 1, 5, 16, 8, 4),
('2-2', '2025-10-10', '19:00:00', 2, 2, 1, 6, 14, 10, 15),
('0-1', '2025-10-11', '14:00:00', 0, 1, 1, 7, 12, 12, 9),
('1-1', '2025-10-11', '16:30:00', 1, 1, 1, 8, 10, 14, 1),
('2-0', '2025-10-12', '18:30:00', 2, 0, 1, 9, 8, 16, 11),
('3-2', '2025-10-12', '20:30:00', 3, 2, 1, 10, 6, 18, 6);

-- Rodada 37 (2025-10-13 a 2025-10-17)
INSERT INTO Partida (resultado_jogo, data, hora, gols_timeMandante, gols_timeVisitante, fk_campeonato, fk_estadio, fk_timeMandante, fk_timeVisitante, fk_arbitro)
VALUES 
('1-1', '2025-10-13', '16:00:00', 1, 1, 1, 1, 1, 18, 10),
('2-0', '2025-10-13', '18:00:00', 2, 0, 1, 2, 2, 19, 5),
('0-2', '2025-10-14', '20:00:00', 0, 2, 1, 3, 3, 20, 13),
('3-3', '2025-10-14', '15:00:00', 3, 3, 1, 4, 4, 11, 2),
('1-0', '2025-10-15', '17:00:00', 1, 0, 1, 5, 5, 12, 8),
('2-2', '2025-10-15', '19:00:00', 2, 2, 1, 6, 6, 13, 15),
('0-1', '2025-10-16', '14:00:00', 0, 1, 1, 7, 7, 14, 4),
('1-1', '2025-10-16', '16:30:00', 1, 1, 1, 8, 8, 15, 11),
('2-0', '2025-10-17', '18:30:00', 2, 0, 1, 9, 9, 16, 7),
('3-2', '2025-10-17', '20:30:00', 3, 2, 1, 10, 10, 17, 1);

-- Rodada 38 (2025-10-18 a 2025-10-22)
INSERT INTO Partida (resultado_jogo, data, hora, gols_timeMandante, gols_timeVisitante, fk_campeonato, fk_estadio, fk_timeMandante, fk_timeVisitante, fk_arbitro)
VALUES 
('2-1', '2025-10-18', '16:00:00', 2, 1, 1, 1, 1, 19),
('1-1', '2025-10-18', '18:00:00', 1, 1, 1, 2, 2, 20),
('0-2', '2025-10-19', '20:00:00', 0, 2, 1, 3, 3, 11),
('3-3', '2025-10-19', '15:00:00', 3, 3, 1, 4, 4, 12),
('1-0', '2025-10-20', '17:00:00', 1, 0, 1, 5, 5, 13),
('2-2', '2025-10-20', '19:00:00', 2, 2, 1, 6, 6, 14),
('0-1', '2025-10-21', '14:00:00', 0, 1, 1, 7, 7, 15),
('1-1', '2025-10-21', '16:30:00', 1, 1, 1, 8, 8, 16),
('2-0', '2025-10-22', '18:30:00', 2, 0, 1, 9, 9, 17),
('3-2', '2025-10-22', '20:30:00', 3, 2, 1, 10, 10, 18);

SELECT * FROM Partida;
CREATE Table Partida_Rodada (
    fk_partida INT NOT NULL,
    fk_rodada INT NOT NULL,
    PRIMARY KEY (fk_partida, fk_rodada),
    FOREIGN KEY (fk_partida) REFERENCES Partida(ID),
    FOREIGN KEY (fk_rodada) REFERENCES Rodada(id)
);
-- Associando partidas às rodadas (1 rodada = 10 partidas)
INSERT INTO Partida_Rodada (fk_partida, fk_rodada) VALUES
(1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),
(11,2),(12,2),(13,2),(14,2),(15,2),(16,2),(17,2),(18,2),(19,2),(20,2),
(21,3),(22,3),(23,3),(24,3),(25,3),(26,3),(27,3),(28,3),(29,3),(30,3),
(31,4),(32,4),(33,4),(34,4),(35,4),(36,4),(37,4),(38,4),(39,4),(40,4),
(41,5),(42,5),(43,5),(44,5),(45,5),(46,5),(47,5),(48,5),(49,5),(50,5),
(51,6),(52,6),(53,6),(54,6),(55,6),(56,6),(57,6),(58,6),(59,6),(60,6),
(61,7),(62,7),(63,7),(64,7),(65,7),(66,7),(67,7),(68,7),(69,7),(70,7),
(71,8),(72,8),(73,8),(74,8),(75,8),(76,8),(77,8),(78,8),(79,8),(80,8),
(81,9),(82,9),(83,9),(84,9),(85,9),(86,9),(87,9),(88,9),(89,9),(90,9),
(91,10),(92,10),(93,10),(94,10),(95,10),(96,10),(97,10),(98,10),(99,10),(100,10),
(101,11),(102,11),(103,11),(104,11),(105,11),(106,11),(107,11),(108,11),(109,11),(110,11),
(111,12),(112,12),(113,12),(114,12),(115,12),(116,12),(117,12),(118,12),(119,12),(120,12),
(121,13),(122,13),(123,13),(124,13),(125,13),(126,13),(127,13),(128,13),(129,13),(130,13),
(131,14),(132,14),(133,14),(134,14),(135,14),(136,14),(137,14),(138,14),(139,14),(140,14),
(141,15),(142,15),(143,15),(144,15),(145,15),(146,15),(147,15),(148,15),(149,15),(150,15),
(151,16),(152,16),(153,16),(154,16),(155,16),(156,16),(157,16),(158,16),(159,16),(160,16),
(161,17),(162,17),(163,17),(164,17),(165,17),(166,17),(167,17),(168,17),(169,17),(170,17),
(171,18),(172,18),(173,18),(174,18),(175,18),(176,18),(177,18),(178,18),(179,18),(180,18),
(181,19),(182,19),(183,19),(184,19),(185,19),(186,19),(187,19),(188,19),(189,19),(190,19),
(191,20),(192,20),(193,20),(194,20),(195,20),(196,20),(197,20),(198,20),(199,20),(200,20),
(201,21),(202,21),(203,21),(204,21),(205,21),(206,21),(207,21),(208,21),(209,21),(210,21),
(211,22),(212,22),(213,22),(214,22),(215,22),(216,22),(217,22),(218,22),(219,22),(220,22),
(221,23),(222,23),(223,23),(224,23),(225,23),(226,23),(227,23),(228,23),(229,23),(230,23),
(231,24),(232,24),(233,24),(234,24),(235,24),(236,24),(237,24),(238,24),(239,24),(240,24),
(241,25),(242,25),(243,25),(244,25),(245,25),(246,25),(247,25),(248,25),(249,25),(250,25),
(251,26),(252,26),(253,26),(254,26),(255,26),(256,26),(257,26),(258,26),(259,26),(260,26),
(261,27),(262,27),(263,27),(264,27),(265,27),(266,27),(267,27),(268,27),(269,27),(270,27),
(271,28),(272,28),(273,28),(274,28),(275,28),(276,28),(277,28),(278,28),(279,28),(280,28),
(281,29),(282,29),(283,29),(284,29),(285,29),(286,29),(287,29),(288,29),(289,29),(290,29),
(291,30),(292,30),(293,30),(294,30),(295,30),(296,30),(297,30),(298,30),(299,30),(300,30),
(301,31),(302,31),(303,31),(304,31),(305,31),(306,31),(307,31),(308,31),(309,31),(310,31),
(311,32),(312,32),(313,32),(314,32),(315,32),(316,32),(317,32),(318,32),(319,32),(320,32),
(321,33),(322,33),(323,33),(324,33),(325,33),(326,33),(327,33),(328,33),(329,33),(330,33),
(331,34),(332,34),(333,34),(334,34),(335,34),(336,34),(337,34),(338,34),(339,34),(340,34),
(341,35),(342,35),(343,35),(344,35),(345,35),(346,35),(347,35),(348,35),(349,35),(350,35),
(351,36),(352,36),(353,36),(354,36),(355,36),(356,36),(357,36),(358,36),(359,36),(360,36),
(361,37),(362,37),(363,37),(364,37),(365,37),(366,37),(367,37),(368,37),(369,37),(370,37),
(371,38),(372,38),(373,38),(374,38),(375,38),(376,38),(377,38),(378,38),(379,38),(380,38);

SELECT * from partida_rodada;

SELECT COUNT(*) FROM Partida;

SELECT COUNT(*) FROM Rodada;