SELECT 
	M.nome_musica AS nome,
  COUNT(U.idplano) AS reproducoes
FROM 
	SpotifyClone.historico_reproducoes AS HR
		INNER JOIN
	SpotifyClone.usuarios AS U ON HR.idusuario = U.idusuario
		INNER JOIN
	SpotifyClone.musicas AS M ON HR.idmusica = M.idmusica
GROUP BY nome, U.idplano HAVING U.idplano = 1 OR U.idplano = 3
ORDER BY nome ASC;