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
| category_id        | integer   | null: false                    |
| situation_id       | integer   | null: false                    |
| load_id            | integer   | null: false                    |
| region_id          | integer   | null: false                    |
| shipping_id        | integer   | null: false                    |
| price              | integer   | null: false                    |
| user               | references| null: false, foreign_key: true |

<!-- 外部キーはreferences -->
<!-- | price | integer | ⇨ 　値として数字が（価格）が入ることを想定されるため-->
<!-- Activehash　のカラムの方は全てinteger型に修正 -->
<!-- dayという単語は予約語になりますので、別のカラム名へ修正
（Activehashはカラム名の_idを取り除いた名前でモデルを作成するため) -->
### Association

- has_one    :order
- belongs_to :user
<!-- has_one や　belongs_toの後は単数系-->


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
| post code          | string    | null: false                    |
| region_id          | integer   | null: false                    |
| city               | string    | null: false                    |
| block              | string    | null: false                    |
| building name      | string    |                                |
| telephone number   | string    | null: false                    |
| user               | references| null: false, foreign_key: true |

<!-- 外部キーはreferences -->
<!-- 都道府県を保存するカラムでは、商品出品テーブルで使用したactive_hashのデータを兼用できます。
itemsテーブルで設定した発送先住所のカラム名と同じカラムとなるよう統一 -->
### Association

- belongs_to :order