class Building < ActiveRecord::Base
  belongs_to :campus
  has_many :floors

  validates :name, presence: true, uniqueness: { scope: :campus_id }
  validates :campus, presence: true

  delegate :name, to: :campus, prefix: true, allow_nil: true

end
