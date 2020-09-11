# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# テーブル設計

## recruits テーブル

| Column      | Type       | Options     |
| ----------- | ---------- | ----------- |
| name        | string     | null: false |
| contact_id  | integer    | null: false |
| player_name | string     | null: false |
| style_id    | integer    | null: false |
| sex_id      | integer    | null: false |
| text        | string     | null: false |
| edit_pass   | string     | null: false |

### Association

- has_many :recruit_tag_relations
- has_many :tags, through: :recruit_tag_relations
- belongs_to_active_hash :plat
- belongs_to_active_hash :style
- belongs_to_active_hash :sex

## recruit_tag_relations テーブル

| Column  | Type       | Options                        |
| ------  | ---------- | ------------------------------ |
| recruit | references | null: false, foreign_key: true |
| tags    | references | null: false, foreign_key: true |

### Association

- belongs_to :recruit
- belongs_to :tag

## tags テーブル
| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

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
