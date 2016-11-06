FactoryGirl.define do
  factory :department do
    sequence(:name) { |n| "Building #{n}" }
    campus
  end
end
