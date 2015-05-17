class Location < ActiveRecord::Base
  belongs_to :building
  validates :name, presence: true, uniqueness: true
end
