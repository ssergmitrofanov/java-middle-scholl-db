-------Запрос общего числа прослушиваний треков жанра Рэп

select sum(tl.listenings)
from tracks tr
inner join music_genres mg on mg.genre_id  = tr.genre_id
inner join track_listenings tl on tl.track_id = tr.track_id
where mg.name in ('Рэп');


-------Результат на скриншоте task7.jpg


