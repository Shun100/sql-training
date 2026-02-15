SET client_encoding = 'UTF8';
SET lc_messages = 'UTF-8';
SHOW client_encoding;
SHOW lc_messages;

/*
 * UNION
 * 行方向の結合
 */

CREATE TABLE Product19_1 (
  id INTEGER GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(32) NOT NULL,
  category VARCHAR(32) NOT NULL,
  price INTEGER NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (id)
);

INSERT INTO Product19_1 (name, category, price) VALUES
  ('ゼロから作るディープラーニング', 'AI', 1600),
  ('JavaScriptパターン', 'programming', 3500),
  ('Webを支える技術', 'network', 2000),
  ('TCP/IP', 'network', 2300);

CREATE TABLE Product19_2 (
  id INTEGER GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(32) NOT NULL,
  category VARCHAR(32) NOT NULL,
  price INTEGER NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (id)
);

INSERT INTO Product19_2 (name, category, price) VALUES
  ('安全なWebアプリケーションの作り方', 'security', 3800),
  ('達人に学ぶDB設計指南書', 'database', 3500),
  ('Clean Architecture', 'architecture', 2000),
  ('Java 入門', 'programming', 4000),
  ('Spring Boot 実力強化指南書', 'programming', 4500);

SELECT id, name, price
  FROM Product19_1
UNION
SELECT id, name, price
  FROM Product19_2
ORDER BY id;

DROP TABLE Product19_1;
DROP TABLE Product19_2;