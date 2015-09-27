require "faker"

FactoryGirl.define do
  factory :datasourcetype do
    name { Faker::Name.name }
  end
end
