SELECT 
	COUNT(M.idmusica) AS cancoes,
	COUNT(DISTINCT(A.idartista)) AS artistas, 
  COUNT(DISTINCT(NA.idalbum)) AS albuns
FROM 
	SpotifyClone.musicas AS M
		INNER JOIN
	SpotifyClone.artistas AS A ON M.idartista = A.idartista
		INNER JOIN
	SpotifyClone.albuns AS NA ON M.idalbum = NA.idalbum;