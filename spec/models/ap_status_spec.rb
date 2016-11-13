# frozen_string_literal: true
require 'rails_helper'

RSpec.describe ApStatus, type: :model do
  let(:ap_status) { FactoryGirl.build :ap_status }
  it { expect(ap_status).to validate_presence_of(:name) }
  it { expect(ap_status).to validate_uniqueness_of(:name) }
end
