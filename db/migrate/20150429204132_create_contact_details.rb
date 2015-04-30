class CreateContactDetails < ActiveRecord::Migration
  def change
    create_table :contact_details do |t|
      t.integer :restaurant_id
      t.string :phone
      t.string :website
      t.string :email
      t.string :address_one
      t.string :address_two
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps null: false
    end
  end
end
