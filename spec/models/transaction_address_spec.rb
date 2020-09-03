require 'rails_helper'

RSpec.describe TransactionAddress, type: :model do
  before do
    @transaction = FactoryBot.build(:transaction_address)
  end

  describe '商品購入' do
    context '商品購入がうまくいくとき' do

      it 'データが全て存在すれば登録できる' do
        expect(@transaction).to be_valid
      end

      it 'building_nameは空でも登録できること' do
        @transaction.building_name = nil
        expect(@transaction).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it 'post_numberが空のとき保存できない' do
        @transaction.post_number = nil
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("Post number is invalid")
      end
      it 'prefecture_idが空のとき保存できない' do
        @transaction.prefecture_id = nil
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが0のとき保存できない' do
        @transaction.prefecture_id = '0'
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("Prefecture must be other than 0")
      end
      it 'cityが空のとき保存できない' do
        @transaction.city = nil
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("City can't be blank")
      end
      it 'blockが空のとき保存できない' do
        @transaction.block = nil
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("Block can't be blank")
      end
      it 'telが空のとき保存できない' do
        @transaction.tel = nil
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("Tel can't be blank")
      end
      it '郵便番号にハイフンがないとき保存できない' do
        @transaction.post_number = '1234567'
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("Post number is invalid")
      end
      it '電話番号が11桁以内でないと保存できない' do
        @transaction.tel = '123456789012'
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("Tel is invalid")
      end
      it '電話番号にハイフンがあると保存できない' do
        @transaction.tel = '090-0000-0000'
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("Tel is invalid")
      end
    end
  end
end
