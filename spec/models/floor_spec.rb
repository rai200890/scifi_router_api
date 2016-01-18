require 'rails_helper'

RSpec.describe Floor, type: :model do
  it { should validate_presence_of(:building_id) }
end
