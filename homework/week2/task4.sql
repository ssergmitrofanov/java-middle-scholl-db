-------Запрос исполнителей, у которых нет треков жанра Рэп

select name
from musicians m
where musician_id not in (
	select msc.musician_id
	from musicians msc
	inner join tracks_musicians tm on tm.musician_id = msc.musician_id
	inner join tracks tr on tr.track_id  = tm.track_id
	inner join music_genres mg on mg.genre_id  = tr.genre_id
	where mg.name in ('Рэп')
);


-------Результат на скриншоте task4.jpg


