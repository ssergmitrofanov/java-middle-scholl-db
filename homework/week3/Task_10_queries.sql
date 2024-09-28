INSERT INTO student10.hw3_genres (name) VALUES
  ('Фэнтези');
  ('Биография');



select b.name as "Книга", g.name as "Жанр", a.name as "Автор"
from student10.hw3_books b
full outer join student10.hw3_genres g on g.genre_id = b.genre_id
left outer join student10.hw3_authors a on a.author_id = b.author_id ;



select b.name as "Книга", g.name as "Жанр", a.name as "Автор"
from student10.hw3_books b
inner join student10.hw3_genres g on g.genre_id = b.genre_id
right outer join student10.hw3_authors a on a.author_id = b.author_id ;