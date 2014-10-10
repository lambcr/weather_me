FactoryGirl.define do
  sequence(:email) { |n| "bender#{n}@ilovebender.com" }

  factory :user do
    email
    password "password"
  end
end
