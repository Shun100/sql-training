SET client_encoding = 'UTF8';
SET lc_messages = 'UTF-8';
SHOW client_encoding;
SHOW lc_messages;

/*
 * JOIN
 * 列方向の結合
 *
 * - 内部結合: INTER JOIN
 * - 外部結合: OUTER JOIN
 */

CREATE TABLE Product20_1 (
  id INTEGER GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(32) NOT NULL,
  category VARCHAR(32) NOT NULL,
  price INTEGER NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (id)
);

INSERT INTO Product20_1 (name, category, price) VALUES
  ('ゼロから作るディープラーニング', 'AI', 1600),
  ('JavaScriptパターン', 'programming', 3500),
  ('Webを支える技術', 'network', 2000),
  ('TCP/IP', 'network', 2300);

CREATE TABLE Product20_2 (
  id INTEGER GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(32) NOT NULL,
  pages INTEGER NOT NULL,
  create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (id)
);

INSERT INTO Product20_2 (name, pages) VALUES
  ('ゼロから作るディープラーニング', 500),
  ('JavaScriptパターン', 243),
  ('Webを支える技術', 256),
  ('TCP/IP', 365);

-- 内部結合 (この例には無いが)どちらか一方のテーブルにしか無いデータは抽出されない
SELECT p1.id, p1.name, p1.price, p2.pages, p1.created_at
  FROM Product20_1 AS p1 INNER JOIN Product20_2 AS p2 -- 結合対象
    ON p1.id = p2.id -- 結合条件
  WHERE category = 'network';

-- 外部結合 (この例には無いが)どちらか一方のテーブルにしか無いデータも抽出される 不足分はNULLで埋められる
-- LEFT: 左側のテーブルをマスタにする RIGHT: 右側のテーブルをマスタにする 機能的な違いは無いのでお好みで
SELECT p1.id, p1.name, p1.price, p2.pages, p1.created_at
  FROM Product20_1 AS p1 LEFT OUTER JOIN Product20_2 AS p2
    ON p1.id = p2.id
  WHERE category = 'network';

DROP TABLE Product20_1;
DROP TABLE Product20_2;