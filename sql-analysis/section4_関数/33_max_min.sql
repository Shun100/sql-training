SET client_encoding = 'UTF8';
CREATE EXTENSION IF NOT EXISTS pgcrypto; -- UUIDを生成するための拡張機能を有効化

DROP TABLE IF EXISTS users CASCADE;

CREATE TABLE users (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  name VARCHAR(10),
  age integer NOT NULL
);

INSERT INTO users (name, age) VALUES
  ('田中', 22),
  ('山田', 30),
  ('平田', 35),
  ('牛村', 20),
  ('半田儀', 60);

SELECT
  MAX(age) as max_age,
  MIN(age) as min_age,
  SUM(age) as sum_age,
  AVG(age) as avg_age
FROM
  users;