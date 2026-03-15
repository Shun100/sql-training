SET client_encoding = 'UTF8';
SHOW client_encoding;

-- 関数
-- 使い方の例: SELECT add_tax(1000);
CREATE OR REPLACE FUNCTION add_tax(price INTEGER)
RETURNS INTEGER AS $$
BEGIN
  RETURN price * 1.1;
END;
$$ LANGUAGE plpgsql;

SELECT add_tax(1000);

-- TRIGGER
-- 例: 商品登録時に自動的に作成日を入れる

-- テーブルを用意
CREATE TABLE item (
  id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR,
  created_at TIMESTAMP
);

-- トリガー内で実行する関数を定義
-- 「NEW」はトリガー関数内でだけ使える特別なレコード変数であり、「これからテーブルに保存される行」を表す
CREATE OR REPLACE FUNCTION set_created_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.created_at := NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- トリガーを定義
CREATE TRIGGER trigger_set_created_at
BEFORE INSERT ON item
FOR EACH ROW
EXECUTE FUNCTION set_created_at();


INSERT INTO item (name) VALUES ('りんご');
SELECT * FROM item;

DROP TRIGGER trigger_set_created_at on item;
DROP FUNCTION set_created_at;
DROP TABLE item;