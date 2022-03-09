create proc sp_salvar_pedido_rapido
  @nome varchar(100),
  @email VARCHAR(255),
  @nome_produto VARCHAR(100),
  @quantidade int,
  @valor float
AS

declare @cliente_id int
declare @produto_id int
declare @pedido_id int

select @cliente_id = id from clientes where LOWER(TRIM(email)) = LOWER(TRIM(@email))
if(@cliente_id is null)
BEGIN
    insert into clientes(nome, email)values(@nome, @email)
    set @cliente_id = @@IDENTITY
END

select @produto_id = id from produtos where LOWER(TRIM(nome)) = LOWER(TRIM(@nome_produto))
if(@produto_id is null)
BEGIN
    insert into produtos(nome, quantidade_estoque, valor)values(@nome_produto, @quantidade, @valor)
    set @produto_id = @@IDENTITY
END

insert into pedidos(cliente_id, data)values(@cliente_id, getdate())
set @pedido_id = @@IDENTITY

insert into pedidos_produtos(pedido_id, produto_id, valor_unidade, quantidade)
values(@pedido_id, @produto_id, @valor, @quantidade)
