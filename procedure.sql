delimiter //
CREATE PROCEDURE insere_ou_altera_cliente(
  p_nome varchar(255),
  p_cpf varchar(14),
  p_telefone varchar(14)
)
begin

	declare id_existe int;
    set id_existe = (select id from clientes where nome = p_nome);

	if( id_existe is not null ) then
		update clientes set nome = p_nome, cpf=p_cpf, telefone = p_telefone
		where id = id_existe;
	else
		insert into clientes (nome, cpf, telefone) values(p_nome, p_cpf, p_telefone);
	end if;

end //
delimiter ;



CALL insere_ou_altera_cliente('Josevaldo', '333.333.222-98', '(11)98882-2202')

DROP PROCEDURE insere_ou_altera_cliente

