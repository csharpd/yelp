require 'rails_helper'

describe 'restaurants' do
  context 'no restaurants have been added at start' do
    it 'should display a prompt to add a restaurant' do
      visit '/restaurants'
      expect(page).to have_content 'No restaurants yet'
      expect(page).to have_link 'Add a restaurant'
    end
  end

  context 'logged out' do
    it 'should prompt to sign in' do
      visit '/restaurants'
      click_link 'Add a restaurant'

      expect(page).to have_content 'Log in'
    end
  end

  describe 'Editing restaurants' do
    before(:each) do
      Restaurant.create(name: 'McDonalds')
       alex = User.create(email: "a@a.com", password: "12345678", password_confirmation:'12345678')
      login_as alex
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
       alex = User.create(email: "a@a.com", password: "12345678", password_confirmation:'12345678')
      login_as alex
    end
     it ' removes restaurants when user clicks the delete link' do
      visit '/restaurants'
      click_link 'Delete McDonalds'
      expect(page).not_to have_content 'McDonalds'
      expect(page).to have_content 'Restaurant deleted successfully'
    end
  end

end