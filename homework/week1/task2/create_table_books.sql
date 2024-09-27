CREATE TABLE IF NOT EXISTS student10.hw2_books();

ALTER TABLE IF EXISTS student10.hw2_books
    ADD COLUMN IF NOT EXISTS book_id                       BIGSERIAL,
    ADD COLUMN IF NOT EXISTS name                          VARCHAR,
    ADD COLUMN IF NOT EXISTS year                          SMALLINT,
    ADD COLUMN IF NOT EXISTS author_id                     SMALLINT
;

COMMENT ON TABLE  student10.hw2_books                               IS 'Таблица с книгами';
COMMENT ON COLUMN student10.hw2_books.book_id                       IS 'Идентификатор книги';
COMMENT ON COLUMN student10.hw2_books.name                          IS 'Название книги';
COMMENT ON COLUMN student10.hw2_books.year                          IS 'Год издания';
COMMENT ON COLUMN student10.hw2_books.author_id                     IS 'Идентификатор автора книги';

DO '
BEGIN
    IF NOT EXISTS (
            SELECT 1
            FROM information_schema.table_constraints
            WHERE lower(table_name) = ''hw2_books''
              and lower(table_schema) = ''student10''
              and lower(constraint_type) = ''primary key''
        )
    THEN
        ALTER TABLE student10.hw2_books ADD primary key (book_id);
    END IF;
END ';

DO '
BEGIN
    IF NOT EXISTS (
            SELECT 1
            FROM information_schema.table_constraints
            WHERE lower(table_name) = ''hw2_books''
              and lower(table_schema) = ''student10''
              and lower(constraint_type) = ''foreign key''
        )
    THEN
        ALTER TABLE student10.hw2_books ADD foreign key (author_id) REFERENCES student10.hw2_authors(author_id);
    END IF;
END ';

