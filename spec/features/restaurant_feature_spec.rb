require 'rails_helper'

describe 'restaurants' do
  context 'no restaurants have been added at start' do
    it 'should display a prompt to add a restaurant' do
      visit '/restaurants'
      expect(page).to have_content 'No restaurants yet'
      expect(page).to have_link 'Add a restaurant'
    end
  end

  context 'Adding restaurants' do
    before(:each) do
      Restaurant.create(name: 'Honey & Co', street: '25a Warren St', city: 'London', postcode: 'W1T 5LZ', tel: '0207 388 6175', kind: 'Restaurant', description: 'Middle Eastern')
    end

    it 'should display them with all the details' do
      visit '/restaurants'
      expect(page).to have_content 'Honey & Co'
      expect(page).to have_content '25a Warren St'
      expect(page).to have_content 'London'
      expect(page).to have_content 'W1T 5LZ'
      expect(page).to have_content '0207 388 6175'
      expect(page).to have_content 'Restaurant'
      expect(page).to have_content 'Middle Eastern'
    end
  end

  describe 'Creating restaurants' do
    it 'prompts the user to fill out a form, then displays the new restaurant' do

      visit '/restaurants'
      click_link 'Add a restaurant'

      fill_in 'Name', with: 'Honey & Co'
      fill_in 'Street', with: '25a Warren St'
      fill_in 'City', with: 'London'
      fill_in 'Postcode', with: 'W1T 5LZ'
      fill_in 'Tel', with: '0207 388 6175'
      fill_in 'Kind', with: 'Restaurant'
      fill_in 'Description', with: 'Middle Eastern'
      click_button 'Create Restaurant'

      expect(page).to have_content 'Honey & Co'
      expect(page).to have_content '25a Warren St'
      expect(page).to have_content 'London'
      expect(page).to have_content 'W1T 5LZ'
      expect(page).to have_content '0207 388 6175'
      expect(page).to have_content 'Restaurant'
      expect(page).to have_content 'Middle Eastern'
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