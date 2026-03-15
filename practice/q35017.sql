SET client_encoding = 'UTF8';
SHOW client_encoding;

CREATE TABLE sample1 (
  no INTEGER PRIMARY KEY,
  name VARCHAR(10) NOT NULL
);

INSERT INTO sample1 VALUES
  (1, 'Alice'),
  (2, 'Bob');

CREATE TABLE sample2 (tel CHAR(11)) INHERITS (sample1);

-- 子に追加すると、親にも追加される
INSERT INTO sample2 VALUES
  (3, 'Charley', 'xxxyyyyzzzz');

-- 親に追加しても、子には追加されない
INSERT INTO sample1 VALUES
  (4, 'David');

SELECT * FROM sample1;
SELECT * FROM sample2;

-- 親が子に依存するため、先に子を消す必要がある
-- Java等のオブジェクト指向言語では子が親に依存するが、それと逆の考え方なので注意
DROP TABLE sample2;
DROP TABLE sample1;