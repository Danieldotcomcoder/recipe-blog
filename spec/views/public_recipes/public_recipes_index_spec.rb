require 'rails_helper'

RSpec.describe 'Recipe', type: :feature do
  describe 'index page' do
    before(:each) do
      visit user_session_path
      @danny = User.create!(name: 'Dan',
                            email: 'dan@gmail.com',
                            password: '1234567',
                            password_confirmation: '1234567')

      fill_in 'Email', with: 'dan@gmail.com'
      fill_in 'Password', with: '1234567'

      click_button 'Log in'

      @recipe1 = @danny.recipes.create!(name: 'Recipe Test', description: 'This is a test recipe',
                                        preparationTime: 15.0, cookingTime: 15.0, public: true)
      visit public_recipes_path
      expect(page).to have_current_path(public_recipes_path)
    end

    it 'Public Recipe page shows the right content' do
      expect(page).to have_content('Recipe Test')
      expect(page).to have_content('Total food items:')
      expect(page).to have_content('Total price:')
    end

    it 'click on recipe name will redirect to recipe details' do
      click_link 'Recipe Test'
      expect(page).to have_current_path(recipe_path(@recipe1))
    end
  end
end
