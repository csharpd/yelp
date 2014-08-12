
require 'rails_helper'

describe 'reviewing restaurants' do
  before do
    Restaurant.create(name: 'KFC')
  end

  it 'allows users to leave reviews using a form, which appear alongside restaurants' do
    visit restaurants_path
    click_link 'Review KFC'
    fill_in 'Thoughts', with: 'So so'
    select '3', from: 'Raiting'
    click_button 'Leave review'

    expect(current_path).to eq restaurants_path
    expect(page).to have_content 'So so (3)'
  end
end