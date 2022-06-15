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

![sign-up](https://user-images.githubusercontent.com/103634772/173171108-2edd45b3-7a37-4585-a5c6-ff74a097ece8.gif)
![signin](https://user-images.githubusercontent.com/103634772/173171115-bb986367-9c8a-4aa6-b62d-3668b8829a82.gif)


- 荷物管理
  - 持出登録機能  
  積込む荷物の情報を登録できます。  
  住所・氏名・配達指定時間を入力します。

![baggage](https://user-images.githubusercontent.com/103634772/173171129-6e8d770f-3a18-4d6c-a53d-2862541e105e.gif)

- 荷物管理
  - 持出一覧機能  
  積込んだ荷物の情報が表示されます。  
  荷物情報ごとに詳細ページへ遷移できます。  
  配達が完了した荷物情報には「完了」の表示がされます。  

![index](https://user-images.githubusercontent.com/103634772/173171130-977427b9-f19f-4f9e-9cf5-3d1b55895f21.gif)

- 荷物管理
  - 詳細機能
  - 削除機能

![show-delete](https://user-images.githubusercontent.com/103634772/173171133-4b5fe4e5-a542-48c6-a7af-1aceb93f12fc.gif)

- 配達管理
  - 配達実績登録機能

![delivery](https://user-images.githubusercontent.com/103634772/173171138-dfc240f1-5ee9-42ef-a0b5-bff2d9a01423.gif)

- 検索機能
  - 配達実績参照機能

![search](https://user-images.githubusercontent.com/103634772/173171149-08a3c54f-c18e-4c97-bd73-4aec24a26f59.gif)

## テスト
- RSpec
  - 単体テスト
  - 結合テスト

## URL
https://delisapo-app.herokuapp.com/

## 利用方法
「配達実績を調べる」の検索フォームで、配達完了実績が閲覧できます。（他ユーザーが登録した配達完了データも含む）  
配達完了時間の情報を基に効率良く配達ルートの組み立てることができます。  
検索例：苗字の検索フォームに「田中」または「山田」と入力して下さい。  
持出荷物の登録、配達実績の登録、持出荷物の削除は、テストアカウントからログイン後に実行可能です。
ログイン後に登録された配達完了実績は、検索結果に反映されます。

## テスト用アカウント
メールアドレス：test@mail  
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