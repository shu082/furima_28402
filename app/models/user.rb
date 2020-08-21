class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    with_options presence: true do
       validates :nick_name
       validates :email, uniqueness: true, format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
       validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
       validates :password, confirmation: true
       validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/}
       validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/}
       validates :katakana_first_name, format:{ with: /\A[ァ-ヶー－]+\z/}
       validates :katakana_last_name, format:{ with: /\A[ァ-ヶー－]+\z/}
       validates :birthday
    end
end
