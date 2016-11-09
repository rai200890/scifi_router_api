# frozen_string_literal: true
class SNMPStatusClient
  include HTTParty
  # base_uri ENV['SNMP_API_URL']

  def initialize
    @options = { token: ENV['SNMP_API_TOKEN'] }
  end

  def get(params)
    url = ENV['SNMP_API_URL'] + '/snmp/get'
    self.class.get(url, @options.merge(params))
  end
end
