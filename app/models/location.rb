class Location < ActiveRecord::Base
  belongs_to :department

  delegate :name, to: :department, prefix: true, allow_nil: true
  delegate :campus_name, to: :department, allow_nil: true

  validates :name, presence: true, uniqueness: { scope: :department_id }
  validates :department_id, presence: true

end
