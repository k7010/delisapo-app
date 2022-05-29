FactoryBot.define do
  factory :baggage do
    address       { '東京都品川区大井町' }
    building      { 'マンション名' }
    block         { '1-2-4' }
    family_name   { Faker::Name.last_name }
    first_name    { Faker::Name.first_name }
    association :user
  end
end
