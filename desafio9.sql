SELECT 
	COUNT(*) AS quantidade_musicas_no_historico
FROM 
	SpotifyClone.historico_reproducoes AS HR
		INNER JOIN
	SpotifyClone.usuarios AS U ON HR.idusuario = U.idusuario
GROUP BY HR.idusuario LIMIT 1;