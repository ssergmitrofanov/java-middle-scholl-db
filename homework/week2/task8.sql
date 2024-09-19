-------Запрос общего числа прослушиваний каждого жанра с сортировкой по возрастанию

select sum(tl.listenings) as sum_listenings, mg.name
from tracks tr
inner join music_genres mg on mg.genre_id  = tr.genre_id
inner join track_listenings tl on tl.track_id = tr.track_id
group by mg.name
order by sum_listenings asc;


-------Результат на скриншоте task8.jpg


