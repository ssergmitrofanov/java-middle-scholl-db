-------------дополнительные запросы на заполнение таблицы исполниетелей без треков
INSERT INTO student10.musicians (name) VALUES
  ('Лариса Долина'),
  ('Наташа Королева');

-------Запрос исполнителей и их песен
select msc.name, tr.name
from musicians msc
inner join tracks_musicians tm on tm.musician_id  = msc.musician_id
inner join tracks tr on tr.track_id  = tm.track_id ;


select msc.name, tr.name
from musicians msc
left join tracks_musicians tm on tm.musician_id  = msc.musician_id
left join tracks tr on tr.track_id  = tm.track_id ;


select msc.name, tr.name
from musicians msc
full outer join tracks_musicians tm on tm.musician_id  = msc.musician_id
full outer join tracks tr on tr.track_id  = tm.track_id ;



-------Результаты на скриншоте task12.jpg (для left join и full outer join идентичны)


