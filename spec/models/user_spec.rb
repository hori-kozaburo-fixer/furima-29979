require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録(ユーザー情報)' do
    it 'email, password, password_confirmation, nickname, name_first,name_last, name_first_kana, name_last_kana, birth_dayがあれば登録できること' do
      expect(@user).to be_valid
    end
    it 'nicknameが空だと登録できないこと' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空だと登録できないこと' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it '既に登録されたemailがないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'メールアドレスは@を含む必要があること' do
      @user.email = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'passwordが空だと登録できないこと' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordは6文字以上が必要であること' do
      @user.password = '1a1a1'
      @user.password_confirmation = '1a1a1'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordは半角英数字混合での入力が必須であること' do
      @user.password = '111111'
      @user.password_confirmation = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Include both letters and numbers.')
    end

    it 'passwordは確認用を含めて2回入力すること' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordとpassword_confirmationの値が一致が必須であること' do
      @user.password = '111aaa'
      @user.password_confirmation = 'aaa111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end

  describe '新規登録(本人情報確認)' do
    it '本名は、name_firstが必須であること' do
      @user.name_first = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name first can't be blank", 'Name first Full-width characters.')
    end

    it '本名は、name_lastが必須であること' do
      @user.name_last = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name last can't be blank", 'Name last Full-width characters.')
    end

    it '本名は、name_firstが全角での入力が必須であること' do
      @user.name_first = 'ｻﾝﾌﾟﾙ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Name first Full-width characters.')
    end

    it '本名は、last_firstが全角での入力が必須であること' do
      @user.name_last = 'ｻﾝﾌﾟﾙ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Name last Full-width characters.')
    end

    it '本名のフリガナは、first_name_kanaが必須であること' do
      @user.name_first_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name first kana can't be blank", 'Name first kana Full-width katakana characters.')
    end

    it '本名のフリガナは、last_name_kanaが必須であること' do
      @user.name_last_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name last kana can't be blank", 'Name last kana Full-width katakana characters.')
    end

    it '本名のフリガナは、name_first_kanaが全角（カタカナ）での入力が必須であること' do
      @user.name_first_kana = 'ｻﾝﾌﾟﾙ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Name first kana Full-width katakana characters.')
    end

    it '本名のフリガナは、name_last_kanaが全角（カタカナ）での入力が必須であること' do
      @user.name_last_kana = 'ｻﾝﾌﾟﾙ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Name last kana Full-width katakana characters.')
    end

    it '生年月日が必須であること' do
      @user.birth_day = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end
  end
end
