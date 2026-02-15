SET client_encoding = 'UTF8';
SHOW client_encoding;

CREATE TABLE q35308_member (
  no INTEGER,
  name TEXT,
  tel TEXT,
  groupNo INTEGER,
  PRIMARY KEY (no)
);

CREATE TABLE q35308_department (
  groupNo INTEGER,
  groupName TEXT,
  boss TEXT,
  tel TEXT,
  PRIMARY KEY (groupNo)
);

INSERT INTO q35308_member VALUES
  (1, '石川', '01201234567', 2),
  (2, '鈴木', '01291234568', 3),
  (3, '児玉', '01201234569', 2);

INSERT INTO q35308_department VALUES
  (1, '人事部', '蜂屋', '01201234561'),
  (2, '総務部', '石川', '01201234567');

-- CROSS JOIN: 全ての組み合わせについて結合する
SELECT * FROM q35308_member CROSS JOIN q35308_department;
--  no | name |     tel     | groupno | groupno | groupname | boss |     tel
-- ----+------+-------------+---------+---------+-----------+------+-------------
--   1 | 石川 | 01201234567 |       2 |       1 | 人事部    | 蜂屋 | 01201234561
--   1 | 石川 | 01201234567 |       2 |       2 | 総務部    | 石川 | 01201234567
--   2 | 鈴木 | 01291234568 |       3 |       1 | 人事部    | 蜂屋 | 01201234561
--   2 | 鈴木 | 01291234568 |       3 |       2 | 総務部    | 石川 | 01201234567
--   3 | 児玉 | 01201234569 |       2 |       1 | 人事部    | 蜂屋 | 01201234561
--   3 | 児玉 | 01201234569 |       2 |       2 | 総務部    | 石川 | 01201234567

DROP TABLE q35308_member;
DROP TABLE q35308_department;