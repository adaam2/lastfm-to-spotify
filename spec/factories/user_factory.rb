FactoryGirl.define do
  factory :user do
    lastfm_profile_image_url { Faker::Internet.url }
    lastfm_registration_date { Faker::Date.backward(200) }

    trait :with_imports do
      after(:build) do |user|
        user.imports = create_list(:import, 5)
      end
    end
  end
end
