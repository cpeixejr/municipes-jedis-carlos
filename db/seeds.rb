# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'
require 'cpf_faker'

20.times do |_i|
  resident = Resident.create!(full_name: Faker::Name.name_with_middle, cpf: Faker::CPF.numeric,
                              cns: '187329617340002', email: Faker::Internet.email,
                              birth_date: Faker::Date.between(from: 120.years.ago, to: Date.today),
                              phone: Faker::PhoneNumber.phone_number_with_country_code, is_active: Faker::Boolean.boolean)
  Address.create!(zip_code: Faker::Number.number(digits: 8), street: Faker::Address.street_address,
                  secondary_address: Faker::Address.secondary_address, neighborhood: Faker::Address.community,
                  city: Faker::Address.city, state: Faker::Address.state_abbr,
                  ibge_code: (Faker::Number.number(digits: 8) if Faker::Boolean.boolean),
                  resident:)
end
