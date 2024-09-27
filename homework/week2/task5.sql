-------Запрос треков жанра Поп с числом прослушиваний более 30000

select tr.name, tl.listenings
from tracks tr
inner join track_listenings tl on tl.track_id  = tr.track_id
inner join music_genres mg on mg.genre_id = tr.genre_id
where tl.listenings > 30000 and mg.name in ('Поп');


-------Результат на скриншоте task5.jpg


