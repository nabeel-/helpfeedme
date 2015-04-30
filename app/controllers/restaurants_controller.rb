class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @restaurants = Restaurant.all
    respond_with(@restaurants)
  end

  def show
    respond_with(@restaurant)
  end

  def new
    @restaurant = Restaurant.new
    @restaurant.build_food_detail
    @restaurant.build_business_detail
    @restaurant.build_contact_detail
  end

  def edit
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    flash[:notice] = 'Restaurant was successfully created.' if @restaurant.save
    respond_with(@restaurant)
  end

  def update
    flash[:notice] = 'Restaurant was successfully updated.' if @restaurant.update(restaurant_params)
    respond_with(@restaurant)
  end

  def destroy
    @restaurant.destroy
    respond_with(@restaurant)
  end

  private
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    def restaurant_params
      params.require(:restaurant).permit(:name, 
                                         :description, 
                                         :chain_id, 
                                         :rating, 
                                         :price,
                                         :food_detail_attributes => [
                                          :restaurant_id,
                                          :cuisine,
                                          :breakfast,
                                          :lunch,
                                          :dinner,
                                          :takeout,
                                          :delivery,
                                          :lowfat,
                                          :healthy,
                                          :organic,
                                          :gluten_free,
                                          :vegan,
                                          :vegetarian
                                         ],
                                         :business_detail_attributes => [
                                          :restaurant_id,
                                          :hours,
                                          :attire
                                         ],
                                         :contact_detail_attributes => [
                                          :restaurant_id,
                                          :phone,
                                          :website,
                                          :email,
                                          :address_one,
                                          :address_two,
                                          :city,
                                          :state,
                                          :zip
                                         ]
                                         )
    end
end
