DROP PROCEDURE IF EXISTS sp_pesquisa_jogadores;
DELIMITER |

CREATE PROCEDURE sp_pesquisa_jogadores (
	IN pParteNome VARCHAR(50),
       pTecnico VARCHAR(50),
       pCodigoJogo INT
)
BEGIN
	IF pCodigoJogo > 0
    THEN
		IF pParteNome = 'TODOS'
		THEN 		
			SELECT a.codjogador, a.nome, a.nomecompleto, a.descricao, a.dtnasc, a.foto
			FROM (
				SELECT DISTINCT c.codjogador, c.nome, c.nomecompleto, p.descricao, c.dtnasc, c.foto
				FROM ca_jogad c
				INNER JOIN ca_posic p ON p.codposicao = c.codposicao
				INNER JOIN es_titul t ON t.codjogador = c.codjogador
				WHERE p.codposicao NOT IN (6, 9) 
				AND t.codjogo = pCodigoJogo
				UNION 
				SELECT DISTINCT c.codjogador, c.nome, c.nomecompleto, p.descricao, c.dtnasc, c.foto
				FROM ca_jogad c
				INNER JOIN ca_posic p ON p.codposicao = c.codposicao
				INNER JOIN es_reser r ON r.codjogador = c.codjogador
				WHERE p.codposicao NOT IN (6, 9) 
				AND r.codjogo = pCodigoJogo          
			) AS a
			ORDER BY a.nome, a.descricao;     
		ELSE
			SELECT a.codjogador, a.nome, a.nomecompleto, a.descricao, a.dtnasc, a.foto
			FROM (
				SELECT DISTINCT c.codjogador, c.nome, c.nomecompleto, p.descricao, c.dtnasc, c.foto
				FROM ca_jogad c
				INNER JOIN ca_posic p ON p.codposicao = c.codposicao
				INNER JOIN es_titul t ON t.codjogador = c.codjogador
				WHERE p.codposicao NOT IN (6, 9) 
				AND t.codjogo = pCodigoJogo
                AND (c.nome LIKE CONCAT('%',pParteNome,'%') OR c.nomecompleto LIKE CONCAT('%',pParteNome,'%'))
				UNION 
				SELECT DISTINCT c.codjogador, c.nome, c.nomecompleto, p.descricao, c.dtnasc, c.foto
				FROM ca_jogad c
				INNER JOIN ca_posic p ON p.codposicao = c.codposicao
				INNER JOIN es_reser r ON r.codjogador = c.codjogador
				WHERE p.codposicao NOT IN (6, 9) 
				AND r.codjogo = pCodigoJogo   
                AND (c.nome LIKE CONCAT('%',pParteNome,'%') OR c.nomecompleto LIKE CONCAT('%',pParteNome,'%'))
			) AS a
			ORDER BY a.nome, a.descricao;           
        END IF;
    ELSE
		IF pTecnico = 'TECNICO'
		THEN
			IF pParteNome = 'TODOS'
			THEN 
				SELECT c.codjogador, c.nome, c.nomecompleto, p.descricao, c.dtnasc, c.foto
				FROM ca_jogad c
				INNER JOIN ca_posic p ON p.codposicao = c.codposicao
				WHERE p.codposicao in (6, 9) 
				ORDER BY c.nome, p.descricao;  
			ELSE
				SELECT c.codjogador, c.nome, c.nomecompleto, p.descricao, c.dtnasc, c.foto
				FROM ca_jogad c
				INNER JOIN ca_posic p ON p.codposicao = c.codposicao
				WHERE p.codposicao in (6, 9)
				AND (c.nome LIKE CONCAT('%',pParteNome,'%') OR c.nomecompleto LIKE CONCAT('%',pParteNome,'%'))
				ORDER BY c.nome, p.descricao;             
			END IF;
		ELSE
			IF pParteNome = 'TODOS'
			THEN 
				SELECT c.codjogador, c.nome, c.nomecompleto, p.descricao, c.dtnasc, c.foto 
				FROM ca_jogad c
				INNER JOIN ca_posic p ON p.codposicao = c.codposicao
				ORDER BY c.nome, p.descricao;  
			ELSE
				SELECT c.codjogador, c.nome, c.nomecompleto, p.descricao, c.dtnasc, c.foto 
				FROM ca_jogad c
				INNER JOIN ca_posic p ON p.codposicao = c.codposicao
				AND (c.nome LIKE CONCAT('%',pParteNome,'%') OR c.nomecompleto LIKE CONCAT('%',pParteNome,'%'))
				ORDER BY c.nome, p.descricao;  
			END IF;  
		END IF;
    END IF;

END
| DELIMITER ;