require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end

  describe '商品データの登録' do
    context 'データの保存がうまくいくとき' do
      it 'image,name,description,category_id,status_id,delivery_charge_id,delivery_source_id,delivery_days_id,priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
      it 'category_idが１以外のとき' do
        @item.category_id = "2"
        expect(@item).to be_valid
      end
      it 'status_idが１以外の時' do
        @item.status_id = "2"
        expect(@item).to be_valid
      end
      it 'delivery_charge_idが１以外のとき' do
        @item.delivery_charge_id = "2"
        expect(@item).to be_valid
      end
      it 'delivery_source_idが0以外のとき' do
        @item.delivery_source_id = "2"
        expect(@item).to be_valid
      end
      it 'delivery_days_idが１以外のとき' do
        @item.delivery_days_id = "2"
        expect(@item).to be_valid
      end
      it 'priceが300から9999999までの時' do
        @item.price = "3000"
        expect(@item).to be_valid
      end
    end

    context "データの保存がうまくいかないとき" do
      it 'imageが空のとき' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")

      end
      it 'nameが空のとき' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'descriptionが空のとき' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'category_idが空では登録できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'category_idが1では登録できない' do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it 'status_idが空では登録できない' do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it 'status_idが1では登録できない' do
        @item.status_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end
      it 'delivery_charge_idが空では登録できない' do
        @item.delivery_charge_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
      end
      it 'delivery_charge_idが1では登録できない' do
        @item.delivery_charge_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge must be other than 1")
      end
      it 'delivery_source_idが空では登録できない' do
        @item.delivery_source_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery source can't be blank")
      end
      it 'delivery_source_idが0では登録できない' do
        @item.delivery_source_id = "0"
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery source must be other than 0")
      end
      it 'delivery_days_idが空では登録できない' do
        @item.delivery_days_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery days can't be blank")
      end
      it 'delivery_days_idが1では登録できない' do
        @item.delivery_days_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery days must be other than 1")
      end
      it 'priceが空では登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが300より小さいと登録できない' do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it 'priceが9999999より大きいと登録できない' do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

    end



  end

end
