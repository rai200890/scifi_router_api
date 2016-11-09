# frozen_string_literal: true
class ControlRegion < ActiveRecord::Base
  has_many :aps

  validates :name, presence: true, uniqueness: true
end
