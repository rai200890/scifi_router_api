# frozen_string_literal: true
class FullDepartmentSerializer < ActiveModel::Serializer
  attributes :id, :name, :campus_name, :map_url, :map_bounds, :map_center, :map_dimensions
end
