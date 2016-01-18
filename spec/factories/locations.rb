FactoryGirl.define do
  factory :location do
    sequence(:name) { |n| "Location #{n}" }
    floor
  end
end
