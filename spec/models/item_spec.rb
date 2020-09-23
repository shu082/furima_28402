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
        @item.delivery_day_id = "2"
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
        expect(@item.errors.full_messages).to include("画像を入力してください")

      end
      it 'nameが空のとき' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it 'descriptionが空のとき' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品説明を入力してください")
      end
      it 'category_idが空では登録できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを入力してください")
      end
      it 'category_idが1では登録できない' do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーは1以外の値にしてください")
      end
      it 'status_idが空では登録できない' do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を入力してください")
      end
      it 'status_idが1では登録できない' do
        @item.status_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態は1以外の値にしてください")
      end
      it 'delivery_charge_idが空では登録できない' do
        @item.delivery_charge_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を入力してください")
      end
      it 'delivery_charge_idが1では登録できない' do
        @item.delivery_charge_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担は1以外の値にしてください")
      end
      it 'delivery_source_idが空では登録できない' do
        @item.delivery_source_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を入力してください")
      end
      it 'delivery_source_idが0では登録できない' do
        @item.delivery_source_id = "0"
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域は0以外の値にしてください")
      end
      it 'delivery_day_idが空では登録できない' do
        @item.delivery_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を入力してください")
      end
      it 'delivery_day_idが1では登録できない' do
        @item.delivery_day_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数は1以外の値にしてください")
      end
      it 'priceが空では登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格を入力してください")
      end
      it 'priceが300より小さいと登録できない' do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は300以上の値にしてください")
      end
      it 'priceが9999999より大きいと登録できない' do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は9999999以下の値にしてください")
      end

    end



  end

end
