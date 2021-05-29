select
	(
	  	select sum((
		      select conta_correntes.saldo_atual from conta_correntes 
		      where conta_correntes.usuario_id = u.id
		      order by conta_correntes.data_ultima_atualizacao_saldo desc limit 1
		    ))
	    from usuarios u
	    where u.id = usuarios.id
	) as saldo_total,
	usuarios.* 
FROM usuarios WHERE (usuarios.status_cliente_id = 1) AND (
  (
    (
	  	select sum((
		      select conta_correntes.saldo_atual from conta_correntes 
		      where conta_correntes.usuario_id = u.id
		      order by conta_correntes.data_ultima_atualizacao_saldo desc limit 1
		    ))
	    from usuarios u
	    where u.id = usuarios.id
	) < 10
  )
) ORDER BY nome asc