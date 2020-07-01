DROP PROCEDURE IF EXISTS sp_busca_escudo_clube;
DELIMITER |

CREATE PROCEDURE sp_busca_escudo_clube (
	IN pCodigoClube INT,
       pAnoJogo INT       
)
BEGIN

	SELECT 
		CASE 
			WHEN pAnoJogo = 0 THEN (SELECT ca_adver.escudo FROM ca_adver WHERE ca_adver.codadver = pCodigoClube)
            WHEN COUNT(*) = 0 THEN (SELECT ca_adver.escudo FROM ca_adver WHERE ca_adver.codadver = pCodigoClube)
            WHEN (SELECT COUNT(*) FROM ca_escudos
				  WHERE pAnoJogo BETWEEN ca_escudos.ano_inicio AND ca_escudos.ano_fim
				  AND ca_escudos.codadver = pCodigoClube) = 0 THEN (SELECT ca_adver.escudo FROM ca_adver WHERE ca_adver.codadver = pCodigoClube)
		ELSE 
			(SELECT ca_escudos.escudo FROM ca_escudos
			 WHERE pAnoJogo BETWEEN ca_escudos.ano_inicio AND ca_escudos.ano_fim
			 AND ca_escudos.codadver = pCodigoClube)    
		
		END AS Escudo
	FROM ca_escudos
	WHERE ca_escudos.codadver = pCodigoClube;

END
| DELIMITER ;


