	# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# user = CreateAdminService.new.call
# puts 'CREATED ADMIN USER: ' << user.email

json = ActiveSupport::JSON.decode(File.read('db/clean_data.json'))

json.each do |res|
  Restaurant.create!(:name => res['name'], 
                     :description => res['category_labels'].join(','), 
                     :chain_id => res['chain_id'], 
                     :rating => res['rating'], 
                     :price => res['price'],
                     :food_detail_attributes => {
                      :cuisine => res['cuisine'],
                      :breakfast => res['meal_breakfast'],
                      :lunch => res['meal_lunch'],
                      :dinner => res['meal_dinner'],
                      :takeout => res['meal_takeout'],
                      :delivery => res['meal_delivery'],
                      :lowfat => res['options_lowfat'],
                      :healthy => res['options_healthy'],
                      :organic => res['options_organic'],
                      :gluten_free => res['options_gluten_free'],
                      :vegan => res['options_vegan'],
                      :vegetarian => res['options_vegetarian']
                     },
                     :business_detail_attributes => {
                      :hours => res['hours_display'],
                      :attire => res['attire']
                     },
                     :contact_detail_attributes => {
                      :phone => res['tel'],
                      :website => res['website'],
                      :email => res['email'],
                      :address_one => res['address'],
                      :address_two => '',
                      :city => res['locality'],
                      :state => res['region'],
                      :zip => res['postcode']
                     }
                     )
end

