--Наполнение таблиц

--Таблица с авторами книг
INSERT INTO student10.hw2_authors (name) VALUES
  ('Стивен Кинг'),
  ('Борис и Аркадий Стругацкие'),
  ('Борис Акунин'),
  ('Михаил Булгаков');

--Таблица с книгами
INSERT INTO student10.hw2_books (name, year, author_id) VALUES
  ('Туман', 1980,
      (select author_id
      from hw2_authors
      where name = 'Стивен Кинг')),
  ('Трудно быть богом', 1964,
        (select author_id
        from hw2_authors
        where name = 'Борис и Аркадий Стругацкие')),
  ('Понедельник начинается в субботу', 1965,
        (select author_id
        from hw2_authors
        where name = 'Борис и Аркадий Стругацкие')),
  ('Мастер и Маргарита', 1966,
        (select author_id
        from hw2_authors
        where name = 'Михаил Булгаков')),
  ('Роковые яйца', 1925,
        (select author_id
        from hw2_authors
        where name = 'Михаил Булгаков')),
  ('Алмазная колесница', 2002,
        (select author_id
        from hw2_authors
        where name = 'Борис Акунин'));

--Таблица со статусами
INSERT INTO student10.hw2_order_statuses (name) VALUES
  ('Новый'),
  ('Оплата'),
  ('Доставка'),
  ('Завершен');

--Таблица с клиентами
INSERT INTO student10.hw2_customers (login, first_name, last_name, address, phone) VALUES
  ('smitrofanov',
   'Сергей',
   'Митрофанов',
   'г.Москва ул. Котика, д.1 кв.2',
   '8800-555-35-35'),
   ('ltolstoy',
      'Лев',
      'Толстой',
      'дер.Ясная Поляна ул. Мировая, д.4',
      '222-33-44');


--Таблица с заказами
INSERT INTO student10.hw2_orders (customer_id, status_id, address_shipping, cost) VALUES
  ((select customer_id
    from hw2_customers
    where login = 'smitrofanov'),
    (select status_id
        from hw2_order_statuses
        where name = 'Новый'),
    'г.Москва ул. Котика, д.1 кв.2',
    123.45),

  ((select customer_id
      from hw2_customers
      where login = 'ltolstoy'),
      (select status_id
          from hw2_order_statuses
          where name = 'Доставка'),
      'дер.Ясная Поляна ул. Мировая, д.4',
      888.88);

--Таблица со связью заказов и книг
INSERT INTO student10.hw2_orders_books (order_id, book_id) VALUES
  (
    1,
    (select book_id
    from hw2_books
    where name = 'Понедельник начинается в субботу')
  ),
  (
    1,
    (select book_id
    from hw2_books
    where name = 'Трудно быть богом')
  ),

  (
    2,
    (select book_id
    from hw2_books
    where name = 'Туман')
  );







