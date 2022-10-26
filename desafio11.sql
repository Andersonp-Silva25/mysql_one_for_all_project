SELECT 
	nome_musica,
	REPLACE(
  REPLACE(
  REPLACE(
  REPLACE(
  REPLACE(nome_musica,
		'Bard', 'QA'),
		'Amar', 'Code Review'),
    'Pais', 'Pull Requests'),
    'SOUL', 'CODE'),
		'SUPERSTAR', 'SUPERDEV') 
	AS novo_nome
FROM SpotifyClone.musicas
WHERE nome_musica IN(
	'The Bard’s Song',
	'O Medo de Amar é o Medo de Ser Livre', 
  'Como Nossos Pais',
  'BREAK MY SOUL',
  'ALIEN SUPERSTAR'
)
ORDER BY nome_musica DESC;