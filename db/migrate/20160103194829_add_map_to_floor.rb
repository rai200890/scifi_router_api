# frozen_string_literal: true
class AddMapToFloor < ActiveRecord::Migration
	def change
		add_column :floors, :map, :string
	end
end
