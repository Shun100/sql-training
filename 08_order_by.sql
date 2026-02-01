SET client_encoding = 'UTF8';
SET lc_messages = 'UTF-8';
SHOW client_encoding;
SHOW lc_messages;

/*
 * ORDER BY
 * 表示順を変更する
 * 句の記述順序は SELECT -> FROM -> WHERE -> GROUP BY -> HAVING -> ORDER BY なので
 * 必ず最後に記述すること
 */

CREATE TABLE product08 (
  id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  product_name VARCHAR(32) NOT NULL,
  category VARCHAR(12) NOT NULL,
  cost_price INTEGER NOT NULL,
  selling_price INTEGER NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO product08 (product_name ,category, cost_price, selling_price) VALUES
  ('T-shirt', 'cloth', 500, 1000),
  ('ゼロから作るDeep Learning', 'book', 400, 1200),
  ('Knife', 'kitchen', 2000, 4000),
  ('pen', 'stationery', 40, 100),
  ('さらっとJavaのStreamを理解する', 'book', 400, 800),
  ('なぜネットワークはつながるのか', 'book', 600, 1200);

/*
 * 構文
 * SELECT <列名1>, <列名2>, <列名3>, ...
 * FROM <テーブル名>
 * ORDER BY <並べ替えの基準となる列1>, <並べ替えの基準となる列2>, ...
 */

-- 昇順
-- SELECT * FROM product08 ORDER BY selling_price;
-- SELECT * FROM product08 ORDER BY selling_price ASC; -- ASCは省略可

-- 降順
-- SELECT * FROM product08 ORDER BY selling_price DESC;

-- カラムは複数指定可能 selling_priceが同一のレコードはid順になる
-- SELECT * FROM product08 ORDER BY selling_price, id;

-- テーブルに存在する列であれば、SELECT句に含まれていない列でも指定可能
-- SELECT product_name, selling_price FROM product08 ORDER BY id;

-- ORDER BY句では集約関数も使える
SELECT category, COUNT(*) FROM product08 GROUP BY category ORDER BY COUNT(*);

SELECT category, SUM(cost_price), SUM(selling_price) FROM product08 GROUP BY category
  HAVING CAST(SUM(selling_price) AS DECIMAL(10,2)) / SUM(cost_price) > 2.0;

DROP TABLE product08;