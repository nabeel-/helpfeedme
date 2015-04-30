class Restaurant < ActiveRecord::Base
  has_one :food_detail, :dependent => :destroy
  has_one :business_detail, :dependent => :destroy
  has_one :contact_detail, :dependent => :destroy
  belongs_to :chain

  accepts_nested_attributes_for :food_detail
  accepts_nested_attributes_for :business_detail
  accepts_nested_attributes_for :contact_detail

  def self.search(query_string=nil)
    if query_string
      search_length = query_string.split.length
      Restaurant.where([(['description ILIKE ?'] * search_length).join('AND ')] + query_string.split.map { |string| "%#{string}%" })
    else
      Restaurant.all
    end
  end

end
