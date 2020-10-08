class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :sender_area
  belongs_to_active_hash :number_of_day
  has_one_attached :image
  belongs_to :user

  with_options presence: true, do
    validates :name,
    validates :text
    validates :category_id,      numericality: { other_than: 1 }  
    validates :statusid,         numericality: { other_than: 1 }
    validates :delivery_fee_id,  numericality: { other_than: 1 }
    validates :sender_area_id,   numericality: { other_than: 1 }
    validates :number_of_day_id, numericality: { other_than: 1 }
    validates :money,
    validates :user_id,          foreign_key: true
  end
end
