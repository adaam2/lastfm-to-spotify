FactoryGirl.define do
  factory :import do
    name { Faker::Name.name }
    user
    active { true }
    processed { false }
    processed_date { nil }

    transient do
      tracks []
    end

    after :build do |import, evaluator|
      import.tracks << evaluator.tracks
      import.save
    end
  end
end
