-------Запрос исполнителей и их среднего числа прослушиваний с сортировкой по убыванию

select msc.name, avg(tl.listenings) as avg_listetnings
from musicians msc
inner join tracks_musicians tm on tm.musician_id  = msc.musician_id
inner join tracks tr on tr.track_id  = tm.track_id
inner join track_listenings tl on tl.track_id = tr.track_id
group by msc.name
order by avg_listetnings desc;


-------Результат на скриншоте task9.jpg


