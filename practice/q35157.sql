SET client_encoding = 'UTF8';
SHOW client_encoding;

CREATE TABLE q35157_member (
  no INTEGER,
  name TEXT,
  tel TEXT,
  groupNo INTEGER,
  boss TEXT,
  PRIMARY KEY (no)
);

CREATE TABLE q35157_department (
  groupNo INTEGER,
  groupName TEXT,
  groupTel TEXT,
  boss TEXT,
  PRIMARY KEY (groupNo)
);

INSERT INTO q35157_member VALUES
  (1, '佐藤', '01201234567', 2, '佐々木'),
  (2, '鈴木', '01201234568', 1, '原田'),
  (3, '渡辺', '01201234569', 4, '天野');

INSERT INTO q35157_department VALUES
  (1, '営業部', '01209234567', '原田'),
  (2, '技術部', '01209234569', '田中'),
  (3, '管理部', '01209234566', '岩本');

-- INNER JOINではどちらか片方にしか存在しない情報は結合されない
-- OUTER JOINでは結合され、不足している箇所はNULLで埋められる
SELECT * FROM q35157_member INNER JOIN q35157_department USING (groupNo);
--  groupno | no | name |     tel     |  boss  | groupname |  grouptel   | boss
-- ---------+----+------+-------------+--------+-----------+-------------+------
--        2 |  1 | 佐藤 | 01201234567 | 佐々木 | 技術部    | 01209234569 | 田中
--        1 |  2 | 鈴木 | 01201234568 | 原田   | 営業部    | 01209234567 | 原田

SELECT * FROM q35157_member AS member INNER JOIN q35157_department AS department ON member.groupNo = department.groupNo;
--  no | name |     tel     | groupno |  boss  | groupno | groupname |  grouptel   | boss
-- ----+------+-------------+---------+--------+---------+-----------+-------------+------
--   1 | 佐藤 | 01201234567 |       2 | 佐々木 |       2 | 技術部    | 01209234569 | 田中
--   2 | 鈴木 | 01201234568 |       1 | 原田   |       1 | 営業部    | 01209234567 | 原田

DROP TABLE q35157_member;
DROP TABLE q35157_department;