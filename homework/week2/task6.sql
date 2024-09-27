-------Запрос исполнителей жанра Поп, среднее число прослушиваний треков которых более 20млн

select msc.name, avg(tl.listenings)
from musicians msc
inner join tracks_musicians tm on tm.musician_id = msc.musician_id
inner join tracks tr on tr.track_id = tm.track_id
inner join music_genres mg on mg.genre_id = tr.genre_id
inner join track_listenings tl on tl.track_id = tr.track_id
where mg.name in ('Поп')
group by msc.name
having avg(tl.listenings) > 20000000;


-------Результат на скриншоте task6.jpg


