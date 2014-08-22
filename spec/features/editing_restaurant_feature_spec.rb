require 'rails_helper'


  describe 'Editing restaurants' do
    before(:each) do
        @alex = create(:user)
        create(:mcdonalds, user: @alex)
    end

    context 'logged in as the restaurant creator' do
      before do
        login_as @alex
      end

      it ' lets a user edit a restaurant' do
        visit '/restaurants'
        click_link 'Edit'

        fill_in 'Name', with: 'MaccyDs'
        click_button 'Update Restaurant'

        expect(page).to have_content 'MaccyDs'
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
      click_link 'Edit'

      expect(page).to have_content 'This is not your restaurant!'
    end
  end
end


