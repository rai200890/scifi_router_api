class SNMPStatus
  include ActiveModel::Model
  include ActiveModel::Serialization
  attr_accessor :syslocation, :channel, :power

  def initialize params = {}
    @syslocation = SNMPStatusItem.new(params[:syslocation])
    @channel = SNMPStatusItem.new(params[:channel])
    @power = SNMPStatusItem.new(params[:power])
  end

end
