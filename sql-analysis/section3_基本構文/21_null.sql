SET client_encoding = 'UTF8';
SHOW client_encoding;

CREATE TABLE users (
  user_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name varchar(3) NOT NULL,
  gender char(2),
  age INTEGER,
  pref varchar(3)
);

INSERT INTO users (name, gender, age, pref) VALUES
  ('鈴木', '男性', 25, '埼玉'),
  ('佐藤', '女性', 21, '東京'),
  ('田中', '男性', NULL, '埼玉'),
  ('山田', '男性', NULL, '熊本'),
  ('加藤', '女性', 45, '和歌山'),
  ('伊藤', NULL, 22, '栃木');

-- SELECT * FROM users WHERE age IS NULL;
-- = NULL は全てfalseになる
-- SELECT * FROM users WHERE age = NULL;
-- SELECT * FROM users WHERE gender IS NOT NULL;

SELECT
  user_id,
  gender,
  age
FROM
  users
WHERE
  gender = '男性'
  AND age BETWEEN 20 AND 29
ORDER BY
  age DESC;

DROP TABLE users;