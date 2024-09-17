CREATE DATABASE lab1;

CREATE TABLE users(
    id SERIAL,
    firstname VARCHAR(50) NOT NULL,
    lastname VARCHAR(50) NOT NULL
);

ALTER TABLE users ADD COLUMN is_admin INTEGER;

ALTER TABLE users
ALTER COLUMN is_admin TYPE BOOLEAN
USING is_admin::boolean;

ALTER TABLE users
ALTER COLUMN is_admin
SET DEFAULT false;

ALTER TABLE users
ADD CONSTRAINT users_pkey PRIMARY KEY (id);

CREATE TABLE tasks (
    id SERIAL PRIMARY KEY ,
    name VARCHAR(50),
    user_id INT
);

SELECT * FROM users;

DROP TABLE tasks;

DROP DATABASE lab1;
