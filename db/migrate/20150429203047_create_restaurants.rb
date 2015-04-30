class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.text :description
      t.integer :chain_id
      t.decimal :rating
      t.integer :price

      t.timestamps null: false
    end
  end
end
