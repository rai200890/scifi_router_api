class Campus < ActiveRecord::Base
  has_many :buildings, dependent: :destroy
  
  validates :name, presence: true, uniqueness: true
end
