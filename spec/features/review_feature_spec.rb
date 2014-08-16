
require 'rails_helper'

describe 'Reviewing restaurants' do
  before do
       @alex = User.create(email: "a@a.com", password: "12345678", password_confirmation:'12345678')
       login_as @alex
        @alex.restaurants.create(name: 'Honey & Co', street: '25a Warren St', city: 'London', postcode: 'W1T 5LZ', tel: '0207 388 6175', kind: 'Restaurant', description: 'Middle Eastern')

  end

  it 'allows users to leave reviews using a form, which appear alongside restaurants' do
    leave_review(@honey,'So so', 3)

    expect(current_path).to eq restaurants_path
    expect(page).to have_content 'So so (★★★☆☆)'
  end

  it 'display the average rating from all reviews' do
    leave_review(@honey,'So so', 3)
     chloe = User.create(email: 'chloe@example.com', password: "12345678910", password_confirmation:'12345678910')
      login_as chloe
    leave_review(@honey,'Great', 5)
    expect(page).to have_content 'Average rating: ★★★★☆'
  end

   it 'does not allower users to write duplicate reviews' do
    leave_review(@honey,'So so', 3)
    expect(page).not_to have_link 'Review Honey & Co'
  end

  context 'as a user logged out' do
    it 'should not see an option to review a restaurant' do
      logout(:user)
      visit restaurants_path(@honey)
      expect(page).not_to have_link 'Leave Review'
    end

  end
end

