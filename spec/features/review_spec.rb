require 'spec_helper'

describe 'reviews' do
  before do
    @user = User.create(email: 'sue@zoo.net', password: 'password', password_confirmation: 'password')
    @restaurant = @user.restaurants.create(name: 'KFC')
  end

  it 'allows users to leave a rude comment' do
    _leave_review
    expect(current_path).to eq '/restaurants'
    expect(page).to have_content('its ok')
  end

  it 'allow logged in users to delete their review' do
    visit restaurants_path
    login_as @user
    click_link 'Review KFC'
    fill_in 'Thoughts', with: 'its ok'
    select '3', from: 'Rating'
    click_button 'Leave review'
    expect(page).to have_css('a#delete-review')
  end

  it 'logged in users can delete their reviews' do
    visit restaurants_path
    login_as @user
    click_link 'Review KFC'
    fill_in 'Thoughts', with: 'its ok'
    select '3', from: 'Rating'
    click_button 'Leave review'
    click_link 'delete-review'
    expect(page).not_to have_css('a#delete-review')
  end  

  context 'an invalid restaurant' do
    it 'does not let you submit a name that is too short' do
      visit restaurants_path
      _signin
      click_link 'Add a restaurant'
      fill_in 'Name', with: 'kf'
      click_button 'Create Restaurant'
      expect(page).not_to have_css 'h2', text: 'kf'
      expect(page).to have_content 'error'
    end
  end

  # context 'a user can only leave one review. no matter how much they loved it' do
  #   it 'cant add two reviews' do
  #      visit restaurants_path
  #     _signin

  #     click_link 'Review KFC'
  #     fill_in 'Thoughts', with: 'its ok'
  #     select '3', from: 'Rating'
  #     click_button 'Leave review'

  #     click_link 'Review KFC'
  #     fill_in 'Thoughts', with: 'its still ok'
  #     select '3', from: 'Rating'
  #     click_button 'Leave review'

  #     expect(page).to have_content 'you already have a review'    
  #   end
  # end
    
end