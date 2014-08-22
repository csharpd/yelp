
require 'rails_helper'

describe 'Reviewing restaurants' do
  before do
       @alex = create(:user)
       login_as @alex
       create(:mcdonalds, user: @alex)

  end

  it 'allows users to leave reviews using a form, which appear alongside restaurants' do
    leave_review('So so', 3)

    expect(current_path).to eq restaurants_path
    expect(page).to have_content 'So so (★★★☆☆)'
  end

  it 'display the average rating from all reviews' do
    leave_review('So so', 3)
     chloe = create(:chloe)
      login_as chloe
    leave_review('Great', 5)
    expect(page).to have_content 'Average rating: ★★★★☆'
  end

   it 'does not allower users to write duplicate reviews' do
    leave_review('So so', 3)
    expect(page).not_to have_link 'Review'
  end

  context 'as a user logged out' do
    it 'should not see an option to review a restaurant' do
      logout(:user)
      visit restaurants_path
      expect(page).not_to have_link 'Leave Review'
    end

  end
end

