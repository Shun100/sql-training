SET client_encoding = 'UTF8';
SET lc_messages = 'UTF-8';
SHOW client_encoding;
SHOW lc_messages;

CREATE TABLE Product11 (
  id INTEGER GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(32) NOT NULL,
  price INTEGER NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (id)
);

INSERT INTO Product11 (name, price) VALUES
  ('ゼロから作るディープラーニング', 1600),
  ('JavaScriptパターン', 3500),
  ('Webを支える技術', 2000);

-- DELETE FROM <テーブル名>: 全レコード削除
-- DELETE FROM Product11;

-- TRNCATE FROM <テーブル名>: 全レコード削除
/*
 * DELETE:   処理速度は遅い 指定したレコードだけ削除可能
 * TRANCATE: 処理速度は速い 指定したレコードだけの削除は不可（常に全レコードを消す）
 */
TRUNCATE FROM Product11;

-- DELETE + WHERE
DELETE FROM Product11 WHERE id = 1;

SELECT * FROM Product11;

DROP TABLE Product11;