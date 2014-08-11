require 'rails_helper'

describe 'restaurants' do
  context 'no restaurants have been added' do
    it 'should display a prompt to add a restaurant' do
      visit '/restaurants'
      expect(page).to have_content 'No restaurants have been added yet'
      expect(page).to have_link 'Add a restaurant'
    end
  end

  context 'restaurants can be added' do
    before(:each) do
      Restaurant.create(name: 'McDonalds')
    end

    it 'should display them' do
      visit '/restaurants'
      expect(page).to have_content 'McDonalds'
    end
  end


end