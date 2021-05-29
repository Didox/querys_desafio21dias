SELECT 
	 *,
	CASE tipo 
	WHEN 2 THEN 'MASTER'
	WHEN 1 THEN 'VIP' 
	ELSE 'CLIENTE COMUM' END AS tipo_de_cliente
FROM clientes;


select * from pedidos

select 
	pedidos.*,  
	CASE clientes.tipo 
	WHEN 2 THEN 'MASTER'
	WHEN 1 THEN 'VIP' 
	ELSE 'CLIENTE COMUM' END AS tipo_de_cliente,
    
    CASE clientes.tipo 
	WHEN 1 THEN (pedidos.valor_total - (pedidos.valor_total * 10 / 100))
	END AS valor_descontado

from pedidos
inner join clientes on clientes.id = pedidos.cliente_id



SELECT 
	pedido_id, 
    produtos.nome, 
    sum(pedidos_produtos.valor * pedidos_produtos.quantidade)  
FROM  pedidos_produtos
inner join produtos on produtos.id = pedidos_produtos.produto_id
group by pedido_id, produto_id 
order by pedido_id


SELECT 
	*,
    descontanto_icms_pedido(valor_total) as valor_com_desconto
FROM  pedidos


delimiter //
CREATE FUNCTION descontanto_icms_pedido (valor_total double) RETURNS double
BEGIN

 DECLARE valor_icms double;
 
 IF valor_total > 100 THEN
	SET valor_icms = valor_total * 10 / 100;
 ELSE
	SET valor_icms = valor_total * 5 / 100;
 END IF;
 
 RETURN (valor_total - valor_icms);
 
END//
delimiter ;








SELECT 
	pedidos.*,
    (pedidos.valor_total * 10 / 100) as com_desconto_10_porcento,
    fn_cliente_vip_ou_master(pedidos.valor_total * 10 / 100) AS tipo_de_clientre
FROM pedidos
where
	fn_cliente_vip_ou_master(pedidos.valor_total * 10 / 100)  in ('VIP', 'MASTER')



DROP FUNCTION fn_cliente_vip_ou_master 

delimiter //
CREATE FUNCTION fn_cliente_vip_ou_master (valor_total double) RETURNS varchar(100)
BEGIN
	 
	 declare retorno varchar(100);
	 
	 IF valor_total > 20 THEN
		set retorno =   'VIP';
	 ELSEIF valor_total > 4 THEN
		set retorno =   'MASTER';
	 ELSE 
		set retorno =   'CLIENTE COMUM';
	 END IF;
	 
	 RETURN retorno;

END//
delimiter ;


