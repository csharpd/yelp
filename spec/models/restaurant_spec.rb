require 'rails_helper'

RSpec.describe Restaurant, :type => :model do

   let(:restaurant) {Restaurant.create(name: 'The Fat Duck')}

    describe '#average_rating method' do

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
end
