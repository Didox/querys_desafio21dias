delimiter //
CREATE FUNCTION acrescentando_icms_pedido (valor_total double) RETURNS double
BEGIN

 DECLARE valor_icms double;
 
 IF valor_total > 100 THEN
	SET valor_icms = valor_total * 10 / 100;
 ELSE
	SET valor_icms = valor_total * 5 / 100;
 END IF;
 
 RETURN (valor_total + valor_icms);
 
END//
delimiter ;




select *, acrescentando_icms_pedido(valor_total) as valor_com_icms from pedidos


drop function acrescentando_icms_pedido
