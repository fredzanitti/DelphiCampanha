DROP PROCEDURE IF EXISTS sp_busca_bandeira_pais;
DELIMITER |

CREATE PROCEDURE sp_busca_bandeira_pais (
	IN pCodigoCidade INT
)
BEGIN

	SELECT ca_pais.bandeira, ca_uf.bandeira, ca_cidad.nome, ca_pais.nome, ca_uf.nome, ca_uf.sigla
    FROM ca_cidad, ca_pais, ca_uf
    WHERE ca_cidad.codpais = ca_pais.codpais
    AND ca_cidad.coduf = ca_uf.coduf
    AND ca_cidad.codcidade = pCodigoCidade;

END
| DELIMITER ;