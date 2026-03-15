SET client_encoding = 'UTF8';
SHOW client_encoding;

DROP TABLE IF EXISTS users;

CREATE TABLE users (
  user_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name varchar(3)
);

INSERT INTO users (name) VALUES
  ('小林'),
  ('田中'),
  ('林'),
  ('林田'),
  ('加藤'),
  ('林原'),
  ('中林原');

SELECT * FROM users WHERE name LIKE ('%林'); -- 林で終わる文字列
SELECT * FROM users WHERE name LIKE ('林%'); -- 林で終わる文字列
SELECT * FROM users WHERE name LIKE ('%林%'); -- 林が含まれる文字列
SELECT * FROM users WHERE name LIKE ('_林'); -- 林で終わる2文字の文字列
