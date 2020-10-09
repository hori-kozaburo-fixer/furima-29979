require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('app/assets/images/camera.png')
  end

  describe "ユーザー出品機能" do
    it '全て正しい入力をすることで登録できること' do
      @item.save
      expect(@item).to be_valid
    end
    it '商品画像を1枚つけることが必須であること' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it '商品名が必須であること' do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it '商品の説明が必須であること' do
      @item.text = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Text can't be blank")
    end

    it 'カテゴリーの情報が必須であること' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category Select")
    end

    it '商品の状態についての情報が必須であること' do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Status Select")
    end

    it '配送料の負担についての情報が必須であること' do
      @item.delivery_fee_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery fee Select")
    end

    it '発送元の地域についての情報が必須であること' do
      @item.sender_area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Sender area Select")
    end

    it '発送までの日数についての情報が必須であること' do
      @item.number_of_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Number of day Select")
    end

    it '価格についての情報が必須であること' do
      @item.money = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Money can't be blank")
    end

    it '価格の範囲が、¥300未満では登録できないこと' do
      @item.money = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Money Out of setting range")
    end

    it '価格の範囲が、¥9,999,999超では登録できないこと' do
      @item.money = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include("Money Out of setting range")
    end

    it '販売価格は半角数字のみ保存可能であること' do
      @item.money = '１００００'
      @item.valid?
      expect(@item.errors.full_messages).to include("Money Out of setting range")
    end
  end  
end
