FactoryBot.define do
  factory :delivery do
    delivery_result  { '配達済み' }
    association :user
    association :baggage
  end
end
