-- TIMESTAMP型: タイムゾーンの情報を保持する
  -- PostgreSQLでは、TIMESTAMPTZ型
-- DATETIME型: タイムゾーンの情報を保持しない
  -- PostgreSQLでは、TIMESTAMP型
-- DATE型: 日付のみ
-- TIME型: 時刻のみ

SET client_encoding = 'UTF8';

DROP TABLE IF EXISTS users CASCADE;

CREATE TABLE users (
  id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name CHAR(4) NOT NULL,
  created_at TIMESTAMPTZ DEFAULT now()
);

INSERT INTO users (name, created_at) VALUES
  ('ユーザ1', now()),                           -- セッションのタイムゾーン
  ('ユーザ2', now() AT TIME ZONE '+09'),        -- UTC+9
  ('ユーザ3', now() AT TIME ZONE 'UTC'),        -- UTC
  ('ユーザ4', now() AT TIME ZONE 'Asia/Tokyo'); -- 東京タイムゾーン

SELECT * FROM users;