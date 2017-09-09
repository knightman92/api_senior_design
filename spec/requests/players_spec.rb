require 'rails_helper'

RSpec.describe 'Players API', type: :request do
	let!(:players) { create_list(:player, 10)}
	let!(:player_id) {players.first.id}

	describe 'GET /players' do
		before { get '/players' }

		it 'returns players' do
			expect(json).not_to be_empty
			expect(json.size).to eq(10)
		end

		it 'returns status code 200' do
			expect(response).to have_http_status(200)
		end
	end

	describe 'GET /players/:id' do
		before { get "/players/#{player_id}"}

		context 'when the record exists' do
			it 'returns the player' do
				expect(json).not_to be_empty
        expect(json['id']).to eq(player_id)
			end

			it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
		end
		context 'when the record does not exist' do
      let(:player_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Player/)
      end
    end
	end

	describe 'POST /players' do
    # valid payload
    # let(:valid_attributes) { { title: 'Learn Elm', created_by: '1' } }
    let(:valid_attributes) { { first_name: 'john' , last_name: 'smith', email: 'johnsmith@gmail.com', encrypted_password: 'password', phone: '407-555-5555', gender: '1', points: '0', coach_id: '1', age: '18'} }

    context 'when the request is valid' do
      before { post '/players', params: valid_attributes }

      it 'creates a player' do
        expect(json['first_name']).to eq('john')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/players', params: { first_name: 'mark' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Coach must exist, Last name can't be blank, Email can't be blank, Encrypted password can't be blank, Phone can't be blank, Gender can't be blank, Points can't be blank/)
      end
    end
  end

  describe 'PUT /players/:id' do
    let(:valid_attributes) { { first_name: 'john' , last_name: 'smith', email: 'johnsmith@gmail.com', encrypted_password: 'password', phone: '407-555-5555', gender: '1', points: '0', coach_id: '1' , age: '18' } }

    context 'when the record exists' do
      before { put "/players/#{player_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE /players/:id' do
    before { delete "/players/#{player_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end