require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "データが全て存在すれば登録できること" do
      expect(@user).to be_valid
    end

    it "nick_nameが空だと登録できない" do
      @user.nick_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nick name can't be blank")
    end

    it "emailが空では登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "重複するemailが存在するときは登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "passwordがからでは登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "passwordが存在してもpassword/confirmationが空では登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "passwordが6文字以上で英数字混合なら登録できる" do
      @user.password = "example1"
      @user.password_confirmation = "example1"
      expect(@user).to be_valid
    end
    it "passwordが６文字以上でも英数字混合でないなら登録できない" do
      @user.password = "111111"
      @user.password_confirmation = "111111"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it "passwordが５文字以下であれば登録できない" do
      @user.password = "12345"
      @user.password_confirmation = "12345"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "first_nameがからでは登録できない" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "last_nameが空では登録できない" do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "katakana_first_nameがからでは登録できない" do
      @user.katakana_first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Katakana first name can't be blank")
    end

    it "katakana_last_nameがからでは登録できない" do
      @user.katakana_last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Katakana last name can't be blank")
    end

    it "first_nameが全角のとき登録できる" do
      @user.first_name = "田中"
      expect(@user).to be_valid
    end

    it "last_nameが全角のとき登録できる" do
      @user.last_name = "太郎"
      expect(@user).to be_valid
    end

    it "katakana_first_nameが全角カタカナのとき登録できる" do
      @user.katakana_first_name = "タナカ"
      expect(@user).to be_valid
    end

    it "katakana_last_nameが全角カタカナのとき登録できる" do
      @user.katakana_last_name = "タロウ"
      expect(@user).to be_valid
    end

    it "first_nameが全角でないとき登録できない" do
      @user.first_name = "tanaka"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end

    it "last_nameが全角でないとき登録できない" do
      @user.last_name = "tarou"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end

    it "katakana_first_nameが全角カタカナでないとき登録できない" do
      @user.katakana_first_name = "tanaka"
      @user.valid?
      expect(@user.errors.full_messages).to include("Katakana first name is invalid")
    end

    it "katakana_last_nameが全角カタカナでないとき登録できない" do
      @user.katakana_last_name = "tarou"
      @user.valid?
      expect(@user.errors.full_messages).to include("Katakana last name is invalid")
    end

    it "birthdayが空では登録できない" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
