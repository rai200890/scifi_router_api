# frozen_string_literal: true
class ChangeLocalizationUsers < ActiveRecord::Migration[5.0]
  def change
    rename_column :aps, :latitude, :real_latitude
    rename_column :aps, :longitude, :real_longitude
    rename_column :aps, :lat, :map_latitude
    rename_column :aps, :lng, :map_longitude
  end
end
