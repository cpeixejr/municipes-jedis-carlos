require 'rails_helper'

RSpec.describe Address, type: :model do
  it 'should create a valid address' do
    address = build(:address)
    expect(address).to be_valid
  end

  it 'should validates the presence of zip code' do
    address = build(:address, zip_code: nil)
    expect(address).to_not be_valid
  end

  it 'should validates the presence of street' do
    address = build(:address, street: nil)
    expect(address).to_not be_valid
  end

  it 'should validates the presence of neighborhood' do
    address = build(:address, neighborhood: nil)
    expect(address).to_not be_valid
  end

  it 'should validates the presence of city' do
    address = build(:address, city: nil)
    expect(address).to_not be_valid
  end

  it 'should validates the presence of state' do
    address = build(:address, state: nil)
    expect(address).to_not be_valid
  end
end
