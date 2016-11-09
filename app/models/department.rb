# frozen_string_literal: true
class Department < ActiveRecord::Base
  mount_uploader :map, MapUploader

  belongs_to :campus
  has_many :locations
  has_many :aps, through: :locations

  validates :name, presence: true, uniqueness: { scope: :campus_id }
  validates :campus_id, presence: true

  delegate :id, :name, to: :campus, prefix: true, allow_nil: true

  scope :department_or_campus_name, ->(name) do
    name = "%#{name}%".upcase
    eager_load(:campus).where('departments.name LIKE upper(?) or campi.name LIKE upper(?)', name, name)
  end

  scope :campus_id, ->(campus_id) { where(campus_id: campus_id) }

  delegate :file, to: :map, allow_nil: true, prefix: true

  def map_url
    map_file.url
  rescue
    nil
  end

  def map_bounds
    if map_url
      width, height = FastImage.size(map_url)
      [[-height / 2.0, -width / 2.0], [height / 2.0, width / 2.0]]
    end
  end
end
