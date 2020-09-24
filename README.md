# README

# アプリケーション概要
- PCゲームを共にプレイする人を募集できます。

# URL
- 後日追記

# 利用方法
- 募集者は投稿ボタンを押して、募集内容とpasswordを記載して投稿します。
- 参加者は連絡先であるIDにコンタクトをとる事でプレイが可能となります。

# 目指した課題解決
- オンラオインゲームでは現在誰かとプレイしたいがSNSの場合登録が必要、ゲームに特化していない掲示板では募集が混在している為、募集投稿又は参加するのに抵抗感を持っている人がいると考えます。
- シンプルかつ手軽に使いやすいサイトを用意する事で、この問題の解決につながる部分があると考えました。

# 洗い出した要件
- 投稿機能
- ゲームタイトルタグ付機能
- 投稿検索機能
- password認証編集機能
- password認証削除機能
- レスポンシブデザイン

# 実装した機能についてのGIFと説明
- 投稿機能実装
募集者は全ての項目を入力して投稿ボタンを押すと、募集が出来ます。
参加者は参加したい投稿の２行目のIDにコンタクトを取ることで参加できます。
https://gyazo.com/2815f0b039ebed715f00705431e343a6
- ゲームタイトルタグ付機能
募集者は投稿にタグを設定することで参加者が投稿を見つけやすくなります。
- 投稿検索機能
募集者は自身の投稿を編集又は削除したい時、ニックネームで投稿を検索する事が可能です。
https://gyazo.com/ad3f9ebca5d71349fa98fe09c07cd54c
- password認証編集機能
投稿の内容を編集するには、設定したpasswordを入力する事が必要です。
https://gyazo.com/89e3ff38248855b3ced09fd38f3587c6
- password認証削除機能
投稿を削除するには、設定したpasswordを入力する事が必要です。
https://gyazo.com/c5e33b92d564c2a6148f665f5ac7b6af
# テーブル設計

## ER図
https://app.diagrams.net/#G1IhZEzLAgK3XS-GZPCKAikXbPY8TlAMS1

## recruits テーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| name            | string     | null: false |
| contact_id      | integer    | null: false |
| player_name     | string     | null: false |
| style_id        | integer    | null: false |
| sex_id          | integer    | null: false |
| text            | string     | null: false |
| password_digest | string     |             |

### Association

- has_many :recruit_tag_relations
- has_many :tags, through: :recruit_tag_relations
- belongs_to_active_hash :plat
- belongs_to_active_hash :style
- belongs_to_active_hash :sex

## recruit_tag_relations テーブル

| Column  | Type       | Options           |
| ------  | ---------- | ----------------- |
| recruit | references | foreign_key: true |
| tags    | references | foreign_key: true |

### Association

- belongs_to :recruit
- belongs_to :tag

## tags テーブル

| Column   | Type   | Options                       |
| -------- | ------ | ----------------------------- |
| tag_name | string | null: false, uniqueness: true |

### Association

- has_many :recruit_tag_relations
- has_many :recruits, through: :recruit_tag_relations

## contact

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |

## style

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |

## sex

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |

# 実装予定の機能
- レスポンシブデザイン

# ローカルでの動作方法
* Ruby version _6.0.0_
* ruby '2.6.5'
* mysql2