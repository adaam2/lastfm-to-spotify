FactoryGirl.define do
  factory :track do
    title { Faker::Name.name }
    artist
    sequence(:spotify_id) { |n| n + 1 }
  end
end
