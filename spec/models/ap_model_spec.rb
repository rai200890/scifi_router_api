require 'rails_helper'

RSpec.describe ApModel, type: :model do
  let(:ap_model){ FactoryGirl.build :ap_model }
  it { expect(ap_model).to validate_presence_of(:name) }
  it { expect(ap_model).to validate_uniqueness_of(:name) }
end
