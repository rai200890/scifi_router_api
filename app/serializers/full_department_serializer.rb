class FullDepartmentSerializer < ActiveModel::Serializer
  attributes :id, :name, :campus_name, :map_url, :map_bounds
end
