# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Location, type: :model do
  let(:location) { FactoryGirl.build :location }
  it { expect(location).to validate_presence_of(:name) }
  it { expect(location).to validate_uniqueness_of(:name).scoped_to(:department_id) }
  it { expect(location).to validate_presence_of(:department_id) }
end
