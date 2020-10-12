require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '購入情報の保存' do
    before do
      @purchase_address = FactoryBot.build(:purchase_address)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@purchase_address).to be_valid
    end

    it 'トークンが必須であること' do
      @purchase_address.token = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
    end

    it '郵便番号が必須であること' do
      @purchase_address.postal_code = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank", 'Postal code Input correctly')
    end

    it '郵便番号にはハイフンが必須であること' do
      @purchase_address.postal_code = '1234567'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Postal code Input correctly')
    end

    it '都道府県の選択が必須であること' do
      @purchase_address.prefecture_id = 1
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Prefecture Select')
    end

    it '市区町村が必須であること' do
      @purchase_address.municipality = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Municipality can't be blank")
    end

    it '番地が必須であること' do
      @purchase_address.house_number = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("House number can't be blank")
    end

    it '電話番号の入力が必須であること' do
      @purchase_address.tel = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Tel can't be blank", 'Tel input only number')
    end

    it '電話番号は7桁以上11桁以下で入力が必須であること' do
      @purchase_address.tel = '123456789012'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Tel input only number')
    end

    it '電話番号はハイフンなしでの入力が必須であること' do
      @purchase_address.tel = '012-345-567'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Tel input only number')
    end
  end
end
