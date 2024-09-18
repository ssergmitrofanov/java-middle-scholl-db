CREATE TABLE IF NOT EXISTS student10.tracks_musicians();

ALTER TABLE IF EXISTS student10.tracks_musicians
    ADD COLUMN IF NOT EXISTS id                            BIGSERIAL,
    ADD COLUMN IF NOT EXISTS track_id                      SMALLINT,
    ADD COLUMN IF NOT EXISTS musician_id                   SMALLINT
;

COMMENT ON TABLE  student10.tracks_musicians                               IS 'Таблица со связью исполниетелей и треков';
COMMENT ON COLUMN student10.tracks_musicians.id                            IS 'Идентификатор записи';
COMMENT ON COLUMN student10.tracks_musicians.track_id                      IS 'Идентификатор трека';
COMMENT ON COLUMN student10.tracks_musicians.musician_id                   IS 'Идентификатор исполнителя';


DO '
BEGIN
    IF NOT EXISTS (
            SELECT 1
            FROM information_schema.table_constraints
            WHERE lower(table_name) = ''tracks_musicians''
              and lower(table_schema) = ''student10''
              and lower(constraint_type) = ''primary key''
        )
    THEN
        ALTER TABLE student10.tracks_musicians ADD primary key (id);
    END IF;
END ';


DO '
BEGIN
    IF NOT EXISTS (
            SELECT 1
            FROM information_schema.table_constraints
            WHERE lower(table_name) = ''tracks_musicians''
              and lower(table_schema) = ''student10''
              and lower(constraint_type) = ''foreign key''
        )
    THEN
        ALTER TABLE student10.tracks_musicians ADD foreign key (track_id) REFERENCES student10.tracks(track_id);
    END IF;
END ';


DO '
BEGIN
    IF NOT EXISTS (
            SELECT 1
            FROM information_schema.table_constraints
            WHERE lower(table_name) = ''tracks_musicians''
              and lower(table_schema) = ''student10''
              and lower(constraint_type) = ''foreign key''
        )
    THEN
        ALTER TABLE student10.tracks_musicians ADD foreign key (musician_id) REFERENCES student10.musicians(musician_id);
    END IF;
END ';