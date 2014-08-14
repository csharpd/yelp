
require 'rails_helper'

describe 'reviewing restaurants' do
  before do
    @honey = Restaurant.create(name: 'Honey & Co', street: '25a Warren St', city: 'London', postcode: 'W1T 5LZ', tel: '0207 388 6175', kind: 'Restaurant', description: 'Middle Eastern')
    alex = User.create(email: "a@a.com", password: "12345678", password_confirmation:'12345678')
    login_as alex

  end

  it 'allows users to leave reviews using a form, which appear alongside restaurants' do
    visit restaurants_path
    click_link 'Review Honey & Co'
    fill_in 'Thoughts', with: 'So so'
    select '3', from: 'Rating'
    click_button 'Leave review'

    expect(current_path).to eq restaurants_path
    expect(page).to have_content 'So so (★★★☆☆)'
  end

  it 'display the average rating from all reviews' do
    leave_review(@honey,'So so', 3)
    leave_review(@honey,'Great', 5)
    expect(page).to have_content 'Average rating: ★★★★☆'
  end

  context 'as a user logged out' do
    it 'should not see an option to review a restaurant' do
      logout(:user)
      visit restaurants_path(@honey)
      expect(page).not_to have_button 'Leave Review'
    end

    it 'allows users to leave reviews using a form which appear alongside restaurants' do
      leave_review(@honey, 'Yummy', 5)
      expect(page).to have_content 'Yummy'
    end
  end
end

