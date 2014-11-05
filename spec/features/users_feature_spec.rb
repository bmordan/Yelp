require 'spec_helper'

describe 'devise gives users' do

  context "user not signed in and on the homepage" do
    it "should see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).to have_link('Sign in')
      expect(page).to have_link('Sign up')
    end

    it "should not see 'sign out' link" do
      visit('/')
      expect(page).not_to have_link('Sign out')
    end

    it 'cant create or add if not facebook complient' do
      visit '/'
      click_link 'Add a restaurant'
      save_and_open_page
      expect(page).to have_content('No. Naughty')
    end
  
  end

  context "user signed in on the homepage" do

    before do
      _signin
    end

    it "should see 'sign out' link" do
      visit('/')
      expect(page).to have_link('Sign out')
    end

    it "should not see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).not_to have_link('Sign in')
      expect(page).not_to have_link('Sign up')
    end
  end

end