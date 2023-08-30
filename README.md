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

<!-- string = 可変長の文字列データを格納するためのデータ型
　　　text   = 長いテキストデータを格納するためのデータ型
　　　date   = 日付を表すデータ型
　　　null: false　＝　空の値だと保持されない-->
### Association

- has_many :items
- has_many :orders
## itemsテーブル

| Column             | Type      | Options                        |
| ------------------ | ----------| -------------------------------| 
| name               | string    | null: false                    |
| explanation        | text      | null: false                    |
| category_id        | string    | null: false                    |
| situation_id       | string    | null: false                    |
| load_id            | string    | null: false                    |
| region_id          | string    | null: false                    |
| day_id             | string    | null: false                    |
| price              | string    | null: false                    |
| user               | references| null: false, foreign_key: true |

<!-- 外部キーはreferences -->

### Association

- has_one    :orders
- belongs_to :users


##　　orders　テーブル

| Column             | Type      |  Options                       |
| ------------------ | ------    | ------------------------------ |
| item               | references| null: false, foreign_key: true |
| user               | references| null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
- has_one    :payments

## itemsテーブル

| Column             | Type      | Options                        |
| ------------------ | ----------| -------------------------------| 
| post code          | string    | null: false                    |
| prefectures_id     | string    | null: false                    |
| city               | string    | null: false                    |
| block              | string    | null: false                    |
| building name      | string    |                                |
| telephone number   | string    | null: false                    |
| user               | references| null: false, foreign_key: true |

<!-- 外部キーはreferences -->

### Association

- belongs_to :orders