require 'rails_helper'

describe 'creating restaurants' do

  context 'logged out' do
    it 'should prompt to sign in' do
      visit '/restaurants'
      click_link 'Add a restaurant'

      expect(page).to have_content 'Log in'
    end
  end

  context 'logged in' do
    before do
    alex = User.create(email: "a@a.com", password: "12345678", password_confirmation: '12345678')
    login_as alex
    end
  end
end