class CreateFoodDetails < ActiveRecord::Migration
  def change
    create_table :food_details do |t|
      t.integer :restaurant_id
      t.string :cuisine
      t.boolean :breakfast
      t.boolean :lunch
      t.boolean :dinner
      t.boolean :takeout
      t.boolean :delivery
      t.boolean :lowfat
      t.boolean :healthy
      t.boolean :organic
      t.boolean :gluten_free
      t.boolean :vegan
      t.boolean :vegetarian

      t.timestamps null: false
    end
  end
end
