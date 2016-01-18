class Building < ActiveRecord::Base
  belongs_to :campus
  has_many :floors, dependent: :destroy

  validates :name, presence: true, uniqueness: { scope: :campus_id }
  validates :campus_id, presence: true

  delegate :id, :name, to: :campus, prefix: true, allow_nil: true
end
