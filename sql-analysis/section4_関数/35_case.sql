SET client_encoding = 'UTF8';
CREATE EXTENSION IF NOT EXISTS pgcrypto; -- UUIDを生成するための拡張機能を有効化

DROP TABLE IF EXISTS users CASCADE;

CREATE TABLE users (
  user_id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  name VARCHAR(3),
  gender CHAR(2),
  age INTEGER,
  pref VARCHAR(3)
);

INSERT INTO users (name, gender, age, pref) VALUES
  ('鈴木', '男性', 25, '埼玉'),
  ('佐藤', '女性', 21, '東京'),
  ('田中', '男性', 30, '埼玉'),
  ('山田', '男性', 25, '熊本'),
  ('加藤', '女性', 45, '和歌山'),
  ('移動', '男性', 22, '栃木');

SELECT
  pref,
  CASE
    WHEN pref IN ('東京', '埼玉', '栃木') THEN '東日本'
    WHEN pref IN ('和歌山', '熊本') THEN '西日本'
  END AS region
FROM
  users;