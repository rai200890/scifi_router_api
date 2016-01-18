class Floor < ActiveRecord::Base
  mount_uploader :map, MapUploader
  belongs_to :building
  has_many :locations, dependent: :destroy

  validates :building_id, presence: true

  delegate :id, :name, to: :building, prefix: true, allow_nil: true
  delegate :campus_id, :campus_name, to: :building
  delegate :file, to: :map, allow_nil: true, prefix: true
  delegate :url, to: :map_file, allow_nil: true, prefix: :map

  def map_bounds
    if map_url
      width, height = FastImage.size(map_url)
      [[-height/2.0, -width/2.0],[height/2.0, width/2.0]]
    end
  end
end
