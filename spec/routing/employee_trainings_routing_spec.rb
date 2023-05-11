# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EmployeeTrainingsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/employee_trainings').to route_to('employee_trainings#index')
    end

    it 'routes to #show' do
      expect(get: '/employee_trainings/1').to route_to('employee_trainings#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/employee_trainings').to route_to('employee_trainings#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/employee_trainings/1').to route_to('employee_trainings#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/employee_trainings/1').to route_to('employee_trainings#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/employee_trainings/1').to route_to('employee_trainings#destroy', id: '1')
    end
  end
end
