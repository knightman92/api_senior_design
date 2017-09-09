require 'rails_helper'

RSpec.describe 'Coaches API', type: :request do
  let!(:coaches) { create_list(:coach, 10)}
  let!(:coach_id) {coaches.first.id}

  describe 'GET /coaches' do
    before { get '/coaches' }

    it 'returns coaches' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /coaches/:id' do
    before { get "/coaches/#{coach_id}"}

    context 'when the record exists' do
      it 'returns the coach' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(coach_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
    context 'when the record does not exist' do
      let(:coach_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Coach/)
      end
    end
  end

  describe 'POST /coaches' do
    # valid payload
    # let(:valid_attributes) { { title: 'Learn Elm', created_by: '1' } }
    let(:valid_attributes) { { first_name: 'Brandon' , last_name: 'Stokes', email: 'example@gmail.com', encrypted_password: 'secret', phone: '407-555-1234'} }

    context 'when the request is valid' do
      before { post '/coaches', params: valid_attributes }

      it 'creates a coach' do
        expect(json['first_name']).to eq('Brandon')
        # expect(json['last_name']).to eq('Stokes')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/coaches', params: { first_name: 'bob' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Last name can't be blank, Email can't be blank, Encrypted password can't be blank, Phone can't be blank/)
      end
    end
  end

  describe 'PUT /coaches/:id' do
    let(:valid_attributes) { {first_name: 'Brandon' , last_name: 'Stokes', email: 'thisexample@gmail.com', encrypted_password: 'secret', phone: '407-555-1234' } }

    context 'when the record exists' do
      before { put "/coaches/#{coach_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE /coaches/:id' do
    before { delete "/coaches/#{coach_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end