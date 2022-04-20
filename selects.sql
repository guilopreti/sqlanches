-- Aqui você deve colocar os códigos SQL referentes às
-- Seleções de dados

-- 1)
SELECT
	pedidos.id pedido_id,
    pedidos.status,
    pedidos.cliente_id,
    produtos.id produto_id,
    produtos.nome,
    produtos.tipo,
    produtos."preço",
    produtos.pts_de_lealdade pontos_de_lealdade_do_produto
    FROM pedidos
    JOIN produtos_pedidos pp ON pp.pedido_id = pedidos.id
    JOIN produtos ON produtos.id = pp.produto_id
;
-- 2)
SELECT
	pedidos.id
    FROM pedidos
    JOIN produtos_pedidos pp ON pp.pedido_id = pedidos.id
	JOIN produtos ON produtos.id = pp.produto_id
    WHERE produtos.nome = 'Fritas'
;
-- 3)
SELECT
	clientes.nome gostam_de_fritas
    FROM pedidos
    JOIN produtos_pedidos pp ON pp.pedido_id = pedidos.id
	JOIN produtos ON produtos.id = pp.produto_id
    JOIN clientes ON clientes.id = pedidos.cliente_id
    WHERE produtos.nome = 'Fritas'
;
-- 4)
SELECT
	SUM(produtos."preço")
    FROM produtos
    JOIN produtos_pedidos pp ON pp.produto_id = produtos.id
    JOIN pedidos ON pedidos.id = pp.pedido_id
    JOIN clientes ON clientes.id = pedidos.cliente_id
    WHERE clientes.nome = 'Laura'
;
-- 5)
SELECT
	produtos.nome,
	COUNT(produto_id)
    FROM produtos
    JOIN produtos_pedidos pp ON pp.produto_id = produtos.id
	GROUP BY produtos.nome
    ORDER BY produtos.nome
;
