select sum(downloads), genres.name
from student10.hw3_books books
inner join student10.hw3_genres genres on genres.genre_id = books.genre_id
where genres.name = 'Исторический роман'
group by genres.name ;