CREATE TABLE student10.p1 partition of student10.hw2_books
    FOR VALUES FROM (0) TO (1000);

CREATE TABLE student10.p2 partition of student10.hw2_books
    FOR VALUES FROM (1000) TO (10000);

CREATE TABLE student10.p3 partition of student10.hw2_books
    FOR VALUES FROM (10000);