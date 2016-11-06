class DestroyFloors < ActiveRecord::Migration
  def up
    drop_table :floors
  end

  def down
    create_table :floors do |t|
      t.string :number
      t.integer :building_id
      t.timestamps null: false
    end
  end
end
