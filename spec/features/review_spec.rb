require 'spec_helper'

describe 'reviews' do
  before do
    Restaurant.create(name: 'KFC')
  end

  it 'allows users to leave a rude comment' do
    visit restaurants_path
    _signin
    click_link 'Review KFC'
    fill_in 'Thoughts', with: 'its ok'
    select '3', from: 'Rating'
    click_button 'Leave review'

    expect(current_path).to eq '/restaurants'
    expect(page).to have_content('its ok')
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
    
end