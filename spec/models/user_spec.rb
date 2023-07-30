require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it '必要な値があれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '同じemailの値がある場合は登録できない' do
        @user.save
        second_user = FactoryBot.build(:user, email: @user.email)
        second_user.valid?
        expect(second_user.errors.full_messages).to include("Email has already been taken")
      end
      it '@を含まないemailは登録できない' do
        @user.email = 'aqwsde'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが6文字以上でなければ登録できない' do
        @user.password ='12ab3'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordは半角数字だけでは登録できない' do
        @user.password ='123456'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordは半角英語だけでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordは全角文字が含まれていると登録できない' do
        @user.password = '123asD'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordとpassword_confirmationが一致してなければ登録できない' do
        @user.password = '123asa'
        @user.password_confirmation = 'asd245'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'last_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.last_name = 'nameles'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.last_name = 'nameles'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it 'kana_last_nameが空では登録できない' do
        @user.kana_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last name can't be blank")
      end
      it 'kana_last_nameが全角（カタカナ）でなければ登録できない' do
        @user.kana_last_name = '名無し'
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last name is invalid")
      end
      it 'kana_first_nameが空では登録できない' do
        @user.kana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name can't be blank")
      end
      it 'kana_first_nameが全角（カタカナ）でなければ登録できない' do
        @user.kana_last_name = '名無し'
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last name is invalid")
      end
      it 'date_of_birthが空では登録できない' do
        @user.date_of_birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Date of birth can't be blank")
      end
    end
  end
end