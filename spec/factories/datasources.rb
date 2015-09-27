require 'faker'

FactoryGirl.define do
  factory :datasource, class: Datasource do
    name { Faker::Name.name }
  end

end
