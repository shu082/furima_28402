class Item < ApplicationRecord
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
    validates :category
    validates :status
    validates :delivery_charge
    validates :delivery_source
    validates :delivery_days
    validates :price
  end
  belongs_to :user
  has_one :items_management

end
