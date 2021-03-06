# frozen_string_literal: true
class Campus < ActiveRecord::Base
  has_many :buildings, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  scope :campus_name, ->(name) do
    campi_name = "%#{name}%".upcase
    where('campi.name LIKE upper(?)', campi_name)
  end
end
