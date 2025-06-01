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
----- Z -----
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
    clube CM ON P.fk_clubeMandante = CM.id
INNER JOIN
    clube CV ON P.fk_clubeVisitante = C.id
INNER JOIN
    arbitro A ON P.fk_arbitro = A.id_arbitro;