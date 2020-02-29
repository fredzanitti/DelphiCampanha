DROP PROCEDURE IF EXISTS sp_busca_bandeira_jogador;
DELIMITER |

CREATE PROCEDURE sp_busca_bandeira_jogador (
	IN pCodigoJogador INT
)
BEGIN

	SELECT p.bandeira 
    FROM ca_jogad j, ca_cidad c, ca_pais p
    WHERE j.codcidade = c.codcidade
    AND c.codpais = p.codpais
    AND j.codjogador = pCodigoJogador;

END
| DELIMITER ;