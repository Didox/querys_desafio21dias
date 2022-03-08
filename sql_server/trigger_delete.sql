

create TRIGGER diminuir_estoque_de_produtos_delete
ON pedidos_produtos 
AFTER DELETE
AS
    DECLARE @quantidade_vendidas_anteriormente int;
    set  @quantidade_vendidas_anteriormente = (SELECT quantidade FROM DELETED)
    
    declare @produto_id float;
    set @produto_id = (SELECT produto_id FROM DELETED)

    declare @quantidade_estoque_atual float;
    declare @quantidade_estoque_alterada float;
   
    set @quantidade_estoque_atual = (
        select quantidade_estoque from produtos
        where id = @produto_id
    );

    set @quantidade_estoque_alterada = @quantidade_estoque_atual + @quantidade_vendidas_anteriormente

    -- voltando o estoque anterior
    update produtos set quantidade_estoque = @quantidade_estoque_alterada
    where id = @produto_id

GO
