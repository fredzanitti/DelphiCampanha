DROP PROCEDURE IF EXISTS sp_gols_por_periodo;
DELIMITER |

CREATE PROCEDURE sp_gols_por_periodo ( 
	pTemporada INT
)
BEGIN 
	DROP TABLE IF EXISTS GolsPorMinutos;
    
    CREATE TEMPORARY TABLE GolsPorMinutos (
		Item INT,
        Gols INT,
        Intervalo VARCHAR(10)
    ) ENGINE=MEMORY;
    
    SET @gols = 0;
    
    IF (pTemporada > 0)
    THEN
		-- PRIMEIRO TEMPO
		-- gols no período entre 1 e 15 minutos do primeiro tempo
		SELECT COUNT(*) INTO @gols
		FROM es_gols
		INNER JOIN ca_jogos ON ca_jogos.codjogo = es_gols.codjogo
		WHERE ca_jogos.temporada = pTemporada
		AND es_gols.tempo >= 0 AND es_gols.tempo <= 15
		AND es_gols.periodo = '1T';
		INSERT INTO GolsPorMinutos VALUES (1, @gols, '0-15/1ºT');
		
		-- gols no período entre 16 e 30 minutos do primeiro tempo
		SELECT COUNT(*) INTO @gols
		FROM es_gols
		INNER JOIN ca_jogos ON ca_jogos.codjogo = es_gols.codjogo
		WHERE ca_jogos.temporada = pTemporada    
		AND tempo > 15 AND tempo <= 30
		AND periodo = '1T';
		INSERT INTO GolsPorMinutos VALUES (2, @gols, '16-30/1ºT');    
		
		-- gols no período entre 31 e 45 minutos do primeiro tempo
		SELECT COUNT(*) INTO @gols
		FROM es_gols
		INNER JOIN ca_jogos ON ca_jogos.codjogo = es_gols.codjogo
		WHERE ca_jogos.temporada = pTemporada    
		AND tempo > 30 AND tempo <= 45
		AND periodo = '1T';
		INSERT INTO GolsPorMinutos VALUES (3, @gols, '31-45/1ºT');   
		
		-- gols nos acréscimos do primeiro tempo
		SELECT COUNT(*) INTO @gols
		FROM es_gols
		INNER JOIN ca_jogos ON ca_jogos.codjogo = es_gols.codjogo
		WHERE ca_jogos.temporada = pTemporada    
		AND tempo > 45
		AND periodo = '1T';
		INSERT INTO GolsPorMinutos VALUES (4, @gols, 'Acres./1ºT');     
		
		-- SEGUNDO TEMPO
		-- gols no período entre 1 e 15 minutos do segundo tempo
		SELECT COUNT(*) INTO @gols
		FROM es_gols
		INNER JOIN ca_jogos ON ca_jogos.codjogo = es_gols.codjogo
		WHERE ca_jogos.temporada = pTemporada    
		AND  tempo >= 0 AND tempo <= 15
		AND periodo = '2T';
		INSERT INTO GolsPorMinutos VALUES (5, @gols, '0-15/2ºT');
		
		-- gols no período entre 16 e 30 minutos do segundo tempo
		SELECT COUNT(*) INTO @gols
		FROM es_gols
		INNER JOIN ca_jogos ON ca_jogos.codjogo = es_gols.codjogo
		WHERE ca_jogos.temporada = pTemporada    
		AND tempo > 15 AND tempo <= 30
		AND periodo = '2T';
		INSERT INTO GolsPorMinutos VALUES (6, @gols, '16-30/2ºT');    
		
		-- gols no período entre 31 e 45 minutos do segundo tempo
		SELECT COUNT(*) INTO @gols
		FROM es_gols
		INNER JOIN ca_jogos ON ca_jogos.codjogo = es_gols.codjogo
		WHERE ca_jogos.temporada = pTemporada    
		AND tempo > 30 AND tempo <= 45
		AND periodo = '2T';
		INSERT INTO GolsPorMinutos VALUES (7, @gols, '31-45/2ºT'); 
		
		-- gols nos acréscimos do segundo tempo
		SELECT COUNT(*) INTO @gols
		FROM es_gols
		INNER JOIN ca_jogos ON ca_jogos.codjogo = es_gols.codjogo
		WHERE ca_jogos.temporada = pTemporada    
		AND tempo > 45
		AND periodo = '2T';
		INSERT INTO GolsPorMinutos VALUES (8, @gols, 'Acres./2ºT');     
		
		-- PRIMEIRO TEMPO DA PRORROGAÇÃO
		-- gols no primeiro tempo da prorrogação
		SELECT COUNT(*) INTO @gols
		FROM es_gols
		INNER JOIN ca_jogos ON ca_jogos.codjogo = es_gols.codjogo
		WHERE ca_jogos.temporada = pTemporada    
		AND periodo = '1TP';
		INSERT INTO GolsPorMinutos VALUES (9, @gols, 'ET/1ºT');
		
		-- SEGUNDO TEMPO DA PRORROGAÇÃO
		-- gols no segundo tempo da prorrogação
		SELECT COUNT(*) INTO @gols
		FROM es_gols
		INNER JOIN ca_jogos ON ca_jogos.codjogo = es_gols.codjogo
		WHERE ca_jogos.temporada = pTemporada    
		AND periodo = '2TP';
		INSERT INTO GolsPorMinutos VALUES (10, @gols, 'ET/2ºT');    
    ELSE
		-- PRIMEIRO TEMPO
		-- gols no período entre 1 e 15 minutos do primeiro tempo
		SELECT COUNT(*) INTO @gols
		FROM es_gols
		WHERE es_gols.tempo >= 0 AND es_gols.tempo <= 15
		AND es_gols.periodo = '1T';
		INSERT INTO GolsPorMinutos VALUES (1, @gols, '0-15/1ºT');
		
		-- gols no período entre 16 e 30 minutos do primeiro tempo
		SELECT COUNT(*) INTO @gols
		FROM es_gols  
		WHERE tempo > 15 AND tempo <= 30
		AND periodo = '1T';
		INSERT INTO GolsPorMinutos VALUES (2, @gols, '16-30/1ºT');    
		
		-- gols no período entre 31 e 45 minutos do primeiro tempo
		SELECT COUNT(*) INTO @gols
		FROM es_gols
		WHERE tempo > 30 AND tempo <= 45
		AND periodo = '1T';
		INSERT INTO GolsPorMinutos VALUES (3, @gols, '31-45/1ºT');   
		
		-- gols nos acréscimos do primeiro tempo
		SELECT COUNT(*) INTO @gols
		FROM es_gols
		WHERE tempo > 45
		AND periodo = '1T';
		INSERT INTO GolsPorMinutos VALUES (4, @gols, 'Acres./1ºT');     
		
		-- SEGUNDO TEMPO
		-- gols no período entre 1 e 15 minutos do segundo tempo
		SELECT COUNT(*) INTO @gols
		FROM es_gols
		WHERE tempo >= 0 AND tempo <= 15
		AND periodo = '2T';
		INSERT INTO GolsPorMinutos VALUES (5, @gols, '0-15/2ºT');
		
		-- gols no período entre 16 e 30 minutos do segundo tempo
		SELECT COUNT(*) INTO @gols
		FROM es_gols
		WHERE tempo > 15 AND tempo <= 30
		AND periodo = '2T';
		INSERT INTO GolsPorMinutos VALUES (6, @gols, '16-30/2ºT');    
		
		-- gols no período entre 31 e 45 minutos do segundo tempo
		SELECT COUNT(*) INTO @gols
		FROM es_gols
		WHERE tempo > 30 AND tempo <= 45
		AND periodo = '2T';
		INSERT INTO GolsPorMinutos VALUES (7, @gols, '31-45/2ºT'); 
		
		-- gols nos acréscimos do segundo tempo
		SELECT COUNT(*) INTO @gols
		FROM es_gols
		WHERE tempo > 45
		AND periodo = '2T';
		INSERT INTO GolsPorMinutos VALUES (8, @gols, 'Acres./2ºT');     
		
		-- PRIMEIRO TEMPO DA PRORROGAÇÃO
		-- gols no primeiro tempo da prorrogação
		SELECT COUNT(*) INTO @gols
		FROM es_gols
		WHERE periodo = '1TP';
		INSERT INTO GolsPorMinutos VALUES (9, @gols, 'ET/1ºT');
		
		-- SEGUNDO TEMPO DA PRORROGAÇÃO
		-- gols no segundo tempo da prorrogação
		SELECT COUNT(*) INTO @gols
		FROM es_gols
		WHERE periodo = '2TP';
		INSERT INTO GolsPorMinutos VALUES (10, @gols, 'ET/2ºT');      
    END IF;
         
    
    SELECT * FROM GolsPorMinutos
    ORDER BY Item DESC;

END
| DELIMITER ;