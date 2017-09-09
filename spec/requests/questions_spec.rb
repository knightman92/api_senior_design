require 'rails_helper'

RSpec.describe 'Questions API', type: :request do
  let!(:questions) { create_list(:question, 10)}
  let!(:question_id) {questions.first.id}

  describe 'GET /questions' do
    before { get '/questions' }

    it 'returns questions' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /questions/:id' do
    before { get "/questions/#{question_id}"}

    context 'when the record exists' do
      it 'returns the question' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(question_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
    context 'when the record does not exist' do
      let(:question_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Question/)
      end
    end
  end

  describe 'POST /questions' do
    # valid payload
    # let(:valid_attributes) { { title: 'Learn Elm', created_by: '1' } }
    let(:valid_attributes) { { category: '1', age_range: '1', gender: '1', question_type: '1', options: 'testing', question_text: 'This is a question', coach_id: '1', player_id: '2' } }

    context 'when the request is valid' do
      before { post '/questions', params: valid_attributes }

      it 'creates a question' do
        expect(json['question_text']).to eq('This is a question')
        # expect(json['last_name']).to eq('Stokes')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/questions', params: { question_text: 'What is this?' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Player must exist, Coach must exist, Category can't be blank, Age range can't be blank, Gender can't be blank, Question type can't be blank/)
      end
    end
  end

  describe 'PUT /questions/:id' do
    let(:valid_attributes) { { category: '2', age_range: '2', gender: '2', question_type: '2', options: 'stilltesting', question_text: 'Another question?', coach_id: '2', player_id: '3' } }

    context 'when the record exists' do
      before { put "/questions/#{question_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE /questions/:id' do
    before { delete "/questions/#{question_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end