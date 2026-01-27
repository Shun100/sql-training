CREATE DATABASE sql_practice;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name TEXT,
  age INT
);

INSERT INTO users (name, age) VALUES
('Alice', 20),
('Bob', 25);

SELECT * FROM users;