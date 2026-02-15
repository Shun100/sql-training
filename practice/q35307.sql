SET client_encoding = 'UTF8';
SHOW client_encoding;

CREATE TABLE department (
  groupNo INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  groupName VARCHAR NOT NULL,
  boss VARCHAR,
  tel VARCHAR NOT NULL
);

CREATE TABLE member (
  no INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR NOT NULL,
  tel VARCHAR NOT NULL,
  groupNo INTEGER NOT NULL
);

INSERT INTO department (groupName, boss, tel) VALUES
  ('人事部', '蜂屋', 'xxxx'),
  ('総務部', '石川', 'yyyy');

INSERT INTO member (name, tel, groupNo) VALUES
  ('石川', 'yyyy', 2),
  ('鈴木', 'aaaa', 3),
  ('児玉', 'bbbb', 2);

SELECT * FROM department;
SELECT * FROM member;

-- テーブルを複数記述すると、CROSS JOINされる
SELECT * FROM member, department;

DROP TABLE member;
DROP TABLE department;