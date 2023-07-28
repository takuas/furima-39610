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
| date_of_birth      | data       | null: false                    |

### Association

- has_many   :items
- has_many   :orders

## items テーブル

| column             | type       | options                        |
| ------------------ | ------     | ------------------------------ |
| item_name          | string     | null: false                    |
| description        | text       | null: false                    |
| category           | string     | null: false                    |
| status             | string     | null: false                    |
| delivery_charge    | string     | null: false                    |
| ship_from          | string     | null: false                    |
| days_to_ship       | string     | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- has_one    :orders
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
| prefectures        | string     | null: false                    |
| municipalities     | string     | null: false                    |
| address            | string     | null: false                    |
| building           | string     |                                |
| tel                | varchar    | null: false                    |
| order              | references | null: false, foreign_key: true |

### Association

- belongs_to :order