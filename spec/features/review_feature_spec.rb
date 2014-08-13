
require 'rails_helper'

describe 'reviewing restaurants' do
  before do
    Restaurant.create(name: 'KFC')
  end

  it 'allows users to leave reviews using a form, which appear alongside restaurants' do
    visit restaurants_path
    click_link 'Review KFC'
    fill_in 'Thoughts', with: 'So so'
    select '3', from: 'Rating'
    click_button 'Leave review'

    expect(current_path).to eq restaurants_path
    expect(page).to have_content 'So so (3)'
  end
end

describe '#average_rating method' do
  let(:restaurant) {Restaurant.create(name: 'The Fat Duck')}

  context ' no reviews' do
    it 'should return N/A' do
      expect(restaurant.average_rating).to eq 'N/A'
    end
  end

  context 'one review' do
    it 'should return rating' do
      restaurant.reviews.create(rating: 2)
      expect(restaurant.average_rating).to eq 2
    end
  end

  context 'multiple reviews' do
    it 'should return the average rating' do
      restaurant.reviews.create(rating: 3)
      restaurant.reviews.create(rating: 5)
      expect(restaurant.average_rating).to eq 4
    end
  end

    it 'should return a float if avg not an integer' do
        restaurant.reviews.create(rating: 4)
        restaurant.reviews.create(rating: 5)
        expect(restaurant.average_rating).to eq 4.5
    end
end