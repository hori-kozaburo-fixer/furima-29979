class PurchaseAddress
  include ActiveModel::Model

  attr_accessor :postal_code, :prefecture_id, :municipality, :house_number, :building_name, :tel, :user_id, :item_id, :token

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/,message: "Input correctly"}
    validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }
    validates :municipality
    validates :house_number
    validates :tel, format: { with: /\A\d{7,11}\z/, message: 'input only number'}
  end

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, house_number: house_number,building_name: building_name, tel: tel, purchase_id: purchase.id)
  end

end