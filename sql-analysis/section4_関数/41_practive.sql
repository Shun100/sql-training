SET client_encoding = 'UTF8';

DROP TABLE IF EXISTS users, products, orders CASCADE;

-- usersテーブル
CREATE TABLE users (
  user_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  user_name CHAR(4),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP(0)
);

-- productsテーブル
CREATE TABLE products (
  product_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  product_name CHAR(3) NOT NULL,
  price INTEGER NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP(0)
);

-- ordersテーブル
CREATE TABLE orders (
  order_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  product_id INTEGER REFERENCES products(product_id) NOT NULL,
  user_id INTEGER REFERENCES users(user_id) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP(0)
);

INSERT INTO users (user_name) VALUES
  ('ユーザ1'),
  ('ユーザ2'),
  ('ユーザ3'),
  ('ユーザ4'),
  ('ユーザ5'),
  ('ユーザ6');

INSERT INTO products (product_name, price) VALUES
  ('商品1', 300),
  ('商品2', 500),
  ('商品3', 1000),
  ('商品4', 100),
  ('商品5', 200),
  ('商品6', 1500);

INSERT INTO orders (product_id, user_id) VALUES
  (1, 1),
  (1, 1),
  (1, 1),
  (1, 1),
  (1, 1),
  (1, 6),
  (2, 2),
  (2, 2),
  (2, 2),
  (2, 2),
  (2, 2),
  (3, 3),
  (3, 3),
  (3, 3),
  (3, 3),
  (4, 4),
  (4, 5),
  (4, 3),
  (4, 1),
  (5, 1),
  (5, 3),
  (5, 4),
  (5, 5);

-- ユーザごとの購入総額を集計
SELECT -- 出力できるのは「GROUP BYに含まれる」もしくは「集計関数の中にある」列のみ
  u.user_name,
  SUM(p.price) AS total_price,
  CASE
    WHEN (SUM(p.price) >= 2000) THEN true
    ELSE false
  END AS can_get_coupon
FROM
  orders AS o
INNER JOIN users AS u
  ON o.user_id = u.user_id
INNER JOIN products AS p
  ON o.product_id = p.product_id
GROUP BY u.user_id, u.user_name
ORDER BY u.user_id;
