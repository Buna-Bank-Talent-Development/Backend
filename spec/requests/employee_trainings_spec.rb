# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/employee_trainings', type: :request do
  let(:valid_attributes) do
    {
      training_id: create(:training).id,
      employee_id: create(:employee).id,
      season: FFaker::Lorem.word
    }
  end

  let(:invalid_attributes) do
    {
      training_id: nil,
      employee_id: nil,
      season: FFaker::Lorem.word
    }
  end

  let(:valid_headers) do
    {}
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      EmployeeTraining.create! valid_attributes
      get employee_trainings_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      employee_training = EmployeeTraining.create! valid_attributes
      get employee_training_url(employee_training), as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new EmployeeTraining' do
        expect do
          post employee_trainings_url,
               params: { employee_training: valid_attributes }, headers: valid_headers, as: :json
        end.to change(EmployeeTraining, :count).by(1)
      end

      it 'renders a JSON response with the new employee_training' do
        post employee_trainings_url,
             params: { employee_training: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new EmployeeTraining' do
        expect do
          post employee_trainings_url,
               params: { employee_training: invalid_attributes }, as: :json
        end.to change(EmployeeTraining, :count).by(0)
      end

      it 'renders a JSON response with errors for the new employee_training' do
        post employee_trainings_url,
             params: { employee_training: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          season: FFaker::Lorem.word
        }
      end

      it 'updates the requested employee_training' do
        employee_training = EmployeeTraining.create! valid_attributes
        patch employee_training_url(employee_training),
              params: { employee_training: new_attributes }, headers: valid_headers, as: :json
        employee_training.reload
        expect(employee_training.season).to eq new_attributes[:season]
      end

      it 'renders a JSON response with the employee_training' do
        employee_training = EmployeeTraining.create! valid_attributes
        patch employee_training_url(employee_training),
              params: { employee_training: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the employee_training' do
        employee_training = EmployeeTraining.create! valid_attributes
        patch employee_training_url(employee_training),
              params: { employee_training: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested employee_training' do
      employee_training = EmployeeTraining.create! valid_attributes
      expect do
        delete employee_training_url(employee_training), headers: valid_headers, as: :json
      end.to change(EmployeeTraining, :count).by(-1)
    end
  end
end
