require 'rails_helper'


  describe 'Editing restaurants' do
    before(:each) do
       @alex = User.create(email: "a@a.com", password: "12345678", password_confirmation:'12345678')
        @alex.restaurants.create(name: 'McDonalds', kind:'Restaurant')
    end

    context 'logged in as the restaurant creator' do
      before do
        login_as @alex
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

  context 'logged in as another user' do
    before do
      chloe = User.create(email: 'chloe@example.com', password: "12345678910", password_confirmation:'12345678910')
      login_as chloe
    end

    it 'should display an error' do
      visit '/restaurants'
      click_link 'Edit McDonalds'

      expect(page).to have_content 'This is not your restaurant!'
    end
  end
end