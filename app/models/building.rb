class Building < ActiveRecord::Base
  belongs_to :campus
  has_many :floors, dependent: :destroy

  validates :name, presence: true, uniqueness: { scope: :campus_id }
  validates :campus_id, presence: true

  delegate :id, :name, to: :campus, prefix: true, allow_nil: true

  scope :building_or_campus_name, ->(name){
   name = "%#{name}%".upcase
   eager_load(:campus).where("buildings.name LIKE upper(?) or campi.name LIKE upper(?)", name, name)
  }

  scope :campus_id, ->(campus_id){
    where(campus_id: campus_id)
  }

end
