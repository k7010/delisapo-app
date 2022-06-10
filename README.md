## アプリケーション名
デリサポ

## アプリケーション概要
宅配ドライバーが、過去の配達実績時間を検索することができ、配達ルートの効率化と再配達件数の削減をサポートするアプリケーションです。

## 使用技術
- Ruby ruby 2.6.5
- Ruby on Rails Rails 6.0.5
- RSpec
- MySQL 5.6.51

## 機能一覧
- ユーザー管理
  - 新規登録機能
  - ログイン機能
- 荷物管理
  - 持出登録機能
  - 持出一覧機能
  - 詳細機能
  - 削除機能
- 配達管理
  - 配達実績登録機能
- 検索機能

https://qiita.com/00__/items/e3e3e44394ef85e8fecf

## テスト
- RSpec
  - 単体テスト
  - 結合テスト

## URL
https://delisapo-app.herokuapp.com/

## 利用方法
検索結果に他ユーザーが登録した配達実績も表示され、その実績時間を基に配達ルートの組み立てることができます。  
持出荷物の登録、配達実績の登録、持出荷物の削除は、テストアカウントからログイン後に実行可能です。

## テスト用アカウント
メールアドレス：〇〇  
パスワード：pass1234


# user
| column              | Type    | options                    |
| ------------------- | ------- | -------------------------- |
| staff_number        | integer | null: false, unique: true  |
| encrypted_password  | string  | null: false                |
# association
- has_many :baggages
- has_many :deliveries


# baggage
| column      | Type        | options                         |
| ----------- | ----------- | ------------------------------- |
| address     | string      | null, false                     |
| building    | string      |                                 |
| block       | integer     | null, false                     |
| family_name | string      | null, false                     |
| first_name  | string      | null, false                     |
| user        | references  | null, false, foreign_key, true  |
# association
- belongs_to :user
- belongs_to :address
- has_one :delivery

# delivery
| column        | Type        | options                         |
| ------------- | ----------- | ------------------------------- |
| user          | references  | null, false, foreign_key: true  |
| baggage       | references  | null, false, foreign_key: true  |
| complete_time | time        | null, false                     |
# association
- belongs_to :user
- belongs_to :baggage