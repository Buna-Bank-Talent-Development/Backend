# frozen_string_literal: true

class EmployeeTraining < ApplicationRecord
  belongs_to :employee
  belongs_to :training

  validates :season, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ['category_id', 'created_at', 'id', 'employee_id', 'training_id', 'season','updated_at']
  end

end
