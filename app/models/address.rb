class Address < ApplicationRecord
  belongs_to :items_management

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture


end
