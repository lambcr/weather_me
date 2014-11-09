FactoryGirl.define do
  sequence(:email) { |n| "bender#{n}@ilovebender.com" }

  factory :user do
    email
    password "password"
  end

  factory :alert_schedule do
    name    'To John'
    address 'St Petersburg, FL'
    creator factory: :user
  end
end
