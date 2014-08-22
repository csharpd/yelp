FactoryGirl.define do
  factory :restaurant do
    name 'The Fat Duck'
    kind 'Restaurant'

    factory(:mcdonalds) {name 'McDonalds'}
  end
end