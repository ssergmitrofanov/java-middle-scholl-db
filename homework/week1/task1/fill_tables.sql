--Наполнение таблиц

--Таблица с жанрами
INSERT INTO student10.music_genres (name) VALUES
  ('Поп'),
  ('Рок'),
  ('Шансон'),
  ('Рэп'),
  ('Классика');

--Таблица с исполнителями
INSERT INTO student10.musicians (name) VALUES
  ('Eminem'),
  ('Сплин'),
  ('Rhianna'),
  ('Михаил Круг'),
  ('Би-2'),
  ('Michael Jackson');

--Таблица с альбомами
INSERT INTO student10.albums (name, year, genre_id) VALUES
  ('Fellini Tour', 2001,
    (select genre_id
    from music_genres
    where name = 'Рок')),
  ('Thriller', 1982,
      (select genre_id
      from music_genres
      where name = 'Поп')),
  ('Infinite', 1996,
      (select genre_id
      from music_genres
      where name = 'Рэп)),
  ('Посвящение', 2002,
      (select genre_id
      from music_genres
      where name = 'Шансон'));

--Таблица со связью исполнителей и альбомов
INSERT INTO student10.albums_musicians (album_id, musician_id) VALUES
  (
      (select album_id
      from albums
      where name = 'Fellini Tour'),
      (select musician_id
      from musicians
      where name = 'Сплин')
  ),
  (
      (select album_id
      from albums
      where name = 'Fellini Tour'),
      (select musician_id
      from musicians
      where name = 'Би-2')
  ),
  (
      (select album_id
      from albums
      where name = 'Thriller'),
      (select musician_id
      from musicians
      where name = 'Michael Jackson')
  ),
  (
      (select album_id
      from albums
      where name = 'Infinite'),
      (select musician_id
      from musicians
      where name = 'Eminem')
  ),
  (
      (select album_id
      from albums
      where name = 'Посвящение'),
      (select musician_id
      from musicians
      where name = 'Михаил Круг')
  );


--Таблица с треками
INSERT INTO student10.tracks (name, year, time, genre_id) VALUES
  ('Феллини', 2001, '4:10',
    (select genre_id
    from music_genres
    where name = 'Рок')),
  ('Give in to Me', 1991, '4:43',
      (select genre_id
      from music_genres
      where name = 'Поп')),
  ('Love the Way You Lie', 2010, '4:24',
      (select genre_id
      from music_genres
      where name = 'Рэп')),
  ('Владимирский централ', 1998, '4:27',
      (select genre_id
      from music_genres
      where name = 'Шансон'));


--Таблица со связью исполнителей и треков
INSERT INTO student10.tracks_musicians (track_id, musician_id) VALUES
  (
      (select track_id
      from tracks
      where name = 'Феллини'),
      (select musician_id
      from musicians
      where name = 'Сплин')
  ),
  (
      (select track_id
      from tracks
      where name = 'Феллини'),
      (select musician_id
      from musicians
      where name = 'Би-2')
  ),
  (
      (select track_id
      from tracks
      where name = 'Give in to Me'),
      (select musician_id
      from musicians
      where name = 'Michael Jackson')
  ),
  (
      (select track_id
      from tracks
      where name = 'Love the Way You Lie'),
      (select musician_id
      from musicians
      where name = 'Eminem')
  ),
  (
      (select track_id
      from tracks
      where name = 'Love the Way You Lie'),
      (select musician_id
      from musicians
      where name = 'Rhianna')
  ),
  (
      (select track_id
      from tracks
      where name = 'Владимирский централ'),
      (select musician_id
      from musicians
      where name = 'Михаил Круг')
  );

--Таблица с количеством прослушиваний трека
INSERT INTO student10.track_listenings (track_id, listenings) VALUES
  (
      (select track_id
      from tracks
      where name = 'Феллини'),
      1234567
  ),
  (
      (select track_id
      from tracks
      where name = 'Give in to Me'),
      955555555
  ),
  (
      (select track_id
      from tracks
      where name = 'Love the Way You Lie'),
      87654321
  ),
  (
      (select track_id
      from tracks
      where name = 'Владимирский централ'),
      1
  );





