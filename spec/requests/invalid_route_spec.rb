# frozen_string_literal: true

require 'rails_helper'

describe 'InvalidRoute' do
  it 'returns status 404' do
    get '/invalid-routes'
    expect(response).to have_http_status(:not_found)
    expect(response.body).to eq 'Invalid route'
  end
end
