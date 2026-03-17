-- 期間ごとに集計する方法は、date_trunc関数(日時の切り捨て)を使う
-- 年単位: date_trunc('year', ts);
-- 月単位: date_trunc('month', ts);
-- 日単位: date_trunc('day', ts);
-- 時間単位: date_trunc('hour', ts);
-- 分単位: date_trunc('minute', ts);

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

-- 月ごとに集計
SELECT
  date_trunc('month', created_at) AS month,
  count(*) AS new_users
FROM
  users
GROUP BY month
ORDER BY month;

-- 月ごとの集計 (月のカラムの表記を変更)
SELECT
  to_char(date_trunc('month', created_at), 'YYYY-MM-DD')
  || ' ~ ' ||
  to_char(
    date_trunc('month', created_at) + INTERVAL '1 month' - INTERVAL '1 day',
    'YYYY-MM-DD'
  ) AS month,
  count(*) AS new_users
FROM users
GROUP BY date_trunc('month', created_at)
ORDER BY date_trunc('month', created_at);