DROP PROCEDURE IF EXISTS sp_confere_gols_jogadores;
DELIMITER |

CREATE PROCEDURE sp_confere_gols_jogadores (
	IN pCodigoJogador INT
)
BEGIN 
	DROP TABLE IF EXISTS JogosComErros;
    
    CREATE TEMPORARY TABLE JogosComErros (
		CodigoJogo INT,
        GolsJogador INT
    ) ENGINE=MEMORY;
    
	SET @CodigoDoJogador = pCodigoJogador;
    
    WHILE @CodigoDoJogador <> 0 DO

		INSERT INTO JogosComErros 
		SELECT codjogo AS TitulReserva, gols AS golsReserva
		FROM(
		SELECT codjogo, sum(gols) gols FROM es_titul
		WHERE codjogador = @CodigoDoJogador
		AND gols > 0
		GROUP BY codjogo
		UNION
		SELECT codjogo, sum(gols) gols FROM es_reser
		WHERE codjogador = @CodigoDoJogador
		AND gols > 0
		GROUP BY codjogo
		) AS a
		WHERE gols <> (SELECT COUNT(*) FROM es_gols
						WHERE es_gols.codjogador = @CodigoDoJogador
						AND es_gols.codjogo = a.codjogo)            
		ORDER BY codjogo;


		INSERT INTO JogosComErros
		SELECT b.codjogo AS jogoMinuto, b.gols AS golsMinuto
		FROM(
		SELECT es_gols.codjogo, COUNT(*) gols 
		FROM es_gols
		WHERE es_gols.codjogador = @CodigoDoJogador
		GROUP BY es_gols.codjogo
		) AS b
		WHERE fn_verificagol(@CodigoDoJogador,b.codjogo) IS NULL;
        
        SET @CodigoDoJogador = @CodigoDoJogador - 1;
    
    END WHILE;
    
    SELECT * FROM JogosComErros;

END
| DELIMITER ;