SET client_encoding = 'UTF8';
SET lc_messages = 'UTF-8';
SHOW client_encoding;
SHOW lc_messages;

CREATE TABLE Product10_1 (
  id INTEGER GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(32) NOT NULL,
  price INTEGER NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (id)
);

CREATE TABLE Product10_2 (
  id INTEGER GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(32) NOT NULL,
  price INTEGER NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (id)
);

INSERT INTO Product10_1 (name, price) VALUES
  ('ゼロから作るディープラーニング', 1600),
  ('JavaScriptパターン', 3500),
  ('Webを支える技術', 2000);

INSERT INTO Product10_2 (name, price, created_at)
  SELECT name, price, created_at FROM Product10_1;

SELECT * FROM Product10_2;

DROP TABLE Product10_1;
DROP TABLE Product10_2;