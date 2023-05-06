# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/trainings', type: :request do
  let(:valid_attributes) do
    {
      training_title: FFaker::Lorem.word,
      training_type: FFaker::Lorem.word,
      category_id: create(:category).id
    }
  end

  let(:invalid_attributes) do
    {
      training_title: FFaker::Lorem.word,
      training_type: FFaker::Lorem.word,
      category_id: nil
    }
  end

  let(:valid_headers) do
    {}
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Training.create! valid_attributes
      get trainings_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      training = Training.create! valid_attributes
      get training_url(training), as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Training' do
        expect do
          post trainings_url,
               params: { training: valid_attributes }, headers: valid_headers, as: :json
        end.to change(Training, :count).by(1)
      end

      it 'renders a JSON response with the new training' do
        post trainings_url,
             params: { training: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Training' do
        expect do
          post trainings_url,
               params: { training: invalid_attributes }, as: :json
        end.to change(Training, :count).by(0)
      end

      it 'renders a JSON response with errors for the new training' do
        post trainings_url,
             params: { training: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          training_title: FFaker::Lorem.word
        }
      end

      it 'updates the requested training' do
        training = Training.create! valid_attributes
        patch training_url(training),
              params: { training: new_attributes }, headers: valid_headers, as: :json
        training.reload
        expect(training.training_title).to eq new_attributes[:training_title]
      end

      it 'renders a JSON response with the training' do
        training = Training.create! valid_attributes
        patch training_url(training),
              params: { training: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the training' do
        training = Training.create! valid_attributes
        patch training_url(training),
              params: { training: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested training' do
      training = Training.create! valid_attributes
      expect do
        delete training_url(training), headers: valid_headers, as: :json
      end.to change(Training, :count).by(-1)
    end
  end
end
