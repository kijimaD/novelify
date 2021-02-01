FactoryBot.define do
  factory :story do
    sequence(:title) { |n| "TEST_TITLE#{n}" }
  end
end
