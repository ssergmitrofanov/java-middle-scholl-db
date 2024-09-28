CREATE TABLE IF NOT EXISTS student10.hw3_orders_books();

ALTER TABLE IF EXISTS student10.hw3_orders_books
    ADD COLUMN IF NOT EXISTS id                            BIGSERIAL,
    ADD COLUMN IF NOT EXISTS order_id                      SMALLINT,
    ADD COLUMN IF NOT EXISTS book_id                       SMALLINT
;

COMMENT ON TABLE  student10.hw3_orders_books                               IS 'Таблица со связью покупателей и заказов';
COMMENT ON COLUMN student10.hw3_orders_books.id                            IS 'Идентификатор записи';
COMMENT ON COLUMN student10.hw3_orders_books.order_id                      IS 'Идентификатор заказа';
COMMENT ON COLUMN student10.hw3_orders_books.book_id                       IS 'Идентификатор книги';


DO '
BEGIN
    IF NOT EXISTS (
            SELECT 1
            FROM information_schema.table_constraints
            WHERE lower(table_name) = ''hw3_orders_books''
              and lower(table_schema) = ''student10''
              and lower(constraint_type) = ''primary key''
        )
    THEN
        ALTER TABLE student10.hw3_orders_books ADD primary key (id);
    END IF;
END ';


DO '
BEGIN
    IF NOT EXISTS (
            SELECT 1
            FROM information_schema.table_constraints
            WHERE lower(table_name) = ''hw3_orders_books''
              and lower(table_schema) = ''student10''
              and lower(constraint_type) = ''foreign key''
        )
    THEN
        ALTER TABLE student10.hw3_orders_books ADD foreign key (order_id) REFERENCES student10.hw3_orders(order_id);
        ALTER TABLE student10.hw3_orders_books ADD foreign key (book_id) REFERENCES student10.hw3_books(book_id);
    END IF;
END ';