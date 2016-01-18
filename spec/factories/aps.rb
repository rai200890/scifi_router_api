FactoryGirl.define do
  factory :ap do
    sequence(:name) { |n| "Ap #{n}" }
    ap_model
    ap_status
    control_region
    location
  end
end
