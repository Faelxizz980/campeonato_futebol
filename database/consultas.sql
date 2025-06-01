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
-- Selecione o fk_jogador e a quantidade de gols do jogador, considerando apenas jogadores que tenham mais de 1 gol