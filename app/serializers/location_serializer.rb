class LocationSerializer < ActiveModel::Serializer
  attributes :id, :name, :floor_number, :building_name, :campus_name
end
