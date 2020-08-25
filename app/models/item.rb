class Item < ApplicationRecord
  belongs_to :user
  has_one :items_management
end
