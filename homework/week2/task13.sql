-------------дополнительные запросы на добавление трека без жанра и жанра без трека
INSERT INTO student10.tracks (name, year, time) VALUES
  ('Маленькая страна', 1995, '3:52');


 INSERT INTO student10.tracks_musicians (track_id, musician_id) VALUES
  (
      (select track_id
      from tracks
      where name = 'Маленькая страна'),
      (select musician_id
      from musicians
      where name = 'Наташа Королева')
  );

   INSERT INTO student10.music_genres (name) VALUES
    ('Классическая музыка');

-------Запрос жанров не имеющих треков в БД
 select *
 from music_genres mg
 where mg.genre_id not in (
 	select distinct genre_id
 	from tracks tr
 	where genre_id is not null
 );



-------Результат на скриншоте task13.jpg

