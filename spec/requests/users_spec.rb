require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  let!(:users) { create_list(:user, 10) }
  let(:user_id) { users.first.id }

  describe 'GET /users' do
    before { get '/users' }

    it 'returns users' do
      expect(json_parse).not_to be_empty
      expect(json_parse.size).to eq(10)
    end

    it 'return status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /users/:id' do
    before { get "/users/#{user_id}"}

    context 'when the record exists' do
      it 'returns the user' do
        expect(json_parse).not_to be_empty
        expect(json_parse['id']).to eq(user_id)
      end

      it 'return status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:user_id) { 100 }

      it 'return status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'return a not found message' do
        expect(response.body).to match(/Couldn't find User/)
      end
    end
  end

  describe 'POST /users' do
    let(:valid_attributes) { { 
      name: 'Henrique Ducati', 
      birthday_date: '2018-04-04',
      email: 'henrique@gmail.com',
      password: '1231232131'}}

    context 'when the request is valid' do
      before { post '/users', params: valid_attributes}

      it 'creates a new user' do
        expect(json_parse['name']).to eq('Henrique Ducati')
        expect(json_parse['birthday_date']).to eq('2018-04-04')
        expect(json_parse['email']).to eq('henrique@gmail.com')
        expect(json_parse['password']).to eq('1231232131')
      end

      it 'return status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/users', params: {
        name: 'Henrique Ducati', 
        email: 'henrique@gmail.com',
        password: '1231232131' }}
      
        it 'returns status code 422' do
          expect(response).to have_http_status(422)
        end

        it 'returns a validation failure message' do
          expect(response.body).to match(
            /Validation failed: Birthday date can't be blank/)
        end
    end
  end

  describe 'PUT /users/:id' do
    let(:valid_attributes) { { name: 'Henrique Ducati'} }
    
    context 'when the record exists' do
      before { put "/users/#{user_id}", params: valid_attributes}

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE /users/:id' do
    before { delete "/users/#{user_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end