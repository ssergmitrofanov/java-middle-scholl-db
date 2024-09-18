CREATE TABLE IF NOT EXISTS student10.track_listenings();

ALTER TABLE IF EXISTS student10.track_listenings
    ADD COLUMN IF NOT EXISTS track_id                      BIGSERIAL,
    ADD COLUMN IF NOT EXISTS listenings                    BIGINT
;

COMMENT ON TABLE  student10.track_listenings                               IS 'Таблица с количеством прослушиваний трека';
COMMENT ON COLUMN student10.track_listenings.track_id                      IS 'Идентификатор трека';
COMMENT ON COLUMN student10.track_listenings.listenings                    IS 'Количество прослушиваний трека';


DO '
BEGIN
    IF NOT EXISTS (
            SELECT 1
            FROM information_schema.table_constraints
            WHERE lower(table_name) = ''track_listenings''
              and lower(table_schema) = ''student10''
              and lower(constraint_type) = ''primary key''
        )
    THEN
        ALTER TABLE student10.track_listenings ADD primary key (track_id);
    END IF;
END ';


DO '
BEGIN
    IF NOT EXISTS (
            SELECT 1
            FROM information_schema.table_constraints
            WHERE lower(table_name) = ''track_listenings''
              and lower(table_schema) = ''student10''
              and lower(constraint_type) = ''foreign key''
        )
    THEN
        ALTER TABLE student10.track_listenings ADD foreign key (track_id) REFERENCES student10.tracks(track_id);
    END IF;
END ';