CREATE TABLE IF NOT EXISTS student10.tracks();

ALTER TABLE IF EXISTS student10.tracks
    ADD COLUMN IF NOT EXISTS track_id                      BIGSERIAL,
    ADD COLUMN IF NOT EXISTS name                          VARCHAR,
    ADD COLUMN IF NOT EXISTS year                          SMALLINT,
    ADD COLUMN IF NOT EXISTS time                          VARCHAR,
    ADD COLUMN IF NOT EXISTS genre_id                      SMALLINT
;

COMMENT ON TABLE  student10.tracks                               IS 'Таблица с треками';
COMMENT ON COLUMN student10.tracks.track_id                      IS 'Идентификатор трека';
COMMENT ON COLUMN student10.tracks.name                          IS 'Название трека';
COMMENT ON COLUMN student10.tracks.year                          IS 'Год выпуска';
COMMENT ON COLUMN student10.tracks.time                          IS 'Продолжительность трека';
COMMENT ON COLUMN student10.tracks.genre_id                      IS 'Идентификатор жанра трека';

DO '
BEGIN
    IF NOT EXISTS (
            SELECT 1
            FROM information_schema.table_constraints
            WHERE lower(table_name) = ''tracks''
              and lower(table_schema) = ''student10''
              and lower(constraint_type) = ''primary key''
        )
    THEN
        ALTER TABLE student10.tracks ADD primary key (track_id);
    END IF;
END ';


DO '
BEGIN
    IF NOT EXISTS (
            SELECT 1
            FROM information_schema.table_constraints
            WHERE lower(table_name) = ''tracks''
              and lower(table_schema) = ''student10''
              and lower(constraint_type) = ''foreign key''
        )
    THEN
        ALTER TABLE student10.tracks ADD foreign key (genre_id) REFERENCES student10.music_genres(genre_id);
    END IF;
END ';