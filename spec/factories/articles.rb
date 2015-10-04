FactoryGirl.define do
  factory :article do
    title { Faker::Book.title }
    text { Faker::Lorem.paragraph }

    trait :with_comments do
      ignore do
        commenter { user }
      end

      after(:create) do |article, evaluator|
        FactoryGirl.create_list(:comment, 3, article: article, user: evaluator.commenter)
      end
    end
  end
end
