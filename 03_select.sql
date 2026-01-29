SET client_encoding = 'UTF8';
SHOW client_encoding;

CREATE TABLE PRODUCT_03 (
  id INTEGER GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(12) NOT NULL,
  category VARCHAR(12) NOT NULL,
  price INTEGER NOT NULL,
  created_at TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
);

INSERT INTO PRODUCT_03 (name, category, price) VALUES
  ('product01', 'book', 1500),
  ('product02', 'food', 300),
  ('product03', 'toy', 7000),
  ('product04', 'book', 1600),
  ('product05', 'book', 800);

SELECT * FROM PRODUCT_03;

SELECT DISTINCT category FROM PRODUCT_03;

SELECT name, price FROM PRODUCT_03 WHERE (price < 1000 AND category = 'book');

DROP TABLE PRODUCT_03;
