class AddMapToFloor < ActiveRecord::Migration
  def change
    add_column :floors, :map, :string
  end
end
