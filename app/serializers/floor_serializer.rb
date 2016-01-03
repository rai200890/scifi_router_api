class FloorSerializer < ActiveModel::Serializer
  attributes :id, :map_url, :map_bounds,
  :campus_id, :campus_name, :building_id, :building_name, :number
end
