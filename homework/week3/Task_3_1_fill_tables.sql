--Наполнение таблиц

--Таблица с авторами книг
INSERT INTO student10.hw3_authors (name) VALUES
  ('Стивен Кинг'),
  ('Аркадий и Борис Стругацкие'),
  ('Борис Акунин'),
  ('Лев Толстой'),
  ('Вальтер Скотт'),
  ('Митио Каку'),
  ('Ричард Докинз'),
  ('Ричард Фейнман'),
  ('Юрий Тынянов'),
  ('Михаил Булгаков');


--Таблица с жанрами книг
INSERT INTO student10.hw3_genres (name) VALUES
  ('Исторический роман'),
  ('Фантастика'),
  ('Детектив'),
  ('Ужас'),
  ('Non-fiction'),
  ('Роман');

--Таблица с книгами
INSERT INTO student10.hw3_books (name, genre_id, pages_count, year, author_id, downloads) VALUES
  ('Туман',
      (select genre_id
      from hw3_genres
      where name = 'Ужас'),
      235,
      1980,
      (select author_id
      from hw3_authors
      where name = 'Стивен Кинг'),
      1234),
  ('Трудно быть богом',
        (select genre_id
        from hw3_genres
        where name = 'Фантастика'),
        402,
        1964,
        (select author_id
        from hw3_authors
        where name = 'Аркадий и Борис Стругацкие'),
        38900),
  ('Понедельник начинается в субботу',
        (select genre_id
        from hw3_genres
        where name = 'Фантастика'),
        250,
        1964,
        (select author_id
        from hw3_authors
        where name = 'Аркадий и Борис Стругацкие'),
        21000),
  ('Мастер и Маргарита',
        (select genre_id
        from hw3_genres
        where name = 'Роман'),
        422,
        1966,
        (select author_id
        from hw3_authors
        where name = 'Михаил Булгаков'),
        456890),
  ('Алмазная колесница',
        (select genre_id
        from hw3_genres
        where name = 'Детектив'),
        290,
        2002,
        (select author_id
        from hw3_authors
        where name = 'Борис Акунин'),
        44444),
  ('Физика невозможного',
        (select genre_id
        from hw3_genres
        where name = 'Non-fiction'),
        460,
        2008,
        (select author_id
        from hw3_authors
        where name = 'Митио Каку'),
        2000),
  ('Эгоистичный ген',
        (select genre_id
        from hw3_genres
        where name = 'Non-fiction'),
        610,
        1989	,
        (select author_id
        from hw3_authors
        where name = 'Ричард Докинз'),
        400),
  ('Вы, конечно, шутите, мистер Фейнман!',
        (select genre_id
        from hw3_genres
        where name = 'Non-fiction'),
        450,
        1985,
        (select author_id
        from hw3_authors
        where name = 'Ричард Фейнман'),
        1000),
  ('Уравнение Бога. В поисках теории всего',
        (select genre_id
        from hw3_genres
        where name = 'Non-fiction'),
        200,
        2021,
        (select author_id
        from hw3_authors
        where name = 'Митио Каку'),
        1700),
  ('Кюхля',
        (select genre_id
        from hw3_genres
        where name = 'Исторический роман'),
        350,
        1925,
        (select author_id
        from hw3_authors
        where name = 'Юрий Тынянов'),
        2300),
  ('За миллиард лет до конца света',
        (select genre_id
        from hw3_genres
        where name = 'Фантастика'),
        150,
        1977,
        (select author_id
        from hw3_authors
        where name = 'Аркадий и Борис Стругацкие'),
        20000);

--Таблица со статусами
INSERT INTO student10.hw3_order_statuses (name) VALUES
  ('Новый'),
  ('Оплата'),
  ('Исполнен');

--Таблица с клиентами
INSERT INTO student10.hw3_customers (login, first_name, last_name, phone) VALUES
  ('smitrofanov',
   'Сергей',
   'Митрофанов',
   '8800-555-35-35'),
   ('apushkin',
      'Александр',
      'Пушкин',
      '222-33-44');


--Таблица с заказами
INSERT INTO student10.hw3_orders (customer_id, status_id, cost) VALUES
  ((select customer_id
    from hw3_customers
    where login = 'smitrofanov'),
    (select status_id
        from hw3_order_statuses
        where name = 'Новый'),
    123.45),

  ((select customer_id
      from hw3_customers
      where login = 'apushkin'),
      (select status_id
          from hw3_order_statuses
          where name = 'Исполнен'),
      888.88);

--Таблица со связью заказов и книг
INSERT INTO student10.hw3_orders_books (order_id, book_id) VALUES
  (
    1,
    (select book_id
    from hw3_books
    where name = 'Понедельник начинается в субботу')
  ),
  (
    1,
    (select book_id
    from hw3_books
    where name = 'Трудно быть богом')
  ),

  (
    2,
    (select book_id
    from hw3_books
    where name = 'Туман')
  );







