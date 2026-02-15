SET client_encoding = 'UTF8';
SHOW client_encoding;

CREATE TABLE company (
  id INTEGER PRIMARY KEY,
  compayName VARCHAR UNIQUE NOT NULL
);

-- 各カラムの定義と合わせて制約を記述する方法
CREATE TABLE item (
  id INTEGER PRIMARY KEY,
  itemName VARCHAR UNIQUE NOT NULL,
  itemPrice INTEGER NOT NULL,
  companyId INTEGER REFERENCES company(id),
  createdAt DATE DEFAULT CURRENT_DATE CHECK (createdAt > '2026-02-11')
);

-- カラムを定義し終わった後に一気に記述する方法
CREATE TABLE item2 (
  id INTEGER,
  itemName VARCHAR NOT NULL,
  itemPrice INTEGER NOT NULL,
  companyId INTEGER,
  createdAt DATE DEFAULT CURRENT_DATE,
  -- ここから制約
  PRIMARY KEY (id),
  UNIQUE (itemName),
  FOREIGN KEY (companyId) REFERENCES company(id),
  CHECK (createdAt > '2026-02-11')
);

-- itemテーブルからcompanyテーブルを参照しているため、先にcompanyテーブルだけ消すことはできない
DROP TABLE item;
DROP TABLE item2;
DROP TABLE company;
