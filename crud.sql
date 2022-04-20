-- Aqui você deve colocar os códigos SQL referentes às
-- Simulações de um CRUD

-- Criação

-- 1)
INSERT INTO
  clientes (nome, lealdade)
VALUES
	('Georgia', 0);

-- 2)
INSERT INTO
	pedidos (status, cliente_id)
VALUES
	('Recebido', 6);


-- 3)
INSERT INTO
	produtos_pedidos (pedido_id, produto_id)
VALUES
	(6, 1),
    (6, 2),
    (6, 6),
    (6, 8),
    (6, 8);



-- Leitura

-- 1)
SELECT
	clientes.id,
	clientes.nome,
    clientes.lealdade,
    pedidos.id,
    pedidos.status,
    pedidos.cliente_id,
    produtos.id,
    produtos.nome,
    produtos.tipo,
    produtos."preço",
    produtos.pts_de_lealdade
    FROM produtos_pedidos pp
    JOIN produtos ON pp.produto_id = produtos.id
    JOIN pedidos ON pedidos.id = pp.pedido_id
    JOIN clientes ON clientes.id = pedidos.cliente_id
    WHERE clientes.id = 6
;


-- Atualização

-- 1)
SELECT
	clientes.nome,
	SUM(pts_de_lealdade)
	FROM produtos
    JOIN produtos_pedidos pp ON pp.produto_id = produtos.id
    JOIN pedidos ON pedidos.id = pp.pedido_id
    JOIN clientes ON clientes.id = pedidos.cliente_id
    WHERE clientes.nome = 'Georgia'
    GROUP BY clientes.nome
;

UPDATE clientes
	SET lealdade = 48
    WHERE nome = 'Georgia'
;


-- Deleção

-- 1)
DELETE FROM clientes
	WHERE nome = 'Marcelo'
;

