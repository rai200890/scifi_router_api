# frozen_string_literal: true
class AddDepartmentIdToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :department_id, :integer, index: true
  end
end
