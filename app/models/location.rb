class Location < ActiveRecord::Base
  belongs_to :floor

  delegate :building, to: :floor, allow_nil: true

  validates :name, uniqueness: { scope: :floor_id }
  validates :floor, presence: true

  def floor_number
    floor.number
  end

  def building_name
    building.name
  end

  def campus_name
    building.campus_name
  end

end