require 'spec_helper'

describe 'endorsing reviews' do
  before do
    _signin
    kfc = Restaurant.create(name: 'KFC')
    kfc.reviews.create(rating: 3, thoughts: "It was an abomination")
  end

  it 'a user can endorse a review, which updates the review endorsement count' do
    visit '/restaurants'
    click_link 'endorsement-up-KFC'
    expect(page).to have_content('1 endorsement')
  end

end