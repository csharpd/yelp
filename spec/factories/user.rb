FactoryGirl.define do
  factory :user do
    email 'alex@alex.com'
    password '12345678'
    password_confirmation '12345678'

    factory :chloe do
      email 'chloe@chloe.com'
    end
  end
end