def leave_review(restaurant, thoughts, rating)
  visit restaurants_path(restaurant)
  click_link 'Review Honey & Co'
  fill_in 'Thoughts', with: thoughts
  select rating.to_s, from: 'Rating'
  click_button 'Leave review'
end