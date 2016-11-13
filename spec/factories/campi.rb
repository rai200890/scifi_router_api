# frozen_string_literal: true
FactoryGirl.define do
  factory :campus do
    sequence(:name) { |n| "Campus #{n}" }
  end
end
