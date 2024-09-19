-------Запрос исполнителей с треками жанра Рок

select distinct msc.name
from musicians msc
inner join tracks_musicians tm on tm.musician_id = msc.musician_id
inner join tracks tr on tr.track_id  = tm.track_id
inner join music_genres mg on mg.genre_id  = tr.genre_id
where mg.name in ('Рок');


-------Результат на скриншоте task3.jpg