class DepartmentSerializer < ActiveModel::Serializer
  cache key: 'departments', expires_in: 3.hours
  attributes :id, :name, :campus_name
end
