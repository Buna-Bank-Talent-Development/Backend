# frozen_string_literal: true

FactoryBot.define do
  factory :employee_training do
    employee factory: :employee
    training factory: :training
    season { FFaker::Lorem.word }
  end
end
