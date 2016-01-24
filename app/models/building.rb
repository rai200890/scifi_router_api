class Building < ActiveRecord::Base
  belongs_to :campus
  has_many :floors, dependent: :destroy

  validates :name, presence: true, uniqueness: { scope: :campus_id }
  validates :campus_id, presence: true

  delegate :id, :name, to: :campus, prefix: true, allow_nil: true

  scope :building_name, ->(name){
   building_name = "%#{name}%".upcase
   where("buildings.name LIKE upper(?)", building_name)
  }

  scope :campus_id, ->(campus_id){
    where(campus_id: campus_id)
  }

end
