SELECT 
	MIN(P.valor_plano) AS faturamento_minimo,
  MAX(P.valor_plano) AS faturamento_maximo,
  ROUND(AVG(P.valor_plano), 2) AS faturamento_medio,
  ROUND(SUM(P.valor_plano), 2) AS faturamento_total
FROM 
	SpotifyClone.usuarios AS U
		INNER JOIN
	SpotifyClone.planos AS P ON P.idplano = U.idplano