FactoryGirl.define do
  factory :control_region do
    sequence(:name) { |n| "ControlRegion #{n}" }
  end
end
