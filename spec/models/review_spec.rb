require 'spec_helper'

RSpec.describe Review, :type => :model do
  it "is invalid if the rating is more than 5" do
    review = Review.new(rating: 10)
    expect(review).to have(1).error_on(:rating)
  end

  it 'user can only add one review' do
    @user = User.create(email: 'some@email.com', password: 'password', password_confirmation: 'password')
    restaurant = @user.restaurants.create(name: 'KFC')
    review = Review.create(thoughts: 'sometext',rating: 3, restaurant_id: restaurant.id, user_id: @user.id)
    review = Review.create(thoughts: 'someothertext',rating: 2, restaurant_id: restaurant.id, user_id: @user.id)
    expect(Review.all.count).to equal(1) 
  end
end