
FactoryGirl.define do
  factory :ap_model do
    sequence(:name) { |n| "ApModel #{n}" }
  end
end
