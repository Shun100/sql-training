SET client_encoding = 'UTF8';
SHOW client_encoding;

-- インデックスを作成する書式
-- CREATE INDEX インデックス名 ON テーブル名 [USING インデックス種別] (カラム名[, カラム名...])

-- 補足: インデックスの種類
--  - B-tree(Default): デフォルトのインデックス種別 ほとんどのケースではこれを使えばOK
--  - Hash: 等価検索(=)専用のインデックス 範囲検索はできない
--  - GIN: 1つのカラムに複数の値が含まれる場合に強い
--    - 配列, JSON等
--  - GiST: 2次元以上の空間に対する検索に強い

CREATE TABLE q35290 (
  id INTEGER,
  name TEXT,
  groupName TEXT,
  PRIMARY KEY (id)
);

INSERT INTO q35290 (id, name, groupName) VALUES
  (1, 'Alice', 'Hoge'),
  (2, 'Bob', 'Hoge'),
  (3, 'Charley', 'Foo');

-- インデックスの作成
CREATE INDEX idx ON q35290(id, groupName);

SELECT indexname, indexdef FROM pg_indexes WHERE tablename = 'q35290';

DROP TABLE q35290;