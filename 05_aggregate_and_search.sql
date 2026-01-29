SET client_encoding = 'UTF8';
SET lc_messages = 'UTF-8';
SHOW client_encoding;
SHOW lc_messages;

/* 集約関数
 * COUNT: 行数を数える
 * SUM: 合計する
 * AVG: 平均する
 * MAX: 最大値を求める
 * MIN: 最小値を求める
 */

CREATE TABLE product05 (
  id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  product_name VARCHAR(32) NOT NULL,
  category VARCHAR(12) NOT NULL,
  cost_price INTEGER NOT NULL,
  selling_price INTEGER NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO product05 (product_name ,category, cost_price, selling_price) VALUES
  ('T-shirt', 'cloth', 500, 1000),
  ('ゼロから作るDeep Learning', 'book', 400, 1200),
  ('Knife', 'kitchen', 2000, 4000),
  ('pen', 'stationery', 40, 100),
  ('さらっとJavaのStreamを理解する', 'book', 400, 800);

-- COUNT
SELECT COUNT(*) FROM product05; -- NULLがあってもカウントされる
SELECT COUNT(product_name) FROM product05; -- カラムを指定するとNULLはカウントされない
SELECT COUNT(DISTINCT category) FROM product05; -- 引数にDISTINCTを使える

-- SUM
SELECT SUM(selling_price) FROM product05;
SELECT SUM(cost_price), SUM(selling_price) FROM product05;

-- AVG
SELECT AVG(selling_price) FROM product05;

-- MAX
SELECT MAX(selling_price) FROM product05;
SELECT MAX(created_at) FROM product05; -- どんな型のデータにも使える

-- MIN
SELECT MIN(selling_price) FROM product05;

DROP TABLE product05;