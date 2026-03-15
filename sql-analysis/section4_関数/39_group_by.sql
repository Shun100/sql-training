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
  ('山田', '男性', 25, '埼玉'),
  ('加藤', '女性', 45, '東京'),
  ('移動', '男性', 22, '東京');

-- 性別ごとの人数を集計
SELECT
  gender,
  COUNT(*) as gender_count
FROM users
GROUP BY gender;

-- 性別ごとの平均年齢を集計
SELECT
  gender,
  AVG(age)::INTEGER as avg_age -- ::で型をキャスト
FROM users
GROUP BY gender;

-- 性別と都道府県ごとの人数を集計
SELECT
  gender,
  pref,
  COUNT(*) as user_count
FROM users
GROUP BY gender, pref;