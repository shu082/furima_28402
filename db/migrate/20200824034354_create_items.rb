class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :image, null: false
      t.string :name, null: false
      t.text :description, null:false
      t.integer :price, null:false
      t.integer :category, null:false
      t.integer :delivery_charge, null:false
      t.integer :delivery_source, null:false
      t.integer :delivery_days, null:false
      t.references :user, foreign_key:true
      t.integer :status, null:false
      t.timestamps
    end
  end
end
