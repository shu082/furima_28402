class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :delivery_address, null:false
      t.string :post_number,      null:false
      t.integer :prefecture_id,   null:false
      t.string :city,             null:false
      t.string :block,            null:false
      t.string :building_name,    null:false
      t.string :tel,              null:false
      t.references :items_management, foreign_key:true
      t.timestamps
    end
  end
end
