require 'rails_helper'

describe 'Restaurants' do
  context 'no restaurants have been added at start' do
    it 'should display a prompt to add a restaurant' do
      visit '/restaurants'
      expect(page).to have_content 'No restaurants yet'
      expect(page).to have_link 'Add a restaurant'
    end
  end

  context 'logged out' do
    it 'when a user clicks add a restaurant, should prompt them to sign in' do
      visit '/restaurants'
      click_link 'Add a restaurant'

      expect(page).to have_content 'Log in'
    end
  end




end