SET client_encoding = 'UTF8';
SET lc_messages = 'UTF-8';
SHOW client_encoding;
SHOW lc_messages;

/*
 * スカラ・サブクエリ
 * 必ず1行1列だけの結果を返すサブクエリのこと
 */

CREATE TABLE Product16 (
  id INTEGER GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(32) NOT NULL,
  category VARCHAR(32) NOT NULL,
  price INTEGER NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (id)
);

INSERT INTO Product16 (name, category, price) VALUES
  ('ゼロから作るディープラーニング', 'AI', 1600),
  ('JavaScriptパターン', 'programming', 3500),
  ('Webを支える技術', 'network', 2000),
  ('TCP/IP', 'network', 2300);

/*
 * スカラ・サブクエリを使うケース
 * スカラ・サブクエリの戻り値を =, <> など、スカラ値を入力する比較演算子の入力として利用できる
 * 例として「価格が、全体の平均の価格より高い商品だけを検索する」
 */

/*
 * 「WHERE句に集約関数は書けない」という制約事項があるため、この書き方はエラーになる
 * scholar_subquery.sql:35: ERROR:  aggregate functions are not allowed in WHERE
 */
-- SELECT id, name, price
--   FROM Product16
--   WHERE price > AVG(price);

-- そんなときはスカラ・サブクエリを使う 集約関数の代わりにスカラ・サブクエリのSELECT文を入れればOK
SELECT AVG(price) FROM Product16;
SELECT id, name, price FROM Product16 WHERE price > (SELECT AVG(price) FROM Product16);

-- スカラ・サブクエリはスカラが入り得る箇所ならどこでも書ける
-- SELECT句, GROUP BY句, HAVING句, ORDER BY句 etc...
SELECT id, name, price, (SELECT AVG(price) FROM Product16) AS avg_price FROM Product16;


DROP TABLE Product16;