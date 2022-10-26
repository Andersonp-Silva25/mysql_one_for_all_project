  SELECT 
	AR.nome_artista AS artista,
  AL.nome_album AS album,
  COUNT(SA.idusuario) AS seguidores
FROM 
	SpotifyClone.albuns AS AL
		INNER JOIN
	SpotifyClone.artistas AS AR ON AL.idartista = AR.idartista
		INNER JOIN
	SpotifyClone.seguindo_artistas AS SA ON AL.idartista = SA.idartista
GROUP BY album, artista
ORDER BY seguidores DESC, artista ASC, album ASC;