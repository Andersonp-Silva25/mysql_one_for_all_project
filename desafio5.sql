SELECT 
	M.nome_musica AS cancao, COUNT(DISTINCT(HR.idusuario)) AS reproducoes
FROM 
	SpotifyClone.historico_reproducoes AS HR
		INNER JOIN
	SpotifyClone.musicas AS M ON HR.idmusica = M.idmusica
GROUP BY M.idmusica
ORDER BY reproducoes DESC, cancao ASC LIMIT 2;