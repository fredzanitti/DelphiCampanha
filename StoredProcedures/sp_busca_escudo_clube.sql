DROP PROCEDURE IF EXISTS sp_busca_escudo_clube;
DELIMITER |

CREATE PROCEDURE sp_busca_escudo_clube (
	IN pCodigoClube INT
)
BEGIN

	SELECT ca_adver.escudo
    FROM ca_adver
    WHERE ca_adver.codadver = pCodigoClube;

END
| DELIMITER ;