class BuildingSerializer < ActiveModel::Serializer
  cache key: 'buildings', expires_in: 3.hours
  attributes :id, :name, :campus_name

end
