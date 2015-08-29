class SNMPStatusItemSerializer < ActiveModel::Serializer

  attributes :name, :oid, :value

  def name
    object.name
  end

  def oid
    object.oid
  end

  def value
    object.value
  end

end
