SELECT 
	U.nome_usuario AS usuario,
  COUNT(HR.idmusica) AS qt_de_musicas_ouvidas,
  SUM(ROUND(M.duracao_segundos/60, 2)) AS total_minutos
FROM 
	SpotifyClone.historico_reproducoes AS HR
		INNER JOIN
	SpotifyClone.usuarios AS U ON HR.idusuario = U.idusuario
		INNER JOIN
	SpotifyClone.musicas AS M ON HR.idmusica = M.idmusica
GROUP BY U.nome_usuario
ORDER BY U.nome_usuario ASC;