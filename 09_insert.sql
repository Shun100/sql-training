SET client_encoding = 'UTF8';
SET lc_messages = 'UTF-8';
SHOW client_encoding;
SHOW lc_messages;

CREATE TABLE Product09 (
  id INTEGER GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(32) NOT NULL,
  price INTEGER NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (id)
);

/**
 * 構文
 * INSERT INTO <テーブル名> (列1, 列2, 列3, ...) VALUES (値1, 値2, 値3, ...);
 */
INSERT INTO Product09 (name, price) VALUES
  ('ゼロから作る Deep Learning', 2300),
  ('ネットワークはなぜつながるのか', 1500),
  ('Clean Architecture', 4000);

SELECT * FROM Product09;

DROP TABLE Product09;