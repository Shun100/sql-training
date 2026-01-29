# SQL勉強用

## 実行方法
- `C:\ForDevelop\PostgreSQL\bin\psql.exe -U postgres -f hoge.sql`

## パスワード認証のスキップ方法
- `.pgpass`を使う方法（業務向け）
  - `pgpass.conf`を以下のパスに新規作成
    - `C:\Users\＜Windowsユーザー名＞\AppData\Roaming\postgresql\pgpass.conf`
  - 中身を書く
    - `hostname:port:database:username:password`

- `pg_hba.conf`を使う方法（ローカル開発限定）
  - `pg_hba.conf`を編集
    - `C:\Program Files\PostgreSQL\<バージョン>\data\pg_hba.conf`
  - `IPv4 local connections`を`trust`に変更
    - `host    all     all     127.0.0.1/32    trust`
  - PostgreSQLを再起動
    - `pg_ctl reload`

## トラブルシューティング
  - ターミナルの文字コード変更
    - `chcp 65001`
  - PostgreSQLを再起動
    - PowerShellを管理者権限で起動
    - `net stop postgresql-x64-16`
    - `net start postgresql-x64-16`