-- 文字列の分割

SET client_encoding = 'UTF8';

SELECT
  split_part('田中 太郎', ' ', 1) AS last_name,
  split_part('田中 太郎', ' ', 2) AS first_name;
