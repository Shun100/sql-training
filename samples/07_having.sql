SET client_encoding = 'UTF8';
SET lc_messages = 'UTF-8';
SHOW client_encoding;
SHOW lc_messages;

/*
 * WHERE句はレコード(行)に対してのみしか条件を指定できない
 * グループに対する条件指定はHAVING句を使用する
 */

CREATE TABLE product07 (
  id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  product_name VARCHAR(32) NOT NULL,
  category VARCHAR(12) NOT NULL,
  cost_price INTEGER NOT NULL,
  selling_price INTEGER NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO product07 (product_name ,category, cost_price, selling_price) VALUES
  ('T-shirt', 'cloth', 500, 1000),
  ('ゼロから作るDeep Learning', 'book', 400, 1200),
  ('Knife', 'kitchen', 2000, 4000),
  ('pen', 'stationery', 40, 100),
  ('さらっとJavaのStreamを理解する', 'book', 400, 800);

/*
 * 構文
 * SELECT <列名1>, <列名2>, <列名3>, ...
 * FROM <テーブル名>
 * GROUP BY <列名1>, <列名2>, <列名3>, ...
 * HAVING <グループの値に対する条件>
 */

SELECT COUNT(*) FROM product07;
SELECT category, COUNT(*) FROM product07 GROUP BY category;

-- categoryごとのレコード数を数え、数が2つのものだけ表示する
SELECT category, COUNT(*) FROM product07 GROUP BY category HAVING COUNT(*) = 2;

-- categoryごとにselling_priceの平均を取り、平均が1000円以上のものだけ表示する
SELECT category, AVG(selling_price) FROM product07 GROUP BY category HAVING AVG(selling_price) >= 1000;

-- 場合によってはHAVING句とWHERE句で同じ結果が得られる
-- これはレコードに対する条件をHAVING句でも記述できるためであるが、本来はHAVING句はグループに対する
-- 条件を指定するものであるので、単なる行に対する条件はSELECT句で指定すべきである
SELECT category, COUNT(*) FROM product07 GROUP BY category HAVING category = 'cloth';
SELECT category, COUNT(*) FROM product07 WHERE category = 'cloth' GROUP BY category;

DROP TABLE product07;