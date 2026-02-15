SET client_encoding = 'UTF8';
SET lc_messages = 'UTF-8';
SHOW client_encoding;
SHOW lc_messages;

/*
 * トランザクションとは、ひとまとまりで実行されるべき1つ以上の更新処理の集まりのこと
 * トランザクションを使用すればデータ更新処理の確定や取消が管理できるようになる
 * 
 * コマンドの種類
 * COMMIT: 処理の確定、ROLLBACK: 処理の取消
 */

CREATE TABLE Product13 (
  id INTEGER GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(32) NOT NULL,
  cost_price INTEGER NOT NULL,
  selling_price INTEGER NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (id)
);

INSERT INTO Product13 (name, cost_price, selling_price) VALUES
  ('ゼロから作るディープラーニング', 800, 1600),
  ('JavaScriptパターン', 1700, 3500),
  ('Webを支える技術', 1000, 2000);

BEGIN TRANSACTION;
  UPDATE Product13 SET selling_price = 2500 WHERE id = 1;
  UPDATE Product13 SET selling_price = 3200 WHERE id = 2;
COMMIT;

BEGIN TRANSACTION;
  UPDATE Product13 SET selling_price = 3000 WHERE id = 3;
  UPDATE Product13 SET cost_price = 1200 WHERE id = 3;
ROLLBACK;

SELECT * FROM Product13 ORDER BY id;

DROP TABLE Product13;