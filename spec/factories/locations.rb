# frozen_string_literal: true
FactoryGirl.define do
	factory :location do
		sequence(:name) { |n| "Location #{n}" }
		department
	end
end
