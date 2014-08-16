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


describe 'Deleting restaurants' do
    before(:each) do

      @alex = User.create(email: "a@a.com", password: "12345678", password_confirmation:'12345678')
      login_as @alex
      @alex.restaurants.create(name: 'McDonalds',kind:'Restaurant')
    end
     it ' removes restaurants when user clicks the delete link' do
      visit '/restaurants'
      click_link 'Delete McDonalds'
      expect(page).not_to have_content 'McDonalds'
      expect(page).to have_content 'Restaurant deleted successfully'
    end
  end

end