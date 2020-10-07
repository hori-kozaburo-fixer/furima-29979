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

#usersテーブル
| Column                          |  Type      | Options     |
|---------------------------------|------------|-------------|
| nickname                        | string     | null: false |
| email                           | string     | null: false |
| encrypted_password              | string     | null: false |
| name_first_full_width_character | string     | null: false |
| name_last_full_width_character  | string     | null: false |
| name_first_kana                 | string     | null: false |
| name_last_kana                  | string     | null: false |
| birth_day                       | date       | null: false |

###Association
- has_many :items
- has_many :purchases

#itemsテーブル
| Column           |  Type      | Options                                      |
|------------------|------------|----------------------------------------------|
| name             | string     | null:false                                   |
| text             | text       | null:false                                   |
| category_id      | integer    | null: false, numericality: { other_than: 1 } |
| status_id        | integer    | null: false, numericality: { other_than: 1 } |
| delivery_fee_id  | integer    | null: false, numericality: { other_than: 1 } |
| sender_area_id   | integer    | null: false, numericality: { other_than: 1 } |
| number_of_day_id | integer    | null: false, numericality: { other_than: 1 } |
| money            | integer    | null:false                                   |

###Association
- belongs_to :user
- has_one :purchase
- belongs_to_active_hash :category
- belongs_to_active_hash :status
- belongs_to_active_hash :delivery_fee
- belongs_to_active_hash :sender_area
- belongs_to_active_hash :number_of_day

#purchaseテーブル
| Column     |  Type      | Options                       |
|------------|------------|-------------------------------|
| user       | references | null:false, foreign_key :true |
| item       | references | null:false, foreign_key :true |

###Association
- belongs_to :user
- belongs_to :item
- has_one :address

#addressテーブル
| Column        |  Type   | Options                               |
|---------------|---------|---------------------------------------|
| postal_code   | string  | null:false                            |
| prefecture_id | integer | null: false, numericality: { other:1} |
| municipality  | string  | null:false                            |
| house_number  | string  | null:false                            |
| building_name | string  |                                       |
| tel           | string  | null:false                            |
| purchase      | foreign | null:false,foreign_key :true          |

###Association
- belongs_to :purchase




