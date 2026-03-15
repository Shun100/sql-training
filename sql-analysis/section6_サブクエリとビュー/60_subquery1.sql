-- サブクエリ1
-- あるクエリで取得した値をWHERE句の条件として使う

SET client_encoding = 'UTF8';

DROP TABLE IF EXISTS products CASCADE;

-- productsテーブル
CREATE TABLE products (
  product_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  product_name CHAR(3) NOT NULL,
  price INTEGER NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP(0)
);

INSERT INTO products (product_name, price) VALUES
  ('商品1', 300),
  ('商品2', 500),
  ('商品3', 1000),
  ('商品4', 100),
  ('商品5', 200),
  ('商品6', 1500);

-- 価格が平均以上の商品だけ取得
SELECT
  *
FROM
  products
WHERE
  -- price >= AVG(price); -- WHERE句に集約関数は直接書けない
  price >= (
    SELECT AVG(price) FROM products -- サブクエリの中に集約関数を書けばOK
  );
