require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ReviewsHelper. For example:
#
# describe ReviewsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ReviewsHelper, :type => :helper do
  describe '#star_rating' do
    it 'does nothing if the rating is not a number' do
      expect(helper.star_rating('N/A')).to eq 'N/A'
    end

    it 'returns 5 stars if rating is 5' do
      expect(helper.star_rating(5)).to eq '★★★★★'
    end

    it 'returns 3 black stars and one white star if rating is 3' do
      expect(helper.star_rating(3)).to eq '★★★☆☆'
    end
  end
end
