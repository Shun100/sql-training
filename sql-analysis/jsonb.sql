SET client_encoding = 'UTF8';

DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id INTEGER GENERATED ALWAYS AS IDENTITY,
  name VARCHAR NOT NULL,
  profile JSONB NOT NULL
);

-- 1. データ投入
INSERT INTO users (name, profile) VALUES
  ('Alice', '{"age": 25, "hobbies": ["reading", "gaming"], "address": {"city": "Tokyo"}}'),
  ('Bob', '{"age": 30, "hobbies": ["sports"], "address": {"city": "Osaka"}}'),
  ('Charlie', '{"age": 35, "hobbies": ["gaming", "travel"], "address": {"city": "Tokyo"}}');

-- 2. データの取得
-- ・カラム名->キー名: 指定したキーの情報を「JSON型のまま」取得
-- ・カラム名-->キー名: 指定したキーの情報を「テキスト型で」取得
SELECT name, profile->'age' AS age FROM users;
SELECT name, profile->>'age' AS age FROM users;

-- INTEGERで取得したければ、テキスト型で取得した後にキャストする
SELECT name, CAST(profile->>'age' AS INTEGER) AS age FROM users;
SELECT name, (profile->>'age')::INTEGER AS age FROM users;

-- 3. 条件検索
SELECT * FROM users WHERE (profile->>'age')::int > 28;

-- ネストした値の検索
SELECT * FROM users WHERE profile->'address'->>'city' = 'Tokyo';

-- 配列を扱う
-- ・?演算子: JSONBの中に特定のキーや要素が「存在するか」チェックする（単一条件）
-- ・@>演算子: JSONBの中に特定のキーや要素が「存在するか」チェックする（複数条件）
SELECT * FROM users WHERE profile->'hobbies' ? 'gaming';
SELECT * FROM users WHERE profile->'hobbies' @> '["gaming", "travel"]';

-- 複合条件検索
SELECT
  *
FROM
  users
WHERE
  profile->'hobbies' ? 'gaming'
  AND profile->'address'->>'city' = 'Tokyo';

-- 4. 更新
UPDATE
  users
SET
  profile = jsonb_set(profile, '{age}', '26')
WHERE name = 'Alice';

-- ネストした値の更新
UPDATE
  users
SET
  profile = jsonb_set(profile, '{address,city}', '"Kyoto"')
WHERE
  name = 'Alice';

-- キーの追加
UPDATE
  users
SET
  profile = profile || '{"email": "alice@example.com"}'
WHERE
  name = 'Alice';

SELECT * FROM users;

-- 5. インデックスの使用
-- JSONBを使うならインデックスはほぼ必須
-- インデックスを作成すると @> や ? が高速化される
CREATE INDEX idx_user_profile ON users USING GIN (profile);