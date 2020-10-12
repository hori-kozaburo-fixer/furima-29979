class PurchaseAddress
  include ActiveModel::Model

  attr_accessor :postal_code, :prefecture_id, :municipality, :house_number, :building_name, :tel, :purchase_id, :user_id, :item_id, :token

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    binding.pry
    address = Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, house_number: house_number,building_name: building_name, tel: tel, purchase_id: purchase.id)
    binding.pry
  end

end