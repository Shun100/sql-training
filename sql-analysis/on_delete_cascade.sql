-- PostgreSQLではDELETE文自体にCASCADEオプションは無い
-- 代わりに、外部キー制約にON DELETE CASCADEを設定しておくことで
-- 親テーブルの行を削除したときに自動で子テーブルの行も削除される

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
  product_id INTEGER REFERENCES products(product_id) ON DELETE CASCADE NOT NULL,
  user_id INTEGER REFERENCES users(user_id) ON DELETE CASCADE NOT NULL,
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

DELETE FROM users WHERE user_id = 1;

SELECT * FROM users;
SELECT * FROM orders;