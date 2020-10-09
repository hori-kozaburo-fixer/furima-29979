class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :sender_area
  belongs_to_active_hash :number_of_day
  has_one_attached :image
  belongs_to :user

  with_options presence: true do
    validates :image
    validates :name
    validates :text
    validates :money,            format: { with: /\A[0-9]+\z/,message: "Half-width number"},numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: "Out of setting range" }
    validates :category_id,      numericality: { other_than: 1,message: "Select" }
    validates :status_id,        numericality: { other_than: 1,message: "Select" }
    validates :delivery_fee_id,  numericality: { other_than: 1,message: "Select" }
    validates :sender_area_id,   numericality: { other_than: 1,message: "Select" }
    validates :number_of_day_id, numericality: { other_than: 1,message: "Select" }
  end
end
