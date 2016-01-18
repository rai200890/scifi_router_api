FactoryGirl.define do
  factory :ap_status do
    sequence(:name) { |n| "ApStatus #{n}" }
  end
end
