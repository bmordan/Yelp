require 'spec_helper'

describe 'restaurants' do
  context 'no restaurants have been added' do
    it 'should display a prompt to add a restaurant' do
      visit restaurants_path
      expect(page).to have_content 'No restaurants'
      expect(page).to have_link 'Add a restaurant'
    end
  end

  context 'restaurants have been added' do
    
    before do
      @button = User.create(email: 'Button@gmail.com',password: 'password', password_confirmation: 'password')
      login_as @button
      @button.restaurants.create(:name => 'KFC')
    end
  
    it 'should display restaurants' do
      visit restaurants_path
      expect(page).to have_content('KFC')
      expect(page).not_to have_content('No restaurants')
    end

    it 'promts user to fill out a form, then displays the new restaurant' do
      visit restaurants_path
      login_as @button
      click_link 'Add a restaurant'
      fill_in 'Name', with: 'Nandos'
      click_button 'Create Restaurant'
      expect(page).to have_content 'Nandos'
      expect(current_path).to eq '/restaurants'
    end

    it 'whoops edit a restaurant' do
      visit restaurants_path
      login_as @button
      click_link 'edit-restaurant'
      fill_in 'Name', with: 'Kentucky Fried Chicken'
      click_button 'Update Restaurant'
      expect(page).to have_content 'Kentucky Fried Chicken'
      expect(current_path).to eq '/restaurants'
    end

    it 'remove that restaurant' do
      visit restaurants_path
      login_as @button
      click_link 'delete-restaurant'
      expect(page).not_to have_content 'KFC'
      expect(page).to have_content 'deleted sucessfully'
    end 
  end

  context 'doing more shit in restaurants' do

    before do
      @kfc = Restaurant.create(name: 'KFC')
    end

    it 'view a restaurant' do
      visit restaurants_path
      click_link 'KFC'
      expect(page).to have_content 'KFC'
      expect(current_path).to eq "/restaurants/#{@kfc.id}"
    end

  end

  # context 'a user creates restaurants' do
  #   it 'has a user id'
  #     visit '/'
  #     _signin
  #     click_link 'Add a restaurant'
  #     fill_in 'Name', with: 'KFC'
  #     click_button 'Create Restaurant'
  #     expect().to 
  #   end
  # end
end