require 'rails_helper'

RSpec.describe Building, type: :model do
  let(:building){ FactoryGirl.build :building }
  it { expect(building).to validate_presence_of(:name) }
  it { expect(building).to validate_uniqueness_of(:name).scoped_to(:campus_id) }
  it { expect(building).to validate_presence_of(:campus_id) }
end
