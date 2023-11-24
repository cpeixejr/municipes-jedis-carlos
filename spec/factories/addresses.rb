FactoryBot.define do
  factory :address do
    zip_code { Faker::Number.number(digits: 8) }
    street { Faker::Address.street_address }
    secondary_address { Faker::Address.secondary_address }
    neighborhood { Faker::Address.community }
    city { Faker::Address.city }
    state { Faker::Address.state_abbr }
    ibge_code { (Faker::Number.number(digits: 8) if Faker::Boolean.boolean) }
    resident
  end
end
