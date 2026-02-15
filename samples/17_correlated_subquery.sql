SET client_encoding = 'UTF8';
SET lc_messages = 'UTF-8';
SHOW client_encoding;
SHOW lc_messages;

/*
 * 相関サブクエリ
 * 小分けにしたグループ内での比較をするときに使う
 */

CREATE TABLE Product17 (
  id INTEGER GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(32) NOT NULL,
  category VARCHAR(32) NOT NULL,
  price INTEGER NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (id)
);

INSERT INTO Product17 (name, category, price) VALUES
  ('ゼロから作るディープラーニング', 'AI', 1600),
  ('JavaScriptパターン', 'programming', 3500),
  ('Webを支える技術', 'network', 2000),
  ('TCP/IP', 'network', 2300);

/*
 * 価格が、全体の平均値よりも高い商品を選ぶ => サブクエリで可能
 * 商品分類ごとに、価格が平均値よりも高い商品を選ぶ => サブクエリの出番
 *
 * S1, S2という名称は、この例では比較元と比較対象のテーブルが同じなので区別するため
 * この手法のことを「縛る（バインドする）」や「制限する」と言う
 *
 * この手法が上手く行く理由
 * 相関サブクエリはGROUP BY句と同じく「カット」機能を持つ
 * それぞれの商品分類の中で平均価格が計算され、それがProductテーブルの各レコードと比較されるため、
 * レコードに対して実質的に1行しか返していないとみなされる
 */
SELECT category, name, price
  FROM Product17 AS S1
  WHERE price >= (
    SELECT AVG(price)                 -- 3. 1つのcategoryに対する平均なので戻りはスカラ => SQLがエラーにならずに実行される
      FROM Product17 AS S2
      WHERE S1.category = S2.category -- 1. ここで同一のcategoryに縛る
      -- GROUP BY category               -- 2. categoryでグループ化する（全行で縛ったのでcategoryは1つだけ）⇒ 不要でした
  );

DROP TABLE Product17;