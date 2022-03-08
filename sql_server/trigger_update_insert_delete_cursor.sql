

create TRIGGER atualizar_valor_pedido
ON pedidos_produtos 
AFTER UPDATE, INSERT, DELETE
AS
    declare @pedido_id float;
    set @pedido_id = (SELECT pedido_id FROM INSERTED)

    DECLARE @valor_unidade float
    DECLARE @quantidade int
    DECLARE @valor_total float

    set @valor_total = 0
    
    DECLARE csr_pedidos_produtos CURSOR FOR SELECT valor_unidade, quantidade from pedidos_produtos where pedido_id = @pedido_id
    
    OPEN csr_pedidos_produtos
    
    FETCH NEXT FROM csr_pedidos_produtos INTO @valor_unidade, @quantidade
    
    WHILE @@FETCH_STATUS = 0
    BEGIN
        set @valor_total = @valor_total + (@valor_unidade * @quantidade)

        FETCH NEXT FROM csr_pedidos_produtos INTO @valor_unidade, @quantidade
    END
    
    CLOSE csr_pedidos_produtos
    DEALLOCATE csr_pedidos_produtos

    update pedidos set valor_total = @valor_total
    where id = @pedido_id
GO
