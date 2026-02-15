SET client_encoding = 'UTF8';
SHOW client_encoding;

\x

CREATE TABLE zooA (
  name VARCHAR PRIMARY KEY,
  num INTEGER NOT NULL
);

CREATE TABLE animal (
  name VARCHAR PRIMARY KEY
);

INSERT INTO zooA (name, num) VALUES
  ('パンダ', 1),
  ('ライオン', 2),
  ('ゾウ', 3),
  ('サル', 15);

INSERT INTO animal (name) VALUES
  ('コアラ'),
  ('キリン'),
  ('ライオン'),
  ('チーター'),
  ('イノシシ'),
  ('サル');

-- サブクエリの中は非相関クエリなので、メインクエリでは1レコードずつ照合するのではなく、テーブル全体で1回判定するだけ
-- サブクエリの中がtrue -> NOT EXISTSなのでfalse -> メインクエリでは0件になる
SELECT * FROM animal WHERE NOT EXISTS (SELECT name FROM zooA WHERE num = 15);

-- サブクエリの中は相関クエリなので、メインクエリでは1レコードずつ照合する
SELECT * FROM animal WHERE NOT EXISTS (SELECT name FROM zooA WHERE animal.name = zooA.name AND num = 15);
-- エイリアスを使うとこう書ける
SELECT * FROM animal a WHERE NOT EXISTS (SELECT name FROM zooA z WHERE a.name = z.name AND z.num = 15);

DROP TABLE zooA;
DROP TABLE animal;