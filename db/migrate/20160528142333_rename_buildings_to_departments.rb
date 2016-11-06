class RenameBuildingsToDepartments < ActiveRecord::Migration
  def change
    rename_table :buildings, :departments
  end
end
