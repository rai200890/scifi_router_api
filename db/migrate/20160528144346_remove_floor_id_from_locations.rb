# frozen_string_literal: true
class RemoveFloorIdFromLocations < ActiveRecord::Migration
  def change
    remove_column :locations, :floor_id, :integer
  end
end
