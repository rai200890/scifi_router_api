# frozen_string_literal: true
class CreateCampi < ActiveRecord::Migration
  def change
    create_table :campi do |t|
      t.string :name
      t.timestamps null: false
    end
  end
end
