require 'rails_helper'

describe 'creating restaurants' do

  context 'a valid restaurants' do
    before(:each) do
      alex = create(:user)
      login_as alex
    end

    it 'prompts the user to fill out a form, then displays the new restaurant' do

      visit '/restaurants'
      click_link 'Add a restaurant'

      fill_in 'Name', with: 'Honey & Co'
      fill_in 'Street', with: '25a Warren St'
      fill_in 'City', with: 'London'
      fill_in 'Postcode', with: 'W1T 5LZ'
      fill_in 'Tel', with: '0207 388 6175'
      select 'Restaurant', :from => 'Kind'
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

  context 'an invalid restaurant' do
     before(:each) do
      alex = create(:user)
      login_as alex
    end
     it 'prompts the user to fill out a form, then displays an error due to an uncapitalised name that is too short' do
      visit '/restaurants'
      click_link 'Add a restaurant'
      fill_in 'Name', with: 'ab'

      click_button 'Create Restaurant'
      expect(page).not_to have_css 'h2', text: 'ab'
      expect(page).to have_content 'errors'
    end
  end
end
