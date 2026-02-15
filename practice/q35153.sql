SET client_encoding = 'UTF8';
SHOW client_encoding;

\x

-- サブクエリの特徴
-- 1. SELECT句で使用する場合
--  1-1. 結果が複数カラムまたは2件以上の場合はエラーになる
-- 2. FROM句で使用する場合
--  2-1. 別名を指定しないとエラーになる
--  2-2. 複数のサブクエリで同じカラム名を取得する際に、SELECT句のカラム名に対象テーブルを明記しないとエラーになる
-- 3. WHERE句で使用する場合
--  3-1. 件数結果に対して適切な演算子を使用しないとエラーになる
--    - 結果が1件以下: =, <, >, <=, >=, <>, !=
--    - 結果が複数件: IN, NOT IN, EXISTS, NOT EXISTS, =ANY, =SOME, <>ANY, <>SOME, =ALL, <>ALL

-- 補足: 演算子について
--  - <>: !=と等価
--  - IN: いずれかと一致
--  - NOT IN: 全てと一致しない
--  - EXISTS: 存在する
--  - NOT EXISTS: 存在しない
--  - ANY, =ANY, =SOME: いずれかと一致 ※ 固定値使用不可
--  - =ALL: 全てと一致
--  - <>ALL: 全てと一致しない

CREATE TABLE zooB (
  name TEXT,
  num INTEGER,
  PRIMARY KEY (name)
);

CREATE TABLE animal (
  name TEXT,
  PRIMARY KEY (name)
);

INSERT INTO zooB VALUES
  ('サル', 22),
  ('コアラ', 2),
  ('キリン', 3),
  ('ライオン', 2);

INSERT INTO animal VALUES
  ('コアラ'),
  ('キリン'),
  ('ライオン'),
  ('チーター'),
  ('イノシシ'),
  ('サル');

-- 1. WHERE句 + サブクエリ

-- zooBテーブルにnameが存在したら、animalテーブルからレコードを取得
SELECT name FROM animal WHERE name IN (SELECT name FROM zooB);
-- -> コアラ, サル, ライオン, キリン

SELECT * FROM animal WHERE name NOT IN (SELECT name FROM zooB);
-- -> チーター, イノシシ

-- 固定値も使用可能
SELECT * FROM animal WHERE name IN ('ゾウ', 'キリン', 'ライオン');
-- -> キリン, ライオン

-- EXIST
-- サブクエリはanimalテーブルとは関係ないzooBテーブルに対しての条件のため、サブクエリがtrueだとanimalテーブルの全レコード取得と等価
SELECT * FROM animal WHERE EXISTS (SELECT * FROM zooB WHERE num = 3);
-- -> コアラ, キリン, ライオン, チーター, イノシシ, サル

-- 非相関サブクエリ (サブクエリとメインクエリで異なるテーブルを参照)
SELECT * FROM animal WHERE NOT EXISTS (SELECT * FROM zooB WHERE num = 3);
-- -> 0 rows

-- 相関サブクエリ (サブクエリとメインクエリで同じテーブルを参照 -> 1レコードずつ評価される)
SELECT * FROM animal WHERE NOT EXISTS (SELECT * FROM zooB WHERE zooB.name = animal.name);
-- -> チーター, イノシシ


-- 2. FROM句 + サブクエリ

-- FROM句でサブクエリを使用する場合は、サブクエリに対してエイリアスをつける必要がある
-- だが、PostgreSQL 16 以降では自動的にエイリアスをつけてくれるので、以下の例はエラーにならない
SELECT * FROM (SELECT name FROM zooB);

-- 本来はこう書くべき
SELECT * FROM (SELECT name FROM zooB) AS tmp;


-- 3. SELECT句 + サブクエリ
-- メインクエリの各レコードのカラムとして値を返す式になる
SELECT (SELECT name FROM zooB WHERE num > 1);

DROP TABLE zooB;
DROP TABLE animal;