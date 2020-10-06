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
| Column                    |  Type      | Options                         |
|---------------------------|------------|---------------------------------|
| nickname                  | string     | null:false                      |
| mail                      | string     | null:false                      |
| password                  | string     | null:false                      |
| name_full_width_character | string     | null:false                      |
| name_kana                 | string     | null:false                      |
| birth_day_id              | integer    | numericality: { other_than: 1 } |

###Association
- has_many :items
- has_many :purchases
- belongs_to_active_hash :birth_day

#itemsテーブル
| Column           |  Type      | Options                         |
|------------------|------------|---------------------------------|
| image            | integer    | null:false                      |
| name             | string     | null:false                      |
| text             | text       | null:false                      |
| category_id      | integer    | numericality: { other_than: 1 } |
| status_id        | integer    | numericality: { other_than: 1 } |
| delivery_fee_id  | integer    | numericality: { other_than: 1 } |
| sender_area_id   | integer    | numericality: { other_than: 1 } |
| number_of_day_id | integer    | numericality: { other_than: 1 } |
| money            | integer    | null:false                      |
| user_id          | references | null:false, foreign_key: true   |

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
| token      | string     | null:false                    |
| address_id | integer    | numericality: { other:1}      |
| user_id    | references | null:false, foreign_key :true |
| item_id    | references | null:false, foreign_key :true |

###Association
- belongs_to :user
- belongs_to :item
- has_one :address

#addressテーブル
| Column        |  Type   | Options                  |
|---------------|---------|--------------------------|
| postal_code   | string  | null:false               |
| prefecture_id | integer | numericality: { other:1} |
| municipality  | string  | null:false               |
| house_number  | string  | null:false               |
| building_name | string  |                          |
| tel           | integer | null:false               |

###Association
- belongs_to :purchase



#birth_dayテーブル
| Column | Type    | Option     |
|--------|---------|------------|
| year   | integer | null:false |
| month  | integer | null:false |
| day    | integer | null:false |

#categoryテーブル
| Column   | Type    | Option     |
|----------|---------|------------|
| category | string  | null:false |

#statusテーブル
| Column | Type    | Option     |
|--------|---------|------------|
| status | string  | null:false |

#delivery_feeテーブル
| Column       | Type    | Option     |
|--------------|---------|------------|
| delivery_fee | string  | null:false |

#sender_areaテーブル
| Column     | Type   | Option     |
|------------|--------|------------|
| prefecture | string | null:false |


#number_of_dayテーブル
| Column        | Type    | Option     |
|---------------|---------|------------|
| number_of_day | string  | null:false |

#prefectureテーブル
| Column     | Type   | Option     |
|------------|--------|------------|
| prefecture | string | null:false |





