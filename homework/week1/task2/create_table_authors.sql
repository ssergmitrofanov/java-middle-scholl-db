CREATE TABLE IF NOT EXISTS student10.hw2_authors();

ALTER TABLE IF EXISTS student10.hw2_authors
    ADD COLUMN IF NOT EXISTS author_id                     BIGSERIAL,
    ADD COLUMN IF NOT EXISTS name                          VARCHAR
;

COMMENT ON TABLE  student10.hw2_authors                               IS 'Таблица с авторами книг';
COMMENT ON COLUMN student10.hw2_authors.author_id                     IS 'Идентификатор автора';
COMMENT ON COLUMN student10.hw2_authors.name                          IS 'Имя автора';

DO '
BEGIN
    IF NOT EXISTS (
            SELECT 1
            FROM information_schema.table_constraints
            WHERE lower(table_name) = ''hw2_authors''
              and lower(table_schema) = ''student10''
              and lower(constraint_type) = ''primary key''
        )
    THEN
        ALTER TABLE student10.hw2_authors ADD primary key (author_id);
    END IF;
END ';

