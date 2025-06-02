SELECT * FROM Clube;
-- Selecione todas as colunas a tabela Clube
-----
SELECT Nome, Presidente FROM Clube;
-- Selecione as colunas Nome e Presidente da tabela Clube
-----
SELECT Nome, Presidente FROM Clube WHERE Clube.Nome = "Flamengo";
-- Selecione o NOME e o PRESIDENTE do clube Flamengo
-----
SELECT Nome, Posicao, fk_clube FROM Jogador WHERE posicao = 'Atacante' AND fk_clube = 1;
-- Selecione o NOME, POSICAO e fk_clube dos jogadores que sejam atacantes e do clube com id 1
-----
SELECT
    Nome,
    Posicao
FROM
    Jogador
WHERE
    Jogador.Posicao = 'Atacante' OR Jogador.Posicao = 'Meia';
-- Selecione o NOME e POSICAO dos jogadores que sejam atacantes ou meias
-----
SELECT
    Nome
FROM
    clube
WHERE
    Clube.nome LIKE 'A%';
-- Selecione o NOME dos clubes que comecem com a letra A
-----
SELECT
    Nome,
    fk_clube
FROM
    jogador
WHERE fk_clube IN (1,7);
-- Selecione o NOME e fk_clube dos jogadores que sejam do clube com id 1 ou 7
-----
SELECT
    Nome,
    Posicao
FROM
    Jogador
ORDER BY Posicao ASC;
-- Selecione o NOME e POSICAO dos jogadores ordenados por POSICAO de forma ascendente
-----
SELECT
    Nome
FROM
    Clube
ORDER BY Clube.id LIMIT 5;
-- Selecione o NOME dos clubes ordenados pelo id de forma ascendente, limitando a 5 resultados  
----- INNER JOIN -----
SELECT
    jogador.Nome,
    clube.Nome
FROM
    clube
INNER JOIN
    jogador ON clube.id = jogador.fk_clube
WHERE 
    clube.nome = 'Corinthians';
-- Selecione o NOME dos jogadores e o NOME dos clubes onde o clube seja Corinthians
-----
SELECT
    P.data,
    CM.nome AS clubeMandante,
    CV.nome AS clubeVisitante,
    A.nome AS arbitro
FROM
    partida P
INNER JOIN
    clube CM ON P.fk_timeMandante = CM.id
INNER JOIN
    clube CV ON P.fk_timeVisitante = CV.id
INNER JOIN
    arbitro A ON P.fk_arbitro = A.ID_Arbitro;
-- Selecione a DATA, o NOME do clube mandante, o NOME do clube visitante e o NOME do árbitro de todas as partidas
-----
----- Funções de Agregação -----
SELECT
    COUNT(Gol.tipo)
FROM
    Gol
WHERE
    Gol.tipo = 'Penalti';
-- Selecione a quantidade de gols do tipo penalti
-----
SELECT
    SUM(gols_timeMandante) AS total_gols_mandante,
    SUM(gols_timevisitante) AS total_gols_visitante,
    data
FROM
    partida
WHERE
    Partida.data = '2025-04-19';
-- Selecione a soma dos gols do time mandante e visitante da partida que ocorreu no dia 19/04/2025
-----
SELECT
    MIN(Gol.Minuto) AS primeiro_gol,
    MAX(Gol.Minuto) AS ultimo_gol
FROM
    Gol
WHERE
    Gol.fk_partida = 11;
-- Selecione o minuto do primeiro gol e o minuto do último gol da partida com id 11
-----
SELECT
    Gol.fk_jogador,
    COUNT(Gol.tipo) AS total_gols
FROM
    Gol
GROUP BY
    fk_jogador
HAVING
    COUNT(Gol.tipo) > 1;

use campeonato_futebol;

--Clube com mais gols marcados---------------------------
SELECT 
    c.nome AS Clube,
    SUM(CASE 
            WHEN p.fk_timeMandante = c.ID THEN p.gols_timeMandante
            WHEN p.fk_timeVisitante = c.ID THEN p.gols_timeVisitante
            ELSE 0
        END) AS Total_Gols
FROM Clube c
JOIN Partida p ON c.ID = p.fk_timeMandante OR c.ID = p.fk_timeVisitante
GROUP BY c.ID
ORDER BY Total_Gols DESC
LIMIT 1;

--Gols marcados por todos os clubes (ranking completo)--------------------
SELECT 
    c.nome AS Clube,
    SUM(CASE 
            WHEN p.fk_timeMandante = c.ID THEN p.gols_timeMandante
            WHEN p.fk_timeVisitante = c.ID THEN p.gols_timeVisitante
            ELSE 0
        END) AS Total_Gols
FROM Clube c
JOIN Partida p ON c.ID = p.fk_timeMandante OR c.ID = p.fk_timeVisitante
GROUP BY c.ID
ORDER BY Total_Gols DESC;

-- Clube que mais sofreu gols--------------
SELECT 
    c.nome AS Clube,
    SUM(CASE 
            WHEN p.fk_timeMandante = c.ID THEN p.gols_timeVisitante
            WHEN p.fk_timeVisitante = c.ID THEN p.gols_timeMandante
            ELSE 0
        END) AS Gols_Sofridos
FROM Clube c
JOIN Partida p ON c.ID = p.fk_timeMandante OR c.ID = p.fk_timeVisitante
GROUP BY c.ID
ORDER BY Gols_Sofridos DESC
LIMIT 1;

--Total de jogos por clube---------------
SELECT 
    c.nome AS Clube,
    COUNT(p.ID) AS Jogos_Disputados
FROM Clube c
JOIN Partida p ON c.ID = p.fk_timeMandante OR c.ID = p.fk_timeVisitante
GROUP BY c.ID
ORDER BY Jogos_Disputados DESC;


SELECT 
    j.Nome AS Jogador,
    c.Nome AS Clube,
    COUNT(*) AS Gols_Marcados
FROM Gol g
JOIN Jogador j ON g.fk_jogador = j.ID
JOIN Clube c ON j.fk_clube = c.ID
GROUP BY j.ID
ORDER BY Gols_Marcados ASC;

SELECT 
    Posicao,
    COUNT(*) AS Quantidade
FROM Jogador
GROUP BY Posicao
ORDER BY Quantidade DESC;

SELECT 
    c.Nome AS Clube,
    COUNT(j.ID) AS Total_Jogadores
FROM Clube c
LEFT JOIN Jogador j ON j.fk_clube = c.ID
GROUP BY c.ID
ORDER BY Total_Jogadores DESC;

SELECT * FROM Jogador;