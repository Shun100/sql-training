SET client_encoding = 'UTF8';
SET lc_messages = 'UTF-8';
SHOW client_encoding;
SHOW lc_messages;

CREATE TABLE Product00 (
  id INTEGER GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(32) NOT NULL,
  category VARCHAR(32) NOT NULL,
  price INTEGER NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (id)
);

INSERT INTO Product00 (name, category, price) VALUES
  ('ゼロから作るディープラーニング', 'AI', 1600),
  ('JavaScriptパターン', 'programming', 3500),
  ('Webを支える技術', 'network', 2000),
  ('TCP/IP', 'network', 2300);

UPDATE Product00 SET created_at = '2020-09-20 10:00:00' WHERE id = 1 OR id = 2;

SELECT * FROM Product00 ORDER BY id;

/*
 * 以下の条件でSELECTする
 * - 価格が2000円以上
 * - 登録日が2020年9月20日 10:00:00
 */
SELECT id, name, price, created_at FROM Product00
  WHERE price >= 1000 AND created_at = '2020-09-20 10:00:00';

/*
 * categoryごとの平均
 */
SELECT category, AVG(price) as avg FROM Product00
  GROUP BY category;

/*
 * categoryごとの平均のカラムが追加されたviewを作る
 */
CREATE VIEW ProductView (id, name, price, avg, created_at) AS
  SELECT
    id,
    name,
    price, (
      SELECT AVG(price)                 -- 挿入したい値
        FROM Product00 p2
        WHERE p2.category = p1.category -- 縛る
    ) AS avg,
    created_at
  FROM Product00 p1;
SELECT * FROM ProductView;

-- 価格帯ごとの品数 これは何度もDBにアクセスするので遅い JOINを使えば高速化できるらしい
CREATE VIEW ProductCntView (low_price, mid_price, high_price) AS
  SELECT
    (SELECT COUNT(*) FROM Product00 WHERE price <= 1000),
    (SELECT COUNT(*) FROM Product00 WHERE price > 1000 AND price <= 3000),
    (SELECT COUNT(*) FROM Product00 WHERE price > 3000);
SELECT * FROM ProductCntView;

DROP VIEW ProductView;
DROP VIEW ProductCntView;
DROP TABLE Product00;