SET client_encoding = 'UTF8';
SET lc_messages = 'UTF-8';
SHOW client_encoding;
SHOW lc_messages;

/*
 * ビューはSELECT文を記憶しているだけで、データ自体は持たない
 * ビューの上にビューを重ねることはパフォーマンス低下を招くため極力避ける
 * 
 * - 制限事項
 *   - ビュー定義でORDER BYは使えない（テーブル同様にビューにも順序は無いと定められている）
 *   - ビューに対する更新は特定の制約下で可能
 *     - SELECT句にDISTINCTが含まれていない
 *     - FROM句に含まれるテーブルが1つだけ
 *     - GROUP BY句を使用していない
 *     - HAVING句を使用していない
 */

CREATE TABLE Product14 (
  id INTEGER GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(32) NOT NULL,
  category VARCHAR(32) NOT NULL,
  price INTEGER NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (id)
);

INSERT INTO Product14 (name, category, price) VALUES
  ('ゼロから作るディープラーニング', 'AI', 1600),
  ('JavaScriptパターン', 'programming', 3500),
  ('Webを支える技術', 'network', 2000),
  ('TCP/IP', 'network', 2300);

/*
 * VIEWの作成: CREATE VIEW ビュー名 (<ビューの列名1>, <ビューの列名2>, ...) AS <SELECT文>
 */
CREATE VIEW ProductView (category, cnt) AS
  SELECT category, COUNT(*) FROM Product14 GROUP BY category;

SELECT * FROM ProductView;

DROP VIEW ProductView;
DROP TABLE Product14;