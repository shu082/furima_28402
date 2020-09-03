class TransactionAddress

  include ActiveModel::Model
  attr_accessor :post_number, :prefecture_id, :city, :block, :building_name, :tel, :token, :price, :item_id, :user_id

  with_options presence: true do
    POST_NUMBER = /\A\d{3}[-]\d{4}\z/
    VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
    validates :post_number, format: { with: POST_NUMBER}
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :city
    validates :block
    validates :tel, format: { with: VALID_PHONE_REGEX}
  end


  def save
    items_management = ItemsManagement.create(item_id: item_id, user_id: user_id)
    Address.create(post_number: post_number, prefecture_id: prefecture_id, city: city, block: block, building_name: building_name, tel: tel, items_management_id: items_management.id)
  end
end