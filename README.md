# テーブル設計

## users テーブル

| column             | type       | options                        |
| ------------------ | ---------- | ------------------------------ |
| nickname           | string     | null: false                    |
| email              | string     | null: false, unique: true      |
| encrypted_password | string     | null: false                    |
| last_name          | string     | null: false                    |
| first_name         | string     | null: false                    |
| kana_last_name     | string     | null: false                    |
| kana_first_name    | string     | null: false                    |
| date_of_birth      | date       | null: false                    |

### Association

- has_many   :items
- has_many   :orders

## items テーブル

| column             | type       | options                        |
| ------------------ | ------     | ------------------------------ |
| item_name          | string     | null: false                    |
| description        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| status_id          | integer    | null: false                    |
| delivery_charge_id | integer    | null: false                    |
| ship_from_id       | integer    | null: false                    |
| days_to_ship_id    | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- has_one    :order
- belongs_to :user

## orders テーブル

| column             | type       | options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association

- has_one    :sending_address
- belongs_to :user
- belongs_to :item

## sending_address テーブル

| column             | type       | options                        |
| ------------------ | ---------- | ------------------------------ |
| postal             | string     | null: false                    |
| ship_from_id       | integer    | null: false                    |
| municipalities     | string     | null: false                    |
| address            | string     | null: false                    |
| building           | string     |                                |
| tel                | string     | null: false                    |
| order              | references | null: false, foreign_key: true |

### Association

- belongs_to :order