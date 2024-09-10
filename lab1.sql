CREATE DATABASE lab1;

CREATE TABLE users(
    id SERIAL,
    firstname VARCHAR(50) NOT NULL,
    lastname VARCHAR(50) NOT NULL
);

ALTER TABLE users
ADD COLUMN is_admin INTEGER;


-- INSERT INTO users (firstname, lastname, is_admin)
-- VALUES
--     ('Alice', 'A', 0),
--     ('Bob',  'B', 1),
--     ('Charlie', 'C', 0);


ALTER TABLE users
ALTER COLUMN is_admin TYPE BOOLEAN
USING is_admin::boolean;

SELECT * FROM users;

