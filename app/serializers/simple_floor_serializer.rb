class SimpleFloorSerializer < ActiveModel::Serializer
  attributes :id, :campus_id, :campus_name, :building_id, :building_name, :number
end
