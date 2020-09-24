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
- ゲームタイトルのタグ付機能
- password認証編集機能
- password認証削除機能
- 投稿の検索機能

# 実装した機能についてのGIFと説明	実装した機能について、それぞれどのような特徴があるのか列挙しましょう。GIFを添えることで、イメージがしやすくなります。

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

# 実装予定の機能	洗い出した要件の中から、今後実装予定のものがあれば記述しましょう。
# ローカルでの動作方法	git cloneしてから、ローカルで動作をさせるまでに必要なコマンドを記述しましょう。この時、アプリケーション開発に使用した環境を併記することを忘れないでください（パッケージやRubyのバージョンなど）。
* Ruby version 6.0.0