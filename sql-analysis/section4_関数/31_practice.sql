SET client_encoding = 'UTF8';
CREATE EXTENSION IF NOT EXISTS pgcrypto; -- UUIDを生成するための拡張機能を有効化

DROP TABLE IF EXISTS users, products, orders;

-- usersテーブル
CREATE TABLE users (
  user_id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_name VARCHAR(10) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP(0)
);

INSERT INTO users (user_name) VALUES
  ('Alice'),
  ('Bob'),
  ('Charley'),
  ('David');

SELECT * FROM users;

-- productsテーブル
CREATE TABLE products (
  product_id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  product_name VARCHAR(10) NOT NULL,
  price INTEGER NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP(0)
);

INSERT INTO products (product_name, price) VALUES
  ('product01', 1000),
  ('product02', 500),
  ('product03', 2000),
  ('product04', 3000),
  ('product05', 2000);

SELECT * FROM products;

-- ordersテーブル
CREATE TABLE orders (
  order_id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  product_id UUID REFERENCES products(product_id) NOT NULL,
  user_id UUID REFERENCES users(user_id) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP(0)
);

INSERT INTO orders (product_id, user_id)
SELECT p.product_id, u.user_id
FROM products p
CROSS JOIN users u
WHERE u.user_name = 'Alice';

INSERT INTO orders (product_id, user_id)
SELECT p.product_id, u.user_id
FROM products p
CROSS JOIN users u
WHERE p.product_name IN ('product01', 'product02') AND u.user_name = 'Bob';

INSERT INTO orders (product_id, user_id)
SELECT p.product_id, u.user_id
FROM products p
CROSS JOIN users u
WHERE p.product_name IN ('product03', 'product04') AND u.user_name = 'Charley';

INSERT INTO orders (product_id, user_id)
SELECT p.product_id, u.user_id
FROM products p
CROSS JOIN users u
WHERE p.product_name = 'product04' AND u.user_name = 'David';

SELECT * FROM orders;

-- 2000円以上の商品を何人買ったか集計
SELECT COUNT(DISTINCT o.user_id)
FROM orders AS o
INNER JOIN products AS p
  ON o.product_id = p.product_id
WHERE p.price >= 2000;

-- 商品別の販売個数 商品IDを表示
SELECT o.product_id, count(*) AS order_count -- countは、各グループの行数を数える集計関数
FROM orders AS o
INNER JOIN products AS p
  ON o.product_id = p.product_id
GROUP BY o.product_id;
ORDER BY order_count DESC;

-- 商品別の販売個数 商品名を表示
SELECT p.product_name, count(*) AS order_count -- countは、各グループの行数を数える集計関数
FROM orders AS o
INNER JOIN products AS p
  ON o.product_id = p.product_id
GROUP BY p.product_name
ORDER BY order_count DESC;

-- 商品別の販売個数 商品IDと商品名を両方表示
SELECT o.product_id, p.product_name, count(*) AS order_count -- countは、各グループの行数を数える集計関数
FROM orders AS o
INNER JOIN products AS p
  ON o.product_id = p.product_id
GROUP BY o.product_id, p.product_name -- 「商品IDが同じ」且つ「商品名が同じ」行を1つのグループにまとめる
ORDER BY order_count DESC;

-- 商品別の販売個数 商品名と価格を表示
SELECT p.product_name, p.price, count(*) AS order_count -- countは、各グループの行数を数える集計関数
FROM orders AS o
INNER JOIN products AS p
  ON o.product_id = p.product_id
GROUP BY p.product_name, p.price -- 「商品名が同じ」且つ「商品価格が同じ」行を1つのグループにまとめる
ORDER BY order_count DESC;