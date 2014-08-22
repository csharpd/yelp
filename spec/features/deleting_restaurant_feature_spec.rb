describe 'Deleting restaurants' do
    before(:each) do
        @alex = create(:user)
        create(:mcdonalds, user: @alex)
    end

    context 'logged in as the restaurant creator' do
      before do
        login_as @alex
      end

      it ' lets a user delete a restaurant' do
        visit '/restaurants'
        click_link 'Delete'

        expect(page).not_to have_content 'McDonalds'
        expect(current_path).to eq '/restaurants'
      end
    end

  context 'logged in as another user' do
    before do
      chloe = create(:chloe)
      login_as chloe
    end

    it 'should display an error' do
      visit '/restaurants'
      click_link 'Delete'

      expect(page).to have_content 'This is not your restaurant!'
    end
  end
end