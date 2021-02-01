FactoryBot.define do
  factory :card do
    sequence(:image) { |n| "TEST_IMAGE#{n}" }
    story
  end
end
