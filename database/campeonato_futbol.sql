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
    fk_Campeonato INT,
     FOREIGN KEY (fk_Campeonato) REFERENCES Campeonato(ID_Campeonato)  
);

INSERT INTO Rodada (numero_rodada, data_começo, data_termino, fk_Campeonato) VALUES
(1, '2025-04-16', '2025-04-20', 1),
(2, '2025-04-24', '2025-04-28', 1),
(3, '2025-05-02', '2025-05-04', 1),
(4, '2025-05-10', '2025-05-12', 1),
(5, '2025-05-18', '2025-05-20', 1),
(6, '2025-05-26', '2025-05-28', 1),
(7, '2025-06-03', '2025-06-05', 1),
(8, '2025-06-11', '2025-06-13', 1),
(9, '2025-06-19', '2025-06-21', 1),
(10, '2025-06-27', '2025-06-29', 1),
(11, '2025-07-05', '2025-07-07', 1),
(12, '2025-07-13', '2025-07-15', 1),
(13, '2025-07-21', '2025-07-23', 1),
(14, '2025-07-29', '2025-07-31', 1),
(15, '2025-08-06', '2025-08-08', 1),
(16, '2025-08-14', '2025-08-16', 1),
(17, '2025-08-22', '2025-08-24', 1),
(18, '2025-08-30', '2025-09-01', 1),
(19, '2025-09-07', '2025-09-09', 1),
(20, '2025-09-15', '2025-09-17', 1),
(21, '2025-09-23', '2025-09-25', 1),
(22, '2025-10-01', '2025-10-03', 1),
(23, '2025-10-09', '2025-10-11', 1),
(24, '2025-10-17', '2025-10-19', 1),
(25, '2025-10-25', '2025-10-27', 1),
(26, '2025-11-02', '2025-11-04', 1),
(27, '2025-11-10', '2025-11-12', 1),
(28, '2025-11-18', '2025-11-20', 1),
(29, '2025-11-26', '2025-11-28', 1),
(30, '2025-12-04', '2025-12-06', 1),
(31, '2025-12-08', '2025-12-08', 1);
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
----Juventude-----------------------------------
INSERT INTO Jogador (Nome, Nacionalidade, Posicao, Pe_dominante, numero_camisa, fk_clube) VALUES
('Gabriel', 'Brasil', 'Goleiro', 'Direito', 1, 15),
('João Lucas', 'Brasil', 'Lateral Direito', 'Direito', 2, 15),
('Danilo Boza', 'Brasil', 'Zagueiro', 'Direito', 4, 15),
('Zé Marcos', 'Brasil', 'Zagueiro', 'Esquerdo', 12, 15),
('Alan Ruschel', 'Brasil', 'Lateral Esquerdo', 'Esquerdo', 28, 15),
('Jean Irmer', 'Brasil', 'Volante', 'Direito', 8, 15),
('Jadson', 'Brasil', 'Meia', 'Direito', 16, 15),
('Lucas Barbosa', 'Brasil', 'Meia', 'Esquerdo', 10, 15),
('Edson Carioca', 'Brasil', 'Meia', 'Direito', 11, 15),
('Erik', 'Brasil', 'Atacante', 'Direito', 7, 15),
('Gilberto', 'Brasil', 'Atacante', 'Direito', 9, 15);
----Bragantino-----------------------------------
INSERT INTO Jogador (Nome, Nacionalidade, Posicao, Pe_dominante, numero_camisa, fk_clube) VALUES
('Cleiton', 'Brasil', 'Goleiro', 'Direito', 18, 16),
('Aderlan', 'Brasil', 'Lateral Direito', 'Direito', 13, 16),
('Léo Ortiz', 'Brasil', 'Zagueiro', 'Direito', 3, 16),
('Eduardo Santos', 'Brasil', 'Zagueiro', 'Esquerdo', 14, 16),
('Juninho Capixaba', 'Brasil', 'Lateral Esquerdo', 'Esquerdo', 29, 16),
('Jadsom Silva', 'Brasil', 'Volante', 'Direito', 5, 16),
('Eric Ramires', 'Brasil', 'Meia', 'Direito', 8, 16),
('Lucas Evangelista', 'Brasil', 'Meia', 'Direito', 8, 16),
('Helinho', 'Brasil', 'Atacante', 'Esquerdo', 11, 16),
('Eduardo Sasha', 'Brasil', 'Atacante', 'Direito', 19, 16),
('Thiago Borbas', 'Uruguai', 'Atacante', 'Direito', 9, 16);
----Atlético-PR-----------------------------------
INSERT INTO Jogador (Nome, Nacionalidade, Posicao, Pe_dominante, numero_camisa, fk_clube) VALUES
('Bento', 'Brasil', 'Goleiro', 'Direito', 1, 17),
('Madson', 'Brasil', 'Lateral Direito', 'Direito', 23, 17),
('Thiago Heleno', 'Brasil', 'Zagueiro', 'Direito', 44, 17),
('Kaique Rocha', 'Brasil', 'Zagueiro', 'Esquerdo', 4, 17),
('Vinicius Kauê', 'Brasil', 'Lateral Esquerdo', 'Esquerdo', 16, 17),
('Fernandinho', 'Brasil', 'Volante', 'Direito', 5, 17),
('Erick', 'Brasil', 'Volante', 'Direito', 26, 17),
('Christian', 'Brasil', 'Meia', 'Esquerdo', 88, 17),
('Vitor Bueno', 'Brasil', 'Meia', 'Direito', 8, 17),
('Canobbio', 'Uruguai', 'Atacante', 'Direito', 9, 17),
('Pablo', 'Brasil', 'Atacante', 'Direito', 92, 17);
----Criciúma-----------------------------------
INSERT INTO Jogador (Nome, Nacionalidade, Posicao, Pe_dominante, numero_camisa, fk_clube) VALUES
('Gustavo', 'Brasil', 'Goleiro', 'Direito', 1, 18),
('Jonathan', 'Brasil', 'Lateral Direito', 'Direito', 2, 18),
('Rodrigo', 'Brasil', 'Zagueiro', 'Direito', 3, 18),
('Wilker Ángel', 'Venezuela', 'Zagueiro', 'Esquerdo', 4, 18),
('Trauco', 'Peru', 'Lateral Esquerdo', 'Esquerdo', 6, 18),
('Fellipe Mateus', 'Brasil', 'Volante', 'Direito', 8, 18),
('Newton', 'Brasil', 'Meia', 'Direito', 10, 18),
('Marlon', 'Brasil', 'Meia', 'Esquerdo', 7, 18),
('Eder', 'Brasil', 'Atacante', 'Direito', 9, 18),
('Bolívar', 'Brasil', 'Atacante', 'Esquerdo', 11, 18),
('Felipe Vizeu', 'Brasil', 'Atacante', 'Esquerdo', 99, 18);
----Atlético-GO-----------------------------------
INSERT INTO Jogador (Nome, Nacionalidade, Posicao, Pe_dominante, numero_camisa, fk_clube) VALUES
('Ronaldo', 'Brasil', 'Goleiro', 'Direito', 1, 19),
('Bruno Tubarão', 'Brasil', 'Lateral Direito', 'Direito', 2, 19),
('Alix', 'Brasil', 'Zagueiro', 'Direito', 4, 19),
('Lucas Rocha', 'Brasil', 'Zagueiro', 'Esquerdo', 3, 19),
('Guilherme Romão', 'Brasil', 'Lateral Esquerdo', 'Esquerdo', 6, 19),
('Rhaldney', 'Brasil', 'Volante', 'Direito', 5, 19),
('Baralhas', 'Brasil', 'Meia', 'Direito', 8, 19),
('Shaylon', 'Brasil', 'Meia', 'Esquerdo', 10, 19),
('Luiz Fernando', 'Brasil', 'Atacante', 'Direito', 11, 19),
('Derek', 'Brasil', 'Atacante', 'Direito', 9, 19),
('Vagner Love', 'Brasil', 'Atacante', 'Direito', 99, 19);
----Cuiabá-----------------------------------
INSERT INTO Jogador (Nome, Nacionalidade, Posicao, Pe_dominante, numero_camisa, fk_clube) VALUES
('Walter', 'Brasil', 'Goleiro', 'Direito', 1, 20),
('Matheus Alexandre', 'Brasil', 'Lateral Direito', 'Direito', 2, 20),
('Alan Empereur', 'Brasil', 'Zagueiro', 'Esquerdo', 4, 20),
('Marllon', 'Brasil', 'Zagueiro', 'Direito', 3, 20),
('Patric Calmon', 'Brasil', 'Lateral Esquerdo', 'Esquerdo', 6, 20),
('Denilson', 'Brasil', 'Volante', 'Direito', 8, 20),
('Raniele', 'Brasil', 'Volante', 'Direito', 5, 20),
('Clayson', 'Brasil', 'Meia', 'Esquerdo', 10, 20),
('Lucas Fernandes', 'Brasil', 'Meia', 'Direito', 7, 20),
('Deyverson', 'Brasil', 'Atacante', 'Esquerdo', 9, 20),
('Isidro Pitta', 'Paraguai', 'Atacante', 'Direito', 19, 20);
----Santos-----------------------------------
INSERT INTO Jogador (Nome, Nacionalidade, Posicao, Pe_dominante, numero_camisa, fk_clube) VALUES
('João Paulo', 'Brasil', 'Goleiro', 'Direito', 1, 21),
('Aderlan', 'Brasil', 'Lateral Direito', 'Direito', 2, 21),
('Gil', 'Brasil', 'Zagueiro', 'Direito', 4, 21),
('Joaquim', 'Brasil', 'Zagueiro', 'Esquerdo', 28, 21),
('Felipe Jonatan', 'Brasil', 'Lateral Esquerdo', 'Esquerdo', 3, 21),
('Tomás Rincón', 'Venezuela', 'Volante', 'Direito', 8, 21),
('Diego Pituca', 'Brasil', 'Volante', 'Esquerdo', 21, 21),
('Giuliano', 'Brasil', 'Meia', 'Direito', 10, 21),
('Neymar', 'Brasil', 'Atacante', 'Destro', 11, 21),
('Otero', 'Venezuela', 'Meia', 'Direito', 7, 21),
('Julio Furch', 'Argentina', 'Atacante', 'Direito', 9, 21);
----Coritiba-----------------------------------
INSERT INTO Jogador (Nome, Nacionalidade, Posicao, Pe_dominante, numero_camisa, fk_clube) VALUES
('Gabriel', 'Brasil', 'Goleiro', 'Direito', 1, 22),
('Natanael', 'Brasil', 'Lateral Direito', 'Direito', 2, 22),
('Henrique', 'Brasil', 'Zagueiro', 'Esquerdo', 3, 22),
('Thalisson Gabriel', 'Brasil', 'Zagueiro', 'Direito', 4, 22),
('Jamerson', 'Brasil', 'Lateral Esquerdo', 'Esquerdo', 6, 22),
('Bruno Gomes', 'Brasil', 'Volante', 'Direito', 8, 22),
('Sebastián Gómez', 'Colômbia', 'Volante', 'Direito', 5, 22),
('Robson', 'Brasil', 'Meia', 'Esquerdo', 10, 22),
('Matheus Bianqui', 'Brasil', 'Meia', 'Direito', 7, 22),
('Islam Slimani', 'Argélia', 'Atacante', 'Direito', 9, 22),
('Kaio César', 'Brasil', 'Atacante', 'Esquerdo', 11, 22);
----Sport Recife-----------------------------------
INSERT INTO Jogador (Nome, Nacionalidade, Posicao, Pe_dominante, numero_camisa, fk_clube) VALUES
('Caíque França', 'Brasil', 'Goleiro', 'Direito', 1, 23),
('Ewerthon', 'Brasil', 'Lateral Direito', 'Direito', 2, 23),
('Sabino', 'Brasil', 'Zagueiro', 'Esquerdo', 35, 23),
('Rafael Thyere', 'Brasil', 'Zagueiro', 'Direito', 15, 23),
('Felipe', 'Brasil', 'Lateral Esquerdo', 'Esquerdo', 6, 23),
('Fábio Matheus', 'Brasil', 'Volante', 'Direito', 8, 23),
('Felipe', 'Brasil', 'Volante', 'Esquerdo', 5, 23),
('Jorginho', 'Brasil', 'Meia', 'Direito', 10, 23),
('Romarinho', 'Brasil', 'Meia', 'Direito', 11, 23),
('Gustavo Coutinho', 'Brasil', 'Atacante', 'Direito', 9, 23),
('Vagner Love', 'Brasil', 'Atacante', 'Direito', 99, 23);
----Chapecoense-----------------------------------
INSERT INTO Jogador (Nome, Nacionalidade, Posicao, Pe_dominante, numero_camisa, fk_clube) VALUES
('Airton', 'Brasil', 'Goleiro', 'Direito', 1, 24),
('Cristovam', 'Brasil', 'Lateral Direito', 'Direito', 2, 24),
('Joilson', 'Brasil', 'Zagueiro', 'Direito', 3, 24),
('Victor Ramos', 'Brasil', 'Zagueiro', 'Esquerdo', 4, 24),
('Fernando', 'Brasil', 'Lateral Esquerdo', 'Esquerdo', 6, 24),
('Ralf', 'Brasil', 'Volante', 'Direito', 5, 24),
('Bruno Silva', 'Brasil', 'Volante', 'Direito', 8, 24),
('Marcinho', 'Brasil', 'Meia', 'Direito', 10, 24),
('Felipe Ferreira', 'Brasil', 'Meia', 'Esquerdo', 11, 24),
('Perotti', 'Brasil', 'Atacante', 'Direito', 9, 24),
('Maxwell', 'Brasil', 'Atacante', 'Esquerdo', 7, 24);
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
('Fábio Matias','1979-09-25','Brasileiro',15 ),
('Fernando Seabra','1977-06-19','Brasileiro',16 ),
('Odair Hellmann','1977-01-22','Brasileiro',17 ),
('Cláudio Tencati','1973-12-09','Brasileiro',18 ),
('Umberto Louzer','1980-02-24','brasileiro',19 ),
('Guto Ferreira','1965-09-07','Brasileiro',20 ),
('Cléber Xavier','1964-03-29','Brasileiro',21 ),
('mozart santos','1979-11-08','Brasileiro',22 ),
('António Oliveira','1982-10-09','Portuguesa',23 ),
('Gilmar Dal Pozzo','1969-09-01','Brasileiro',24 );

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



