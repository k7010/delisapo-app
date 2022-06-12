FactoryBot.define do
  factory :baggage do
    address             { '東京都品川区大井町' }
    block               { '1-2-4' }
    building            { 'マンション名' }
    family_name         { Faker::Name.last_name }
    first_name          { Faker::Name.first_name }
    time_specification  { '午前中'}
    association :user
  end
end
