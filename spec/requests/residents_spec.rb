require 'rails_helper'

RSpec.describe 'Residents', type: :request do
  def create_residents
    FactoryBot.create_list(:resident, 1)
  end

  it 'GET /index' do
    create_residents
    get '/residents'

    expect(response).to have_http_status(:ok)
  end

  it 'creates a Resident and redirects to the Resident index page' do
    resident_attributes = FactoryBot.attributes_for(:resident)

    get '/residents/new'
    expect(response).to render_template('new')

    post '/residents', params: { resident: resident_attributes }

    expect(response).to redirect_to(residents_path)
  end
end
