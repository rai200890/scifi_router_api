# frozen_string_literal: true
class RemoveBuildingIdFromLocations < ActiveRecord::Migration
  def change
    remove_column :locations, :building_id, :integer
  end
end
