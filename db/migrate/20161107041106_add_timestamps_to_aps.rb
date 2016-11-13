# frozen_string_literal: true
class AddTimestampsToAps < ActiveRecord::Migration
  def change
    add_column(:aps, :created_at, :datetime)
    add_column(:aps, :updated_at, :datetime)
  end
end
