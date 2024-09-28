CREATE TABLE IF NOT EXISTS student10.hw3_customers();

ALTER TABLE IF EXISTS student10.hw3_customers
    ADD COLUMN IF NOT EXISTS customer_id                   BIGSERIAL,
    ADD COLUMN IF NOT EXISTS login                         VARCHAR,
    ADD COLUMN IF NOT EXISTS first_name                    VARCHAR,
    ADD COLUMN IF NOT EXISTS last_name                     VARCHAR,
    ADD COLUMN IF NOT EXISTS phone                         VARCHAR
;

COMMENT ON TABLE  student10.hw3_customers                               IS 'Таблица с клиентами';
COMMENT ON COLUMN student10.hw3_customers.customer_id                   IS 'Идентификатор клиента';
COMMENT ON COLUMN student10.hw3_customers.login                         IS 'Логин клиента';
COMMENT ON COLUMN student10.hw3_customers.first_name                    IS 'Имя клиента';
COMMENT ON COLUMN student10.hw3_customers.last_name                     IS 'Фамилия клиента';
COMMENT ON COLUMN student10.hw3_customers.phone                         IS 'Телефонный номер клиента';

DO '
BEGIN
    IF NOT EXISTS (
            SELECT 1
            FROM information_schema.table_constraints
            WHERE lower(table_name) = ''hw3_customers''
              and lower(table_schema) = ''student10''
              and lower(constraint_type) = ''primary key''
        )
    THEN
        ALTER TABLE student10.hw3_customers ADD primary key (customer_id);
    END IF;
END ';

