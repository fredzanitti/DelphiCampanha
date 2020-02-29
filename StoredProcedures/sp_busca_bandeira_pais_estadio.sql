DROP PROCEDURE IF EXISTS sp_busca_bandeira_pais_estadio;
DELIMITER |

CREATE PROCEDURE sp_busca_bandeira_pais_estadio (
	IN pCodigoEstadio INT
)
BEGIN

	SELECT ca_pais.bandeira AS BandeiraPais,
		   ca_uf.bandeira AS BandeiraUF,
           ca_cidad.nome AS Cidade,
           ca_pais.nome AS Pais,
           ca_uf.nome AS Estado,
           ca_uf.sigla AS UF, 
           ca_estad.nome AS Estadio
	FROM ca_cidad, ca_pais, ca_uf, ca_estad
    WHERE ca_cidad.codpais = ca_pais.codpais
    AND ca_cidad.coduf = ca_uf.coduf
    AND ca_cidad.codcidade = ca_estad.codcidade
    AND ca_estad.codestadio = pCodigoEstadio;

END
| DELIMITER ;