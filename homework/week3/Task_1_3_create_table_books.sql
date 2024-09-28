CREATE TABLE IF NOT EXISTS student10.hw3_books(
    book_id                       BIGSERIAL,
    name                          VARCHAR,
    genre_id                      SMALLINT,
    pages_count                   SMALLINT,
    year                          SMALLINT,
    author_id                     SMALLINT,
    downloads                     INTEGER
    )
    PARTITION BY RANGE (downloads);

COMMENT ON TABLE  student10.hw3_books                               IS 'Таблица с книгами';
COMMENT ON COLUMN student10.hw3_books.book_id                       IS 'Идентификатор книги';
COMMENT ON COLUMN student10.hw3_books.name                          IS 'Название книги';
COMMENT ON COLUMN student10.hw3_books.genre_id                      IS 'Жанр книги';
COMMENT ON COLUMN student10.hw3_books.pages_count                   IS 'Количество страниц';
COMMENT ON COLUMN student10.hw3_books.year                          IS 'Год издания';
COMMENT ON COLUMN student10.hw3_books.author_id                     IS 'Идентификатор автора книги';
COMMENT ON COLUMN student10.hw3_books.downloads                     IS 'Количество скачиваний';

DO '
BEGIN
    IF NOT EXISTS (
            SELECT 1
            FROM information_schema.table_constraints
            WHERE lower(table_name) = ''hw3_books''
              and lower(table_schema) = ''student10''
              and lower(constraint_type) = ''primary key''
        )
    THEN
        ALTER TABLE student10.hw3_books ADD primary key (book_id, downloads);
    END IF;
END ';

DO '
BEGIN
    IF NOT EXISTS (
            SELECT 1
            FROM information_schema.table_constraints
            WHERE lower(table_name) = ''hw3_books''
              and lower(table_schema) = ''student10''
              and lower(constraint_type) = ''foreign key''
        )
    THEN
        ALTER TABLE student10.hw3_books ADD foreign key (author_id) REFERENCES student10.hw3_authors(author_id);
        ALTER TABLE student10.hw3_books ADD foreign key (genre_id) REFERENCES student10.hw3_genres(genre_id);
    END IF;
END ';

