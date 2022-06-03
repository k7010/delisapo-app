## アプリケーション名
デリサポ

## アプリケーション概要
宅配ドライバーが、過去の配達実績時間を確認することができ、配達ルートの効率化と再配達件数の削減をサポートするアプリケーションです。

## 使用技術
- Ruby ruby 2.6.5
- Ruby on Rails Rails 6.0.5
- RSpec
- MySQL 5.6.51



## URL
https://delisapo-app.herokuapp.com/

## テスト用アカウント
メールアドレス：〇〇
パスワード：pass1234

## 利用方法

## 機能一覧
- ユーザー管理機能
  - ログイン機能
- 持出登録機能
- 

# README

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