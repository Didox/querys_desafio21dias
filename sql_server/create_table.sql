CREATE TABLE clientes (
    id int NOT NULL identity,
    nome varchar(100) NOT NULL,
    email varchar(255)
    PRIMARY KEY (id)
);
CREATE TABLE produtos (
    id int NOT NULL identity,
    nome varchar(100) NOT NULL,
    valor float,
    quantidade_estoque int
    PRIMARY KEY (id)
);
CREATE TABLE pedidos (
    id int NOT NULL identity,
    cliente_id int NOT NULL,
    valor_total float,
    data datetime
    PRIMARY KEY (id)
);

CREATE TABLE pedidos_produtos (
    id int NOT NULL identity,
    produto_id int NOT NULL,
    pedido_id int NOT NULL,
    valor_unidade float not null,
    quantidade int not null
    PRIMARY KEY (id)
);
