# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Department, type: :model do
  let(:department) { FactoryGirl.build :department }
  it { expect(department).to validate_presence_of(:name) }
  it { expect(department).to validate_uniqueness_of(:name).scoped_to(:campus_id) }
  it { expect(department).to validate_presence_of(:campus_id) }
end
