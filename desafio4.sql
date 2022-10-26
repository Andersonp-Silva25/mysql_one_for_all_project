SELECT 
	U.nome_usuario AS usuario,
  IF(MAX(DATE(HR.data_reproducao)) > '2020-12-31', "Usuário ativo", "Usuário inativo") AS status_usuario
FROM 
	SpotifyClone.historico_reproducoes AS HR
		INNER JOIN
	SpotifyClone.usuarios AS U ON HR.idusuario = U.idusuario
GROUP BY U.nome_usuario
ORDER BY U.nome_usuario;