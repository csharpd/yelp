require 'rails_helper'

RSpec.describe Restaurant, :type => :model do

   let(:restaurant) {create(:restaurant)}
   let(:usera) {create(:user)}
   let(:userb) {create(:chloe)}

    describe '#average_rating method' do

      context ' no reviews' do
        it 'should return N/A' do
          expect(restaurant.average_rating).to eq 'N/A'
        end
      end

      context 'one review' do
        it 'should return rating' do
          restaurant.reviews.create(rating: 2, user: usera)
          expect(restaurant.average_rating).to eq 2
        end
      end

      context 'multiple reviews' do
        it 'should return the average rating' do
          restaurant.reviews.create(rating: 3, user: usera)
          restaurant.reviews.create(rating: 5, user: userb)
          expect(restaurant.average_rating).to eq 4
        end
      end

        it 'should return a float if avg not an integer' do
            restaurant.reviews.create(rating: 4, user: usera)
            restaurant.reviews.create(rating: 5, user: userb)
            expect(restaurant.average_rating).to eq 4.5
        end
    end

    describe 'validations' do
      it 'is valid with a unique name > 2 characters,starting with a capital letter ' do
        restaurant = create(:restaurant)
        expect(restaurant).to have(:no).error_on(:name)

      end

      it 'is not valid with a name of <2 characters' do
        restaurant = Restaurant.new(name: 'Ab', kind: 'Restaurant')
        expect(restaurant).to have(1).error_on(:name)
      end

      it 'is not valid if the name does not start with an uppercase letter' do
        restaurant = Restaurant.new(name: 'nandos', kind: 'Restaurant')
        expect(restaurant).to have(1).error_on(:name)
      end

       it 'is not valid if the name is not unique' do
        Restaurant.create(name: 'Nandos', kind: 'Restaurant')
        restaurant = Restaurant.new(name: 'Nandos', kind: 'Restaurant')
        expect(restaurant).to have(1).error_on(:name)
      end

        it 'is not valid if the kind isnt Restaurant, Market or Shop' do
        restaurant = Restaurant.create(name: 'Nandos', kind:'fastfoodjoint')
        expect(restaurant).to have(1).error_on(:kind)
      end
    end
end
