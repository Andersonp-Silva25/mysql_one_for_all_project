DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

  CREATE TABLE SpotifyClone.planos(
      idplano INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
      tipo_plano VARCHAR(50) NOT NULL,
      valor_plano DECIMAL(5,2) NOT NULL
  ) ENGINE = InnoDB;
  
  CREATE TABLE SpotifyClone.usuarios(
      idusuario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
      nome_usuario VARCHAR(50) NOT NULL,
      idade INT NOT NULL,
      idplano INT NOT NULL,
      data_assinatura DATE NOT NULL,
      FOREIGN KEY (idplano)
        REFERENCES planos(idplano)
  ) ENGINE = InnoDB;

  CREATE TABLE SpotifyClone.artistas(
      idartista INT PRIMARY KEY NOT NULL auto_increment,
      nome_artista VARCHAR(50) NOT NULL
  ) ENGINE = InnoDB;

  CREATE TABLE SpotifyClone.albuns(
      idalbum INT PRIMARY KEY NOT NULL auto_increment,
      nome_album VARCHAR(50) NOT NULL,
      ano_lancamento YEAR NOT NULL,
      idartista INT NOT NULL,
      FOREIGN KEY (idartista)
        REFERENCES SpotifyClone.artistas (idartista)
  ) ENGINE = InnoDB;

  CREATE TABLE SpotifyClone.musicas(
      idmusica INT PRIMARY KEY NOT NULL auto_increment,
      nome_musica VARCHAR(50) NOT NULL,
      duracao_segundos INT NOT NULL,
      idartista INT NOT NULL,
      idalbum INT NOT NULL,
      FOREIGN KEY (idartista)
        REFERENCES SpotifyClone.artistas (idartista),
      FOREIGN KEY (idalbum)
        REFERENCES SpotifyClone.albuns (idalbum)
  ) ENGINE = InnoDB;

  CREATE TABLE SpotifyClone.seguindo_artistas(
      idusuario INT NOT NULL,
      idartista INT NOT NULL,
      CONSTRAINT PRIMARY KEY (idusuario, idartista),
      FOREIGN KEY (idusuario)
        REFERENCES SpotifyClone.usuarios(idusuario),
      FOREIGN KEY (idartista)
        REFERENCES SpotifyClone.artistas(idartista)
  ) ENGINE = InnoDB;

  CREATE TABLE SpotifyClone.historico_reproducoes(
      idmusica INT NOT NULL,
      idusuario INT NOT NULL,
      data_reproducao DATETIME,
      CONSTRAINT PRIMARY KEY (idmusica, idusuario),
      FOREIGN KEY (idusuario)
        REFERENCES SpotifyClone.usuarios(idusuario),
      FOREIGN KEY (idmusica)
        REFERENCES SpotifyClone.musicas(idmusica)
  ) ENGINE = InnoDB;

  INSERT INTO SpotifyClone.planos(tipo_plano, valor_plano)
  VALUES
    ('gratuito', 0),
    ('universitário', 5.99),
    ('pessoal', 6.99),
    ('familiar', 7.99);

  INSERT INTO SpotifyClone.usuarios(nome_usuario, idade, idplano, data_assinatura)
  VALUES
    ("Barbara Liskov", 82, 1, "2019-10-20"),
    ("Robert Cecil Martin", 58, 1, "2017-01-06"),
    ("Ada Lovelace", 37, 4, "2017-12-30"),
    ("Martin Fowler", 46, 4, "2017-01-17"),
    ("Sandi Metz", 58, 4, "2018-04-29"),
    ("Paulo Freire", 19, 2, "2018-02-14"),
    ("Bell Hooks", 26, 2, "2018-01-05"),
    ("Christopher Alexander", 85, 3, "2019-06-05"),
    ("Judith Butler", 45, 3, "2020-05-13"),
    ("Jorge Amado", 58, 3, "2017-02-17");

  INSERT INTO SpotifyClone.artistas(nome_artista)
  VALUES
    ("Beyoncé"), ("Queen"), ("Elis Regina"), ("Baco Exu do Blues"), ("Blind Guardian"), ("Nina Simone");

  INSERT INTO SpotifyClone.albuns(nome_album, ano_lancamento, idartista)
  VALUES
    ("Renaissance", "2022", 1),
    ("Jazz", "1978", 2),
    ("Hot Space", "1982", 2),
    ("Falso Brilhante", "1998", 3),
    ("Vento de Maio", "2001", 3),
    ("QVVJFA?", "2003", 4),
    ("Somewhere Far Beyond", "2007", 5),
    ("I Put A Spell On You", "2012", 6);

  INSERT INTO SpotifyClone.seguindo_artistas (idusuario, idartista)
  VALUES
    (1, 1), (1, 2), (1, 3), (2, 1), (2, 3), (3, 2), (4, 4), (5, 5),
    (5, 6), (6, 6), (6, 1), (7, 6), (9, 3), (10, 2);

  INSERT INTO SpotifyClone.musicas (nome_musica, duracao_segundos, idartista, idalbum)
  VALUES
    ("BREAK MY SOUL", 279, 1, 1),
    ("VIRGO’S GROOVE", 369, 1, 1),
    ("ALIEN SUPERSTAR", 116, 1, 1),
    ("Don’t Stop Me Now", 203, 2, 2),
    ("Under Pressure", 152, 2, 3),
    ("Como Nossos Pais", 105, 3, 4),
    ("O Medo de Amar é o Medo de Ser Livre", 207, 3, 5),
    ("Samba em Paris", 267, 4, 6),
    ("The Bard’s Song", 244, 5, 7),
    ("Feeling Good", 100, 6, 8);
    
  INSERT INTO SpotifyClone.historico_reproducoes(idmusica, idusuario, data_reproducao)
  VALUES
    (8, 1, "2022-02-28 10:45:55"), (2, 1, "2020-05-02 05:30:35"), (10, 1, "2020-03-06 11:22:33"),
    (10, 2, "2022-08-05 08:05:17"), (7, 2, "2020-01-02 07:40:33"),
    (10, 3, "2020-11-13 16:55:13"), (2, 3, "2020-12-05 18:38:30"),
    (8, 4, "2021-08-15 17:10:10"),
    (8, 5, "2022-01-09 01:44:33"), (5, 5, "2020-08-06 15:23:43"),
    (7, 6, "2017-01-24 00:31:17"), (1, 6, "2017-10-12 12:35:20"),
    (4, 7, "2011-12-15 22:30:49"),
    (4, 8, "2012-03-17 14:56:41"),
    (9, 9, "2022-02-24 21:14:22"),
    (3, 10, "2015-12-13 08:30:22");
    
    
