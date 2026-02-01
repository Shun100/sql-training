SET client_encoding = 'UTF8';
SET lc_messages = 'UTF-8';
SHOW client_encoding;
SHOW lc_messages;

/*
 * GROUP BY
 * テーブルを複数のグループに切り分ける
 * 必ずFROM句の後ろにおく
 */

CREATE TABLE product06 (
  id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  product_name VARCHAR(32) NOT NULL,
  category VARCHAR(12) NOT NULL,
  cost_price INTEGER NOT NULL,
  selling_price INTEGER NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO product06 (product_name ,category, cost_price, selling_price) VALUES
  ('T-shirt', 'cloth', 500, 1000),
  ('ゼロから作るDeep Learning', 'book', 400, 1200),
  ('Knife', 'kitchen', 2000, 4000),
  ('pen', 'stationery', 40, 100),
  ('さらっとJavaのStreamを理解する', 'book', 400, 800);

-- GROUP BYでグループ分けが可能 FROM句の後に置くこと
SELECT category, COUNT(*) FROM product06 GROUP BY category;

-- WHERE句との組み合わせも可能 WHERE句の後に置くこと
-- categoryごとにレコード数を数え、selling_priceが1000以下のものの数を、categoryごとに表示する
SELECT category, COUNT(*) FROM product06 WHERE selling_price <= 1000 GROUP BY category;

DROP TABLE product06;