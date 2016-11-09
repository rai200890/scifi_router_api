# frozen_string_literal: true
class AddMapToDepartments < ActiveRecord::Migration
	def change
		add_column :departments, :map, :string
	end
end
