class ReviewsController < ApplicationController

  before_action :authenticate_user!

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @restaurant.reviews.create(params[:review].permit(:thoughts, :rating, :user_id))
    redirect_to restaurants_path
  end

  def destory
    puts "BBOOOOOOOM ! over"
  end

end