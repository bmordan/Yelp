require 'spec_helper'

describe 'reviews' do
  before do
    Restaurant.create(name: 'KFC')
  end

  it 'allows users to leave a rude comment' do
    visit restaurants_path
    click_link 'Review KFC'
    fill_in 'Thoughts', with: 'its ok'
    select '3', from: 'Rating'
    click_button 'Leave review'

    expect(current_path).to eq '/restaurants'
    expect(page).to have_content('its ok')
  end
end