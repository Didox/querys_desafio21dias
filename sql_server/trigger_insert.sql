

CREATE TRIGGER diminuir_estoque_de_produtos
ON pedidos_produtos 
AFTER INSERT
AS
    declare @quantidade_estoque_atual float;
    declare @quantidade_estoque_alterada float;
    declare @produto_id float;

    set @produto_id = (SELECT produto_id FROM INSERTED)

    set @quantidade_estoque_atual = (
        select quantidade_estoque from produtos
        where id = @produto_id
    );

    set @quantidade_estoque_alterada = @quantidade_estoque_atual - (SELECT quantidade FROM INSERTED)

    update produtos set quantidade_estoque = @quantidade_estoque_alterada
    where id = @produto_id
GO  
