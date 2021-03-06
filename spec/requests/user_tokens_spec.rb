# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'UserTokens', type: :request do
  describe('POST /sessions') do
    let!(:user) { create(:user) }
    let(:headers) { valid_headers.except('Authorization') }

    let(:valid_credentials) do
      {
        email: user.email,
        password: user.password
      }.to_json
    end

    let(:invalid_credentials) do
      {
        email: Faker::Internet.email,
        password: Faker::Internet.password
      }.to_json
    end

    context 'when request is valid' do
      before { post '/sessions', params: valid_credentials, headers: headers }

      it 'returns an authentication token' do
        expect(json_parse['auth_token']).not_to be_nil
      end
    end

    context 'when request is invalid' do
      before { post '/sessions', params: invalid_credentials, headers: headers }

      it 'returns a failure message' do
        expect(json_parse['message']).to match(/Invalid credentials/)
      end
    end
  end
end
