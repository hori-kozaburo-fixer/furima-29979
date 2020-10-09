class Purchase < ApplicationRecord
  bolongs_to :user
  belongs_to :item
  has_one :address
end
