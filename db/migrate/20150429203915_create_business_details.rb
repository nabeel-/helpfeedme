class CreateBusinessDetails < ActiveRecord::Migration
  def change
    create_table :business_details do |t|
      t.integer :restaurant_id
      t.text :hours
      t.string :attire

      t.timestamps null: false
    end
  end
end
