FactoryBot.define do
  factory :user do
    staff_number            { '12345' }
    email                   { Faker::Internet.free_email }
    password                {Faker::Internet.password}
    password_confirmation   {password}
  end
end