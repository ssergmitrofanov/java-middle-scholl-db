-----------дополнительное наполнение таблиц
INSERT INTO student10.tracks (name, year, time, genre_id) VALUES
('Выхода нет', 1998, '3:51',
      (select genre_id
      from music_genres
      where name = 'Рок'));


INSERT INTO student10.tracks_musicians (track_id, musician_id) VALUES
  (
      (select track_id
      from tracks
      where name = 'Выхода нет'),
      (select musician_id
      from musicians
      where name = 'Сплин')
  );

-------Запрос количества песен у каждого исполнителя
select msc.name, count(*)
from musicians msc
inner join tracks_musicians tm on tm.musician_id  = msc.musician_id
inner join tracks tr on tr.track_id  = tm.track_id
group by msc.name;



-------Результат на скриншоте task11.jpg


