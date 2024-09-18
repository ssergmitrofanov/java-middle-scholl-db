CREATE TABLE IF NOT EXISTS student10.albums_musicians();

ALTER TABLE IF EXISTS student10.albums_musicians
    ADD COLUMN IF NOT EXISTS id                            BIGSERIAL,
    ADD COLUMN IF NOT EXISTS album_id                      SMALLINT,
    ADD COLUMN IF NOT EXISTS musician_id                   SMALLINT
;

COMMENT ON TABLE  student10.albums_musicians                               IS 'Таблица со связью исполниетелей и альбомов';
COMMENT ON COLUMN student10.albums_musicians.id                            IS 'Идентификатор записи';
COMMENT ON COLUMN student10.albums_musicians.album_id                      IS 'Идентификатор альбома';
COMMENT ON COLUMN student10.albums_musicians.musician_id                   IS 'Идентификатор исполнителя';


DO '
BEGIN
    IF NOT EXISTS (
            SELECT 1
            FROM information_schema.table_constraints
            WHERE lower(table_name) = ''albums_musicians''
              and lower(table_schema) = ''student10''
              and lower(constraint_type) = ''primary key''
        )
    THEN
        ALTER TABLE student10.albums_musicians ADD primary key (id);
    END IF;
END ';


DO '
BEGIN
    IF NOT EXISTS (
            SELECT 1
            FROM information_schema.table_constraints
            WHERE lower(table_name) = ''albums_musicians''
              and lower(table_schema) = ''student10''
              and lower(constraint_type) = ''foreign key''
        )
    THEN
        ALTER TABLE student10.albums_musicians ADD foreign key (album_id) REFERENCES student10.albums(album_id);
    END IF;
END ';


DO '
BEGIN
    IF NOT EXISTS (
            SELECT 1
            FROM information_schema.table_constraints
            WHERE lower(table_name) = ''albums_musicians''
              and lower(table_schema) = ''student10''
              and lower(constraint_type) = ''foreign key''
        )
    THEN
        ALTER TABLE student10.albums_musicians ADD foreign key (musician_id) REFERENCES student10.musicians(musician_id);
    END IF;
END ';