class Item < ApplicationRecord

  belongs_to :user
  has_one :items_management
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :delivery_source
  belongs_to_active_hash :delivery_day

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id, numericality: { other_than: 1 }
    validates :status_id, numericality: { other_than: 1 }
    validates :delivery_charge_id, numericality: { other_than: 1 }
    validates :delivery_source_id, numericality: { other_than: 0 }
    validates :delivery_days_id, numericality: { other_than: 1 }
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  end

end
