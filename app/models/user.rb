class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nick_name
    email = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    password = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
    zenkaku = /\A[ぁ-んァ-ン一-龥]/
    kana_zenkaku = /\A[ァ-ヶー－]+\z/
    validates :email, uniqueness: true, format: { with: email }
    validates :password, format: { with: password }
    validates :password, confirmation: true
    validates :first_name, format: { with: zenkaku }
    validates :last_name, format: { with: zenkaku }
    validates :katakana_first_name, format: { with: kana_zenkaku }
    validates :katakana_last_name, format: { with: kana_zenkaku }
    validates :birthday
  end

  has_many :items
  has_many :items_managements
end
