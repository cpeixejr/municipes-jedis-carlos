require 'rails_helper'

RSpec.describe Resident, type: :model do
  it 'should create a valid resident' do
    resident = build(:resident)
    expect(resident).to be_valid
  end

  it 'should validates the email' do
    resident = build(:resident, email: 'invalid_email')
    expect(resident).to_not be_valid

    resident = build(:resident, email: nil)
    expect(resident).to_not be_valid
  end

  it 'should validates the cpf' do
    resident = build(:resident, cpf: '11111111112')
    expect(resident).to_not be_valid

    resident = build(:resident, cpf: nil)
    expect(resident).to_not be_valid
  end

  it 'should validates the cns' do
    resident = build(:resident, cns: '11111111111111')
    expect(resident).to_not be_valid

    resident = build(:resident, cns: nil)
    expect(resident).to_not be_valid
  end

  it 'should validates the birth_date' do
    resident = build(:resident,
                     birth_date: Faker::Date.between(from: 124.years.ago, to: 121.years.ago))
    expect(resident).to_not be_valid

    resident = build(:resident,
                     birth_date: Faker::Date.between(from: Date.today + 1, to: Date.today + 4))
    expect(resident).to_not be_valid

    resident = build(:resident, birth_date: nil)
    expect(resident).to_not be_valid
  end

  it 'should validates the presence of phone number' do
    resident = build(:resident, phone: nil)
    expect(resident).to_not be_valid
  end
end
