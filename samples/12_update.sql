SET client_encoding = 'UTF8';
SET lc_messages = 'UTF-8';
SHOW client_encoding;
SHOW lc_messages;

CREATE TABLE Product12 (
  id INTEGER GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(32) NOT NULL,
  price INTEGER NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (id)
);

INSERT INTO Product12 (name, price) VALUES
  ('ゼロから作るディープラーニング', 1600),
  ('JavaScriptパターン', 3500),
  ('Webを支える技術', 2000);

-- 全レコード更新: UPDATE <テーブル名> SET <列名> = <式>;
UPDATE Product12 SET created_at = '2020-02-01 10:00:00';

-- 指定したレコードだけ更新: UPDATE <テーブル名> SET <列名> = <式> WHERE <条件>;
UPDATE Product12 SET name = 'TypeScriptパターン' WHERE id = 2;

-- 複数カラム同時更新も可能
UPDATE Product12 SET price = price * 2, created_at = '2025-03-01 11:11:11' WHERE id = 3;

SELECT * FROM Product12 ORDER BY id;

DROP TABLE Product12;