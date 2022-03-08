create TRIGGER diminuir_estoque_de_produtos_update
ON pedidos_produtos 
AFTER UPDATE
AS
    DECLARE @quantidade_vendidas_anteriormente int;
    set  @quantidade_vendidas_anteriormente = (SELECT quantidade FROM DELETED)

    DECLARE @quantidade_vendidas_atual int;
    set  @quantidade_vendidas_atual = (SELECT quantidade FROM INSERTED)
    
    declare @produto_id float;
    set @produto_id = (SELECT produto_id FROM INSERTED)

    declare @quantidade_estoque_atual float;
    declare @quantidade_estoque_alterada float;
   
    set @quantidade_estoque_atual = (
        select quantidade_estoque from produtos
        where id = @produto_id
    );

    set @quantidade_estoque_alterada = @quantidade_estoque_atual + @quantidade_vendidas_anteriormente

    set @quantidade_estoque_alterada = @quantidade_estoque_alterada - @quantidade_vendidas_atual
    
    update produtos set quantidade_estoque = @quantidade_estoque_alterada
    where id = @produto_id

GO
