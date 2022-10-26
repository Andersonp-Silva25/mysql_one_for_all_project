SELECT 
	AR.nome_artista AS artista,
  AL.nome_album AS album
FROM 
	SpotifyClone.albuns AS AL
		INNER JOIN
	SpotifyClone.artistas AS AR ON AL.idartista = AR.idartista
GROUP BY album, artista
ORDER BY artista ASC, album ASC LIMIT 2 OFFSET 3;