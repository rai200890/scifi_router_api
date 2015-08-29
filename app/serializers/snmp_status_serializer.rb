class SNMPStatusSerializer < ActiveModel::Serializer

  belongs_to :syslocation
  belongs_to :channel
  belongs_to :power
end
