## アプリケーション名
「デリ・サポ」

## アプリケーション概要
宅配ドライバーが、過去の配達実績時間を確認することができ、配達ルートの効率化と再配達件数の削減をサポートするアプリケーションです。

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