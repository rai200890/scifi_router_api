# frozen_string_literal: true
class ApSerializer < ActiveModel::Serializer
  cache key: 'aps', expires_in: 3.hours

  attributes :id, :name, :wan_mac_address, :wlan_mac_address, :switch_name, :port, :socket, :panel_port, :ip,
             :comments, :validated, :syslocation, :real_latitude, :real_longitude, :map_latitude, :map_longitude, :height

  belongs_to :location
  belongs_to :ap_model
  belongs_to :ap_status
  belongs_to :control_region
end
