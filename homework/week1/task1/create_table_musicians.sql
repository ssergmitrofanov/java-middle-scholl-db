CREATE TABLE IF NOT EXISTS student10.musicians();

ALTER TABLE IF EXISTS student10.musicians
    ADD COLUMN IF NOT EXISTS musician_id                   BIGSERIAL,
    ADD COLUMN IF NOT EXISTS name                          VARCHAR
;

COMMENT ON TABLE  student10.musicians                               IS 'Таблица с исполнителями';
COMMENT ON COLUMN student10.musicians.musician_id                   IS 'Идентификатор исполнителя';
COMMENT ON COLUMN student10.musicians.name                          IS 'Название группы/имя исполнителя';

DO '
BEGIN
    IF NOT EXISTS (
            SELECT 1
            FROM information_schema.table_constraints
            WHERE lower(table_name) = ''musicians''
              and lower(table_schema) = ''student10''
              and lower(constraint_type) = ''primary key''
        )
    THEN
        ALTER TABLE student10.musicians ADD primary key (musician_id);
    END IF;
END ';

