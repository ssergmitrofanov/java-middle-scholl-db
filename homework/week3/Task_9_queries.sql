select count(*) as "Количество книг", authors.name as "Автор"
from student10.hw3_books books
inner join student10.hw3_authors authors on authors.author_id = books.author_id
group by authors.name ;


