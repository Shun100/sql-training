SET client_encoding = 'UTF8';
SHOW client_encoding;

CREATE DATABASE sql_practice;

-- テーブルの作成
-- CREATE TABLE users (
--   id SERIAL PRIMARY KEY,
--   name TEXT,
--   age INT
-- );

-- テーブルへの挿入
-- INSERT INTO users (name, age) VALUES
-- ('Alice', 20),
-- ('Bob', 25);

-- テーブルからの取得
SELECT * FROM users;

-- テーブルの削除（データ戻せないので注意）
-- DROP TABLE Product;

-- CREATE TABLE Product (
--   -- product_id CHAR(4) NOT NULL,
--   product_id INTEGER GENERATED ALWAYS AS IDENTITY, -- auto number
--   product_name VARCHAR(32) NOT NULL,
--   product_category VARCHAR(12) NOT NULL,
--   created_at TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP,
--   updated_at TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP,
--   PRIMARY KEY (product_id)
-- );

INSERT INTO Product (product_name, product_category) VALUES
  ('ゼロから作るDeep Learning', 'book');

SELECT * FROM Product;

-- DATE: 日付だけ 現在時刻を入れるときは`CURRENT_DATE`
-- TIMESTAMP: 日付+時刻 現在日時を入れるときは`CURRENT_TIMESTAMP`