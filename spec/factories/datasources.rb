require "faker"

FactoryGirl.define do
  factory :datasource do
    name { Faker::Name.name }
  end
end
