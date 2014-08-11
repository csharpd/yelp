require 'rails_helper'

describe 'restaurants' do
  context 'no restaurants have been added at start' do
    it 'should display a prompt to add a restaurant' do
      visit '/restaurants'
      expect(page).to have_content 'No restaurants have been added yet'
      expect(page).to have_link 'Add a restaurant'
    end
  end

  context 'Adding restaurants' do
    before(:each) do
      Restaurant.create(name: 'Honey & Co')
    end

    it 'should display them' do
      visit '/restaurants'
      expect(page).to have_content 'Honey & Co'
    end
  end

  describe 'Creating restaurants' do
    it 'prompts the user to fill out a form, then displays the new restaurant' do

      visit '/restaurants'
      click_link 'Add a restaurant'

      fill_in 'Name', with: 'McDonalds'
      click_button 'Create Restaurant'

      expect(page).to have_content 'McDonalds'
      expect(current_path).to eq '/restaurants'
    end
  end

  describe 'Editing restaurants' do
    before(:each) do
      Restaurant.create(name: 'McDonalds')
    end
    it ' lets a user edit a restaurant' do
      visit '/restaurants'
      click_link 'Edit McDonalds'

      fill_in 'Name', with: 'MaccyDs'
      click_button 'Update Restaurant'

      expect(page).to have_content 'MaccyDs'
      expect(current_path).to eq '/restaurants'
    end
  end

describe 'Deleting restaurants' do
    before(:each) do
      Restaurant.create(name: 'McDonalds')
    end
     it ' removes restaurants when user clicks the delete link' do
      visit '/restaurants'
      click_link 'Delete McDonalds'
      expect(page).not_to have_content 'McDonalds'
      expect(page).to have_content 'Restaurant deleted successfully'
    end
  end
end