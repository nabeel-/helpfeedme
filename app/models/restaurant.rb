class Restaurant < ActiveRecord::Base
  has_one :food_detail, :dependent => :destroy
  has_one :business_detail, :dependent => :destroy
  has_one :contact_detail, :dependent => :destroy
  belongs_to :chain

  accepts_nested_attributes_for :food_detail
  accepts_nested_attributes_for :business_detail
  accepts_nested_attributes_for :contact_detail

  def self.search(query_string="")
    Restaurant.where 'description ILIKE ?', "%#{query_string}%"
  end

end
