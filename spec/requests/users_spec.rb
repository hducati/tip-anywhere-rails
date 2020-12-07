# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  let!(:users) { create_list(:user, 10) }
  let(:user_id) { users.first.id }

  describe 'GET /users' do
    before { get '/users' }

    context 'when the request is valid' do
      it 'returns users' do
        expect(json_parse).not_to be_empty
      end

      it 'returns a size' do
        expect(json_parse.size).to eq(10)
      end

      it 'return status code 200' do
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'GET /users/:id' do
    before { get "/users/#{user_id}" }

    context 'when the record exists' do
      it 'returns the user' do
        expect(json_parse['id']).not_to be_empty.and eq(user_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when the record does not exist' do
      let(:user_id) { 100 }

      it 'return status code 404' do
        expect(response).to have_http_status(:not_found)
      end

      it 'return a not found message' do
        expect(response.body).to match(/Couldn't find User/)
      end
    end
  end

  describe 'POST /users' do
    let(:valid_attributes) do
      {
        name: 'Henrique Ducati',
        birthday_date: '2018-04-04',
        email: 'henrique@gmail.com',
        password: '1231232131'
      }
    end

    context 'when the request is valid' do
      before { post '/users', params: valid_attributes }

      it 'creates a new user' do
        expect(json_parse).to have_attributes(
          name: 'Henrique Ducati', birthday_date: '2018-04-04',
          email: 'henrique@gmail.com', password_digest: '1231232131'
        )
      end

      it 'return status code 201' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'when the request is invalid' do
      before do
        post '/users', params: {
          name: 'Henrique Ducati',
          email: 'henrique@gmail.com',
          password: '1231232131'
        }
      end

      it { is_expected.to have_http_status(:unprocessable_entity) }

      it 'returns a validation failure message' do
        expect(response.body).to match(
          /Validation failed/
        )
      end
    end
  end

  describe 'PUT /users/:id' do
    let(:valid_attributes) { { name: 'Henrique Ducati' } }

    context 'when the record exists' do
      before { put "/users/#{user_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(:no_content)
      end
    end
  end
end
