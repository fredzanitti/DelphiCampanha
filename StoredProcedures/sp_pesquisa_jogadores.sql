DROP PROCEDURE IF EXISTS sp_pesquisa_jogadores;
DELIMITER |

CREATE PROCEDURE sp_pesquisa_jogadores (
	IN pParteNome VARCHAR(50),
       pTecnico VARCHAR(50)
)
BEGIN
	IF pTecnico = 'TECNICO'
    THEN
		IF pParteNome = 'TODOS'
        THEN 
			SELECT a.codjogador, a.nome, a.nomecompleto, a.descricao, a.dtnasc, a.foto
            FROM (
				SELECT c.codjogador, c.nome, c.nomecompleto, p.descricao, c.dtnasc, c.foto
                FROM CA_JOGAD c, CA_POSIC p
                WHERE c.codposicao = p.codposicao
                AND p.codposicao in (6, 9) 
                UNION
                SELECT c.codjogador, c.nome, c.nomecompleto, p.descricao, c.dtnasc, c.foto
                FROM CA_JOGAD c, CA_POSIC p
                WHERE c.codposicao = p.codposicao
                AND p.codposicao in (6, 9)
			) AS a
            ORDER BY a.nome, a.descricao;  
		ELSE
			SELECT a.codjogador, a.nome, a.nomecompleto, a.descricao, a.dtnasc, a.foto
            FROM (
				SELECT c.codjogador, c.nome, c.nomecompleto, p.descricao, c.dtnasc, c.foto
                FROM CA_JOGAD c, CA_POSIC p
                WHERE c.codposicao = p.codposicao
                AND p.codposicao in (6, 9)
                AND (c.nome LIKE CONCAT('%',pParteNome,'%') OR c.nomecompleto LIKE CONCAT('%',pParteNome,'%'))
                UNION 
                SELECT c.codjogador, c.nome, c.nomecompleto, p.descricao, c.dtnasc, c.foto
                FROM CA_JOGAD c, CA_POSIC p
                WHERE c.codposicao = p.codposicao
                AND p.codposicao in (6, 9)
                AND (c.nome LIKE CONCAT('%',pParteNome,'%') or c.nomecompleto LIKE CONCAT('%',pParteNome,'%'))
			) as a
            ORDER BY a.nome, a.descricao;
        END IF;
	ELSE
		IF pParteNome = 'TODOS'
        THEN 
			SELECT a.codjogador, a.nome, a.nomecompleto, a.descricao, a.dtnasc, a.foto
            FROM (
				SELECT c.codjogador, c.nome, c.nomecompleto, p.descricao, c.dtnasc, c.foto 
                FROM CA_JOGAD c, CA_POSIC p
                WHERE c.codposicao = p.codposicao
                UNION
                SELECT c.codjogador, c.nome, c.nomecompleto, p.descricao, c.dtnasc, c.foto 
                FROM CA_JOGAD c, CA_POSIC p
                WHERE c.codposicao = p.codposicao
			) as a
            ORDER BY a.nome, a.descricao;  
		ELSE
			SELECT a.codjogador, a.nome, a.nomecompleto, a.descricao, a.dtnasc, a.foto
            FROM (
				SELECT c.codjogador, c.nome, c.nomecompleto, p.descricao, c.dtnasc, c.foto 
                FROM CA_JOGAD c, CA_POSIC p
                WHERE c.codposicao = p.codposicao
                AND (c.nome LIKE CONCAT('%',pParteNome,'%') OR c.nomecompleto LIKE CONCAT('%',pParteNome,'%'))
                UNION
                SELECT c.codjogador, c.nome, c.nomecompleto, p.descricao, c.dtnasc, c.foto
                FROM CA_JOGAD c, CA_POSIC p
                WHERE c.codposicao = p.codposicao
                AND (c.nome LIKE CONCAT('%',pParteNome,'%') OR c.nomecompleto LIKE CONCAT('%',pParteNome,'%'))
			) as a
            ORDER BY a.nome, a.descricao;
        END IF;  
    END IF;

END
| DELIMITER ;