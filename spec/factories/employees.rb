# frozen_string_literal: true

FactoryBot.define do
  factory :employee do
    full_name { FFaker::Lorem.word }
    email { FFaker::Lorem.word }
    department { FFaker::Lorem.word }
    location { FFaker::Lorem.word }
  end
end
