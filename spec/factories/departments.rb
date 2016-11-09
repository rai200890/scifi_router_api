# frozen_string_literal: true
FactoryGirl.define do
	factory :department do
		sequence(:name) { |n| "Building #{n}" }
		campus
	end
end
