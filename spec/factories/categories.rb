FactoryBot.define do
  factory :category do
    name { FFaker::Lorem.word }
    ancestry { nil }
  end
end
