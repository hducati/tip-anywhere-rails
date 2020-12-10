require 'rails_helper'

describe 'Tips API', type: :request do
  let(:user) { create(:user) }
  let!(:tips) { create_list(:tip, 10, user_id: user.id) }
  let(:tip_id) { tips.first.id }
  let(:headers) { valid_headers }

  describe 'GET /tips' do
    before { get '/tips', params: {}, headers: headers }

    context 'when valid request' do
      it 'returns the tips' do
        expect(json_parse).not_to be_empty
      end

      it 'return the quantity of data' do
        expect(json_parse).to eq(10)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'GET /tips/:id' do
    before { get "/tips/#{tip_id}" }

    context 'when valid request' do
      it 'returns the tip' do
        expect(json_parse['id']).to eq(tip_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when invalid request' do
      let(:tip_id) { 200 }

      it 'returns status code 404' do
        expect(response).to have_http_status(:not_found)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find/)
      end
    end
  end

  describe 'POST /tips' do
    let(:valid_attributes) { attributes_for(:tip, status: 'Red') }

    context 'when valid request' do
      before { post '/tips', params: valid_attributes, headers: headers }

      it 'creates a tip' do
        expect(json_parse['id']).not_to be_nil
      end

      it 'returns a status code 201' do
        expect(response).to have_http_status(:created)
      end
    end
  end
end
