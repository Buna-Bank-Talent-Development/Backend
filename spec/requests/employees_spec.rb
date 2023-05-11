# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/employees', type: :request do
  let(:valid_attributes) do
    {
      full_name: FFaker::Lorem.word,
      email: FFaker::Lorem.word,
      department: FFaker::Lorem.word,
      location: FFaker::Lorem.word
    }
  end

  let(:invalid_attributes) do
    {
      full_name: FFaker::Lorem.word,
      email: FFaker::Lorem.word,
      department: FFaker::Lorem.word,
      location: nil
    }
  end

  let(:valid_headers) do
    {}
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Employee.create! valid_attributes
      get employees_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      employee = Employee.create! valid_attributes
      get employee_url(employee), as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Employee' do
        expect do
          post employees_url,
               params: { employee: valid_attributes }, headers: valid_headers, as: :json
        end.to change(Employee, :count).by(1)
      end

      it 'renders a JSON response with the new employee' do
        post employees_url,
             params: { employee: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Employee' do
        expect do
          post employees_url,
               params: { employee: invalid_attributes }, as: :json
        end.to change(Employee, :count).by(0)
      end

      it 'renders a JSON response with errors for the new employee' do
        post employees_url,
             params: { employee: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          department: FFaker::Lorem.word
        }
      end

      it 'updates the requested employee' do
        employee = Employee.create! valid_attributes
        patch employee_url(employee),
              params: { employee: new_attributes }, headers: valid_headers, as: :json
        employee.reload
        expect(employee.department).to eq new_attributes[:department]
      end

      it 'renders a JSON response with the employee' do
        employee = Employee.create! valid_attributes
        patch employee_url(employee),
              params: { employee: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the employee' do
        employee = Employee.create! valid_attributes
        patch employee_url(employee),
              params: { employee: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested employee' do
      employee = Employee.create! valid_attributes
      expect do
        delete employee_url(employee), headers: valid_headers, as: :json
      end.to change(Employee, :count).by(-1)
    end
  end
end
