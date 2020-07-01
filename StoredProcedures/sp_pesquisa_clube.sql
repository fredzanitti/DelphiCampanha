DROP PROCEDURE IF EXISTS sp_pesquisa_clube;
DELIMITER |

CREATE PROCEDURE sp_pesquisa_clube (
	IN pParteNome VARCHAR(50)
)
BEGIN
	IF pParteNome = 'TODOS'
    THEN
		SELECT a.codadver AS Codigo, 
			   a.nome AS Time, 
               c.nome AS Cidade, 
               p.nome AS Pais, 
               u.sigla AS UF
		FROM CA_CIDAD c, CA_PAIS p, CA_UF u, CA_ADVER a
        WHERE c.codpais = p.codpais
        AND c.coduf = u.coduf
        AND c.codcidade = a.codcidade
        ORDER BY a.nome, p.nome, u.sigla, c.nome;   
	ELSE
		SELECT a.codadver AS Codigo, 
			   a.nome AS Time, 
               c.nome AS Cidade, 
               p.nome AS Pais, 
               u.sigla AS UF
		FROM CA_CIDAD c, CA_PAIS p, CA_UF u, CA_ADVER a
        WHERE c.codpais = p.codpais
        AND c.coduf = u.coduf
        AND c.codcidade = a.codcidade
        AND a.nome LIKE CONCAT('%',pParteNome,'%')
        ORDER BY a.nome, p.nome, u.sigla, c.nome;    
    END IF;

END
| DELIMITER ;
