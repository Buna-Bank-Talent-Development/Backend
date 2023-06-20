# frozen_string_literal: true

FactoryBot.define do
  factory :training do
    training_title { FFaker::Lorem.word }
    training_type { FFaker::Lorem.word }
    parent_category { FFaker::Lorem.word }
    category factory: :category
  end
end
