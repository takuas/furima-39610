require 'rails_helper'

RSpec.describe OrderSendingAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @second_user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item, user_id: @user.id)
    @order_sending_address = FactoryBot.build(:order_sending_address, user_id: @second_user.id, item_id: @item.id)
  end
  
  describe '商品購入機能' do
    context '商品が購入できる場合' do
      it '全ての値が正しく入力されていれば購入できる' do
        expect(@order_sending_address).to be_valid
      end
      it 'buildingが空でも購入できる' do
        @order_sending_address.building = ''
        expect(@order_sending_address).to be_valid
      end
    end

    context '商品が購入できない場合' do
      it 'postalが空だと購入できない' do
        @order_sending_address.postal = ''
        @order_sending_address.valid?
        expect(@order_sending_address.errors.full_messages).to include("Postal can't be blank") 
      end
      it 'postalは(3桁の半角数字[-(ハイフン)]4桁の半角数字)の形式以外だと購入できない' do
        @order_sending_address.postal = '3451234'
        @order_sending_address.valid?
        expect(@order_sending_address.errors.full_messages).to include('Postal is invalid') 
      end
      it 'ship_from_idが空だと購入できない' do
        @order_sending_address.ship_from_id = ''
        @order_sending_address.valid?
        expect(@order_sending_address.errors.full_messages).to include("Ship from can't be blank") 
      end
      it 'ship_from_idが1だと購入できない' do
        @order_sending_address.ship_from_id = '1'
        @order_sending_address.valid?
        expect(@order_sending_address.errors.full_messages).to include("Ship from can't be blank") 
      end
      it 'municipalitiesが空だと購入できない' do
        @order_sending_address.municipalities = ''
        @order_sending_address.valid?
        expect(@order_sending_address.errors.full_messages).to include("Municipalities can't be blank") 
      end
      it 'addressが空だと購入できない' do
        @order_sending_address.address = ''
        @order_sending_address.valid?
        expect(@order_sending_address.errors.full_messages).to include("Address can't be blank") 
      end
      it 'telが空だと購入できない' do
        @order_sending_address.tel = ''
        @order_sending_address.valid?
        expect(@order_sending_address.errors.full_messages).to include("Tel can't be blank") 
      end
      it 'telは9桁以下の半角数字だと購入できない' do
        @order_sending_address.tel = '12345678'
        @order_sending_address.valid?
        expect(@order_sending_address.errors.full_messages).to include('Tel is invalid') 
      end
      it 'telは12桁以上の半角数字だと購入できない' do
        @order_sending_address.tel = '123456789012'
        @order_sending_address.valid?
        expect(@order_sending_address.errors.full_messages).to include('Tel is invalid') 
      end
      it 'telは半角数字以外では購入できない' do
        @order_sending_address.tel = '１２３４５６７８９０'
        @order_sending_address.valid?
        expect(@order_sending_address.errors.full_messages).to include('Tel is invalid') 
      end
      it 'itemと関連づいてないと購入できない' do
        @order_sending_address.item_id = nil
        @order_sending_address.valid?
        expect(@order_sending_address.errors.full_messages).to include("Item can't be blank") 
      end
      it 'userと関連づいてないと購入できない' do
        @order_sending_address.user_id = nil
        @order_sending_address.valid?
        expect(@order_sending_address.errors.full_messages).to include("User can't be blank") 
      end
      it "tokenが空では登録できないこと" do
        @order_sending_address.token = ''
        @order_sending_address.valid?
        expect(@order_sending_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
