SET client_encoding = 'UTF8';
SHOW client_encoding;

CREATE TABLE address (
  id CHAR(4) UNIQUE,
  postnum CHAR(7),
  address VARCHAR
);

CREATE TABLE customer (
  id CHAR(7) PRIMARY KEY,
  name VARCHAR,
  addressid CHAR(4) REFERENCES address(id)
);

INSERT INTO address VALUES('0001', '1111111', '〇〇件××市');
INSERT INTO address(postnum, address) VALUES ('2222222', '〇〇県△市');
INSERT INTO customer VALUES('0000001', '田中一郎', '0001');

-- 外部キーとして参照されているので実行できない（エラー）
-- UPDATE address SET id = '1001' WHERE postnum = '1111111';

-- 外部キーとしてまだ参照されていないので実行できる
UPDATE address SET id = '0002' WHERE postnum = '2222222';

DROP TABLE customer;
DROP TABLE address;