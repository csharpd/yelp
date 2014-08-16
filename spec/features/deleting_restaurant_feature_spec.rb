describe 'Deleting restaurants' do
    before(:each) do
       @alex = User.create(email: "a@a.com", password: "12345678", password_confirmation:'12345678')
        @alex.restaurants.create(name: 'McDonalds', kind:'Restaurant')
    end

    context 'logged in as the restaurant creator' do
      before do
        login_as @alex
      end

      it ' lets a user delete a restaurant' do
        visit '/restaurants'
        click_link 'Delete McDonalds'

        expect(page).not_to have_content 'McDonalds'
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
      click_link 'Delete McDonalds'

      expect(page).to have_content 'This is not your restaurant!'
    end
  end
end