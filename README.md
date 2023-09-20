# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | -------------------------|
| email              | string | null: false, unique true |
| nickname           | string | null: false              |
| encrypted_password | string | null: false              |
| family_name        | string | null: false              |
| first_name         | string | null: false              |
| family_name_kana   | string | null: false              |
| first_name_kana    | string | null: false              |
| birth_day          | date   | null: false              |


### Association

- has_many :items
- has_many :orders
## itemsテーブル

| Column             | Type      | Options                        |
| ------------------ | ----------| -------------------------------| 
| name               | string    | null: false                    |
| explanation        | text      | null: false                    |
| category_id        | integer   | null: false                    |
| situation_id       | integer   | null: false                    |
| load_id            | integer   | null: false                    |
| region_id          | integer   | null: false                    |
| shipping_id        | integer   | null: false                    |
| price              | integer   | null: false                    |
| user               | references| null: false, foreign_key: true |


### Association

- has_one    :order
- belongs_to :user



##　　orders　テーブル

| Column             | Type      |  Options                       |
| ------------------ | ------    | ------------------------------ |
| item               | references| null: false, foreign_key: true |
| user               | references| null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :payment

## paymentsテーブル

| Column             | Type      | Options                        |
| ------------------ | ----------| -------------------------------| 
| post_code          | string    | null: false                    |
| region_id          | integer   | null: false                    |
| city               | string    | null: false                    |
| block              | string    | null: false                    |
| building_name      | string    |                                |
| telephone_number   | string    | null: false                    |
| order              | references| null: false, foreign_key: true |

### Association

- belongs_to :order