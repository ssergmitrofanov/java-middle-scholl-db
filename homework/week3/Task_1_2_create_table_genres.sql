CREATE TABLE IF NOT EXISTS student10.hw3_genres();

ALTER TABLE IF EXISTS student10.hw3_genres
    ADD COLUMN IF NOT EXISTS genre_id                      BIGSERIAL,
    ADD COLUMN IF NOT EXISTS name                          VARCHAR
;

COMMENT ON TABLE  student10.hw3_genres                               IS 'Таблица с жанрами книг';
COMMENT ON COLUMN student10.hw3_genres.genre_id                      IS 'Идентификатор жанра';
COMMENT ON COLUMN student10.hw3_genres.name                          IS 'Название жанра';

DO '
BEGIN
    IF NOT EXISTS (
            SELECT 1
            FROM information_schema.table_constraints
            WHERE lower(table_name) = ''hw3_genres''
              and lower(table_schema) = ''student10''
              and lower(constraint_type) = ''primary key''
        )
    THEN
        ALTER TABLE student10.hw3_genres ADD primary key (genre_id);
    END IF;
END ';

