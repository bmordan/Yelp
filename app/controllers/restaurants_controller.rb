class RestaurantsController < ApplicationController
  
  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @restaurants = Restaurant.all
  end

  def new
    if user_signed_in?
      @restaurant = Restaurant.new 
    else
      flash[:notice] = 'No Naughty'
      redirect_to new_user_session
    end
  end

  def create
    @restaurant = current_user.restaurants.create(params[:restaurant].permit(:name))
    if @restaurant.save
      redirect_to restaurants_path
    else
      render 'new'
  end  
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(params[:restaurant].permit(:name))
    redirect_to restaurants_path
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    flash[:notice] = 'deleted sucessfully'
    redirect_to restaurants_path
  end

end