DROP FUNCTION IF EXISTS fn_verificagol;

CREATE FUNCTION fn_verificagol (jogador INT, jogo INT)
RETURNS INT
RETURN
		(	SELECT 1 AS a
			FROM es_titul
            WHERE codjogador = jogador
            AND codjogo = jogo
            AND gols > 0
            UNION
            SELECT 1 AS a
			FROM es_reser
            WHERE codjogador = jogador
            AND codjogo = jogo
            AND gols > 0
		);