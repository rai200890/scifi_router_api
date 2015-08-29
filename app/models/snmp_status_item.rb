class SNMPStatusItem
  include ActiveModel::Model

  attr_accessor :oid, :name, :value

  def initialize varbind_list
    @oid = varbind_list.name.to_a.join(".")
    @name = varbind_list.name.to_s
    @value = varbind_list.value == SNMP::NoSuchObject ?  nil : varbind_list.value.to_s
  end

end