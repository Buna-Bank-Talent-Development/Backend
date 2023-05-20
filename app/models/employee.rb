class Employee < ApplicationRecord
  has_one_time_password
  

  validates :full_name, presence: true
  validates :email, presence: true , uniqueness: true
  validates :department, presence: true
  validates :location, presence: true
  validates :role , presence: true
end
