require 'rails_helper'

RSpec.describe ResidentsController, type: :controller do
  it 'should be able to create a resident' do
    full_name = Faker::Name.name_with_middle

    post :create, params: {
      resident: {
        full_name:,
        cpf: '98835307066',
        cns: '187329617340002',
        email: 'test@test.com',
        phone: '11999999999',
        birth_date: Time.now - 26.years
      }
    }
    expect(Resident.first.full_name).to be == full_name
    expect(response).to redirect_to(residents_path)
  end
end
