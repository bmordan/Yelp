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

  def destroy
    @review = Review.find(params[:review])
    @review.destroy
    flash[:notice] = 'Review deleted'
    redirect_to restaurants_path
  end

end