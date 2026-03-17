-- 文字列の結合

SET client_encoding = 'UTF8';

DROP TABLE IF EXISTS users CASCADE;

-- ||演算子 もしくは concat関数を使用する
SELECT 'Hello' || ' ' || 'World';
SELECT concat('Hello', ' ', 'World');