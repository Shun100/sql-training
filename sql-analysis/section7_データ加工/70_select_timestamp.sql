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
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP(0)
);

INSERT INTO users (name, created_at) VALUES
  ('ユーザ1', '2025-11-30 10:00:00'),
  ('ユーザ2', '2025-12-17 10:00:00'),
  ('ユーザ4', '2026-03-15 10:00:00'),
  ('ユーザ5', '2026-03-16 10:00:00'),
  ('ユーザ6', '2026-03-17 10:00:00'),
  ('ユーザ7', '2026-03-18 10:00:00');

-- 過去日のデータを抽出
SELECT
  *
FROM
  users
WHERE
  created_at < CURRENT_TIMESTAMP(0);

-- 特定期間のデータを抽出
SELECT
  *
FROM
  users
WHERE
  created_at BETWEEN '2026-03-17 00:00:00' AND '2026-03-19 00:00:00';

-- 過去3か月以内のデータを抽出
SELECT
  *
FROM
  users
WHERE
  created_at >= CURRENT_TIMESTAMP(0) - '90 days'::INTERVAL;

  -- 以下も全て同じ
  -- created_at >= CURRENT_TIMESTAMP(0) - '3 months'::INTERVAL;
  -- created_at >= CURRENT_TIMESTAMP(0) - INTERVAL '90 days';
  -- created_at >= CURRENT_TIMESTAMP(0) - INTERVAL '3 months';