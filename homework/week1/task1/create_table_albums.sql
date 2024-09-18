CREATE TABLE IF NOT EXISTS student10.albums();

ALTER TABLE IF EXISTS student10.albums
    ADD COLUMN IF NOT EXISTS album_id                      BIGSERIAL,
    ADD COLUMN IF NOT EXISTS name                          VARCHAR,
    ADD COLUMN IF NOT EXISTS year                          SMALLINT,
    ADD COLUMN IF NOT EXISTS genre_id                      SMALLINT
;

COMMENT ON TABLE  student10.albums                               IS 'Таблица с альбомами';
COMMENT ON COLUMN student10.albums.album_id                      IS 'Идентификатор альбома';
COMMENT ON COLUMN student10.albums.name                          IS 'Название альбома';
COMMENT ON COLUMN student10.albums.year                          IS 'Год выпуска';
COMMENT ON COLUMN student10.albums.genre_id                      IS 'Идентификатор жанра альбома';

DO '
BEGIN
    IF NOT EXISTS (
            SELECT 1
            FROM information_schema.table_constraints
            WHERE lower(table_name) = ''albums''
              and lower(table_schema) = ''student10''
              and lower(constraint_type) = ''primary key''
        )
    THEN
        ALTER TABLE student10.albums ADD primary key (album_id);
    END IF;
END ';


DO '
BEGIN
    IF NOT EXISTS (
            SELECT 1
            FROM information_schema.table_constraints
            WHERE lower(table_name) = ''albums''
              and lower(table_schema) = ''student10''
              and lower(constraint_type) = ''foreign key''
        )
    THEN
        ALTER TABLE student10.albums ADD foreign key (genre_id) REFERENCES student10.music_genres(genre_id);
    END IF;
END ';
