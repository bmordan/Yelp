require 'spec_helper'

describe 'devise gives users' do

  context "what users CAN and CANNOT do" do

    before do
      @paul = User.create(email: 'paul@gmail.com',password: 'password',password_confirmation: 'password')
      @rachel = User.create(email: 'rachel@gmail.com',password: 'password',password_confirmation: 'password')
      @rachel.restaurants.create(name: 'Nandos')
    end

    it "should see a 'sign in' link and a 'sign up' link" do
      visit '/'
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
      expect(page).to have_content('No. Naughty')
    end

    it 'cant edit another users restaurant' do
      visit '/'
      login_as @paul
      expect(page).not_to have_link('edit')
    end

    it 'cant delete another users restaurant' do
      visit '/'
      login_as @paul
      expect(page).not_to have_link('delete')
    end

    it 'you cant review if you aint logged in' do
      visit '/'
      click_link 'Review Nandos'
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