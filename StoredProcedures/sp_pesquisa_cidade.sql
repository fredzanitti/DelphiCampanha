DROP PROCEDURE IF EXISTS sp_pesquisa_cidade;
DELIMITER |

CREATE PROCEDURE sp_pesquisa_cidade (
	IN pParteNome VARCHAR(50)
)
BEGIN
	IF pParteNome = 'TODOS'
    THEN
		SELECT c.codcidade AS CodCidade,
			   c.nome AS Cidade,
               p.nome AS Pais, 
               u.sigla AS UF
		FROM CA_CIDAD c, CA_PAIS p, CA_UF u
        WHERE c.codpais = p.codpais
        AND c.coduf = u.coduf
        ORDER BY p.nome, u.sigla, c.nome;   
	ELSE
		SELECT c.codcidade AS CodCidade,
			   c.nome AS Cidade,
               p.nome AS Pais, 
               u.sigla AS UF
		FROM CA_CIDAD c, CA_PAIS p, CA_UF u               
        WHERE c.codpais = p.codpais
        AND c.coduf = u.coduf
        AND c.nome LIKE CONCAT('%',pParteNome,'%')
        ORDER BY p.nome, u.sigla, c.nome;   
    END IF;

END
| DELIMITER ;