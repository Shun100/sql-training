SET client_encoding = 'UTF8';
SET lc_messages = 'UTF-8';
SHOW client_encoding;
SHOW lc_messages;

/*
 * サブクエリ
 * 一言で言えば「使い捨てのビュー（SELECT文）」であり、SELECT文の実行終了後に自動的に削除される
 */

CREATE TABLE Product15 (
  id INTEGER GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(32) NOT NULL,
  category VARCHAR(32) NOT NULL,
  price INTEGER NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (id)
);

INSERT INTO Product15 (name, category, price) VALUES
  ('ゼロから作るディープラーニング', 'AI', 1600),
  ('JavaScriptパターン', 'programming', 3500),
  ('Webを支える技術', 'network', 2000),
  ('TCP/IP', 'network', 2300);

SELECT category, COUNT(*) AS cnt_product FROM Product15 GROUP BY category;

/*
 * 見ての通り、ビュー定義のSELECT文をそのままFROM句に入れているだけ
 * "product_sum"サブクエリは使い捨てであり、ビューのように保存はされずにSELECT文の実行終了後に消える
 */
SELECT category, cnt_product FROM (
  SELECT category, COUNT(*) AS cnt_product FROM Product15 GROUP BY category
) AS product_sum;

DROP TABLE Product15;