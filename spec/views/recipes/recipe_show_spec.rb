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
    
      @recipe1 = @danny.recipes.create!(name: 'Recipe Test', description: 'This is a test recipe', preparationTime: 15.0, cookingTime: 15.0, public: true)
      visit recipe_path(@recipe1)
      expect(page).to have_current_path(recipe_path(@recipe1))
      
    end

    it 'specifi Recipe page shows the right content' do
      expect(page).to have_content('Recipe Test')
      expect(page).to have_content('Preparation time: 15.0 min')
      expect(page).to have_content('Cooking time: 15.0 min')
      expect(page).to have_content('Generate Shopping list')
      expect(page).to have_content('Add ingredient')
    end

    it 'Click on add ingredient will redirect to the right path ' do
        click_link 'Add ingredient'
        expect(page).to have_current_path(new_recipe_recipe_food_path(@recipe1))
    end

    it 'Click on Generate Shopping list will redirect to the right path  ' do
        click_link 'Generate Shopping list'
        expect(page).to have_current_path(recipe_shopping_lists_path(@recipe1.id))
    end
    
    it 'specifi Recipe page shows the ingredient table' do
        expect(page).to have_content('Food')
        expect(page).to have_content('Quantity')
        expect(page).to have_content('Value')
        expect(page).to have_content('Action')
      end
  end
end
