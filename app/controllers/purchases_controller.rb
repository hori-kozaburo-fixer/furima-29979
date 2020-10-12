class PurchasesController < ApplicationController
  def index 
    @purchase_address = PurchaseAddress.new 
  end

  def create 
    @purchase_address = PurchaseAddress.new(purchase_params)
    binding.pry
    if @purchase_address.valid?
      pay_item
      # binding.pry
      @purchase_address.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private
  
  def purchase_params
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :municipality, :house_number, :building_name, :tel).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id] )
  end

  def pay_item
    @item = Item.find(purchase_params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
        amount: @item.money,
        card: purchase_params[:token],
        currency: 'jpy'
    )
  end

end
