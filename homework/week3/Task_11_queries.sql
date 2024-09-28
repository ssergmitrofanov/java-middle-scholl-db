INSERT INTO student10.hw3_authors (name) VALUES
  ('Борис Пастернак');

INSERT INTO student10.hw3_genres (name) VALUES
  ('Повесть');

INSERT INTO student10.hw3_books (name, genre_id, pages_count, year, author_id, downloads) VALUES
  ('Доктор Живаго',
      null,
      660,
      1955,
      (select author_id
      from hw3_authors
      where name = 'Борис Пастернак'),
      20300);


select name
from student10.hw3_genres
where genre_id not in (
	select distinct genre_id
	from student10.hw3_books
	where genre_id is not null)
and genre_id is not null;