# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Campus, type: :model do
	let(:campus) { FactoryGirl.build :campus }
	it { expect(campus).to validate_presence_of(:name) }
	it { expect(campus).to validate_uniqueness_of(:name) }
end
