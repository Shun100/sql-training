SET client_encoding = 'UTF8';
SET lc_messages = 'UTF-8';
SHOW client_encoding;
SHOW lc_messages;

CREATE TABLE Chars
  (chr CHAR(3) NOT NULL PRIMARY KEY);

BEGIN TRANSACTION; -- rollback
INSERT INTO Chars VALUES
  ('1'),
  ('2'),
  ('3'),
  ('10'),
  ('11'),
  ('222');
COMMIT;

SELECT chr FROM Chars WHERE chr > '2'; -- 3, 222

DROP TABLE Chars;