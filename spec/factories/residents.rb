FactoryBot.define do
  factory :resident do
    full_name { Faker::Name.name_with_middle }
    cpf { Faker::CPF.numeric }
    cns { '187329617340002' }
    email { Faker::Internet.email }
    birth_date { Faker::Date.between(from: 119.years.ago, to: Date.today) }
    phone { Faker::PhoneNumber.phone_number_with_country_code }
    is_active { Faker::Boolean.boolean }
  end
end
