# frozen_string_literal: true
require 'rails_helper'

RSpec.describe ControlRegion, type: :model do
	let(:control_region) { FactoryGirl.build :control_region }
	it { expect(control_region).to validate_presence_of(:name) }
	it { expect(control_region).to validate_uniqueness_of(:name) }
end
