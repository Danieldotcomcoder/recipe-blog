require 'rails_helper'

RSpec.describe 'Food', type: :feature do
  describe 'index page' do
    before(:each) do
      visit user_session_path
      @danny = User.create!(name: 'Dan',
                            email: 'dan@gmail.com',
                            password: '1234567',
                            password_confirmation: '1234567')
  
      within('#new_user') do
        fill_in 'Email', with: 'dan@gmail.com'
        fill_in 'Password', with: '1234567'
      end
      click_button 'Log in'
    end

    it 'expect page path to be the root path' do
      expect(page).to have_current_path root_path
    end

    it 'Foods page shows the right content' do
      visit foods_path
      expect(page).to have_content('Food')
      expect(page).to have_content('Measurement Unit')
      expect(page).to have_content('Unit Price')
      expect(page).to have_content('Actions')
    end

    it 'clicking on add food link should go to add food page' do
      click_link 'Add Food'
      expect(page). to have_current_path new_food_url
    end
    
  end
end
