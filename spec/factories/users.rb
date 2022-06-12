FactoryBot.define do
  factory :user do
    staff_number            { Faker::Number.number(digits: 5) }
    email                   { Faker::Internet.free_email }
    password                { 'pass1234' }
    password_confirmation   {password}
  end
end