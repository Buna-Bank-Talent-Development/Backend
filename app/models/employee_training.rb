# frozen_string_literal: true

class EmployeeTraining < ApplicationRecord
  belongs_to :employee
  belongs_to :training

  validates :season, presence: true
end
