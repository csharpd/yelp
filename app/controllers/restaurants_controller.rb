class RestaurantsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.create(params[:restaurant].permit(:name, :street, :city, :postcode, :tel, :kind, :description))
    redirect_to '/restaurants'
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(params[:restaurant].permit(:name, :street, :city, :postcode, :tel, :kind, :description))
    redirect_to '/restaurants'
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy

    flash[:notice] = 'Restaurant deleted successfully'
    redirect_to '/restaurants'
  end
end
