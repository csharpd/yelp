class Review < ActiveRecord::Base
  VALID_RATINGS = (1..5)

  belongs_to :restaurant
  belongs_to :user
  validates :rating, inclusion: VALID_RATINGS
  validates :restaurant_id, presence: true
  validates :user_id, uniqueness: {scope: :restaurant_id, message: 'has already written a review'}
end
