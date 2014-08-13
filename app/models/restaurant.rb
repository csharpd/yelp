class Restaurant < ActiveRecord::Base
  has_many :reviews, dependent: :destroy

  def average_rating
    return 'N/A' if reviews.none?
    reviews.inject(0) do |sum, review|
      sum + review.rating
    end / reviews.count.to_f
    #faster way --> reviews.average(:rating)
  end

end
