class Purchase < ApplicationRecord
  # attr_accessor :tokene
  belongs_to :user
  belongs_to :item
  has_one :address
  # validates :token, presence: true
end
