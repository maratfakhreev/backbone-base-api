FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    email
    password "123456"
  end
end
