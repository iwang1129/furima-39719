require 'rails_helper'

RSpec.describe OrderPayment, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:user)
      @order_payment = FactoryBot.build(:order_payment, user_id: user.id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_payment).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @order_payment.building_name = ''
        expect(@order_payment).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '郵便番号が空だと保存できない' do
        @order_payment.post_code = ''
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号が半角のハイフンを含んだ正しい形式でないと保存できない' do
        @order_payment.post_code = '1234567'
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it '都道府県の情報が「---」だと出品できない' do
        @order_payment.region_id = 1
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("Region can't be blank")
      end
      it '市区町村の情報が空だと保存できない' do
        @order_payment.city = ''
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できない' do
        @order_payment.block = ''
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("Block can't be blank")
      end
      it '電話番号が空だと保存できない' do
        @order_payment.telephone_number = ''
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("Telephone number can't be blank")
      end
      it '電話番号が9桁以下だと保存できない' do
        @order_payment.telephone_number = '12345'
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("Telephone number is invalid")
      end
      it '電話番号が12桁以上だと保存できない' do
        @order_payment.telephone_number = '123456789012'
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("Telephone number is invalid")
      end 
      it '電話番号は全角だと保存できない' do
        @order_payment.telephone_number = 'あああああ'
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include('Telephone number is invalid')
      end
      it 'user_idが空だと保存できない' do
        @order_payment.user_id = nil
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できない' do
        @order_payment.item_id = nil
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("Item can't be blank")
      end
      it "tokenが空では登録できないこと" do
        @order_payment.token = nil
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end