CREATE TABLE IF NOT EXISTS student10.hw2_orders();

ALTER TABLE IF EXISTS student10.hw2_orders
    ADD COLUMN IF NOT EXISTS order_id                             BIGSERIAL,
    ADD COLUMN IF NOT EXISTS customer_id                          SMALLINT,
    ADD COLUMN IF NOT EXISTS status_id                            SMALLINT,
    ADD COLUMN IF NOT EXISTS address_shipping                     VARCHAR,
    ADD COLUMN IF NOT EXISTS cost                                 MONEY
;

COMMENT ON TABLE  student10.hw2_orders                                IS 'Таблица с заказами';
COMMENT ON COLUMN student10.hw2_orders.order_id                       IS 'Идентификатор заказа';
COMMENT ON COLUMN student10.hw2_orders.customer_id                    IS 'Идентификатор клиента';
COMMENT ON COLUMN student10.hw2_orders.status_id                      IS 'Идентификатор статуса';
COMMENT ON COLUMN student10.hw2_orders.address_shipping               IS 'Адрес доставки';
COMMENT ON COLUMN student10.hw2_orders.cost                           IS 'Стоимость заказа';

DO '
BEGIN
    IF NOT EXISTS (
            SELECT 1
            FROM information_schema.table_constraints
            WHERE lower(table_name) = ''hw2_orders''
              and lower(table_schema) = ''student10''
              and lower(constraint_type) = ''primary key''
        )
    THEN
        ALTER TABLE student10.hw2_orders ADD primary key (order_id);
    END IF;
END ';

DO '
BEGIN
    IF NOT EXISTS (
            SELECT 1
            FROM information_schema.table_constraints
            WHERE lower(table_name) = ''hw2_orders''
              and lower(table_schema) = ''student10''
              and lower(constraint_type) = ''foreign key''
        )
    THEN
        ALTER TABLE student10.hw2_orders ADD foreign key (customer_id) REFERENCES student10.hw2_customers(customer_id);
        ALTER TABLE student10.hw2_orders ADD foreign key (status_id) REFERENCES student10.hw2_order_statuses(status_id);
    END IF;
END ';

