
# frozen_string_literal: true
FactoryGirl.define do
	factory :ap_model do
		sequence(:name) { |n| "ApModel #{n}" }
	end
end
