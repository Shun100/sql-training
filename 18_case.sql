SET client_encoding = 'UTF8';
SET lc_messages = 'UTF-8';
SHOW client_encoding;
SHOW lc_messages;

/*
 * - CASE式: 条件分岐
 */

CREATE TABLE Product18 (
  id INTEGER GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(32) NOT NULL,
  category VARCHAR(32) NOT NULL,
  price INTEGER NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (id)
);

INSERT INTO Product18 (name, category, price) VALUES
  ('ゼロから作るディープラーニング', 'AI', 1600),
  ('JavaScriptパターン', 'programming', 3500),
  ('Webを支える技術', 'network', 2000),
  ('TCP/IP', 'network', 2300);

/*
 * 構文
 * CASE WHEN <評価式> THEN <式>
 *      WHEN <評価式> THEN <式>
 *      ...
 *      ELSE <式>
 * END
 */

UPDATE Product18 SET category = 
  CASE
    WHEN category = 'network' THEN 'A: network'
    WHEN category = 'AI' THEN 'B: AI'
    WHEN category = 'programming' THEN 'C: programming'
    ELSE category
  END;

SELECT * FROM Product18;

DROP TABLE Product18;