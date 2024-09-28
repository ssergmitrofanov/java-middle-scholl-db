CREATE TABLE IF NOT EXISTS student10.hw3_order_statuses();

ALTER TABLE IF EXISTS student10.hw3_order_statuses
    ADD COLUMN IF NOT EXISTS status_id                      BIGSERIAL,
    ADD COLUMN IF NOT EXISTS name                           VARCHAR
;

COMMENT ON TABLE  student10.hw3_order_statuses                                IS 'Таблица со статусами заказов';
COMMENT ON COLUMN student10.hw3_order_statuses.status_id                      IS 'Идентификатор статуса';
COMMENT ON COLUMN student10.hw3_order_statuses.name                           IS 'Название статуса';


DO '
BEGIN
    IF NOT EXISTS (
            SELECT 1
            FROM information_schema.table_constraints
            WHERE lower(table_name) = ''hw3_order_statuses''
              and lower(table_schema) = ''student10''
              and lower(constraint_type) = ''primary key''
        )
    THEN
        ALTER TABLE student10.hw3_order_statuses ADD primary key (status_id);
    END IF;
END ';