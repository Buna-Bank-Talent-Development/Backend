# frozen_string_literal: true

class Employee < ApplicationRecord
  validates :full_name, presence: true
  validates :email, presence: true
  validates :department, presence: true
  validates :location, presence: true
end
