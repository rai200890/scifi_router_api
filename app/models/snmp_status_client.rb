# frozen_string_literal: true
class SNMPStatusClient
  include HTTParty

  attr_reader :errors, :body


  def fetch(ap)
    url = "#{ENV['SNMP_API_URL']}/#{ap.ip}"
    begin
      response = self.class.get(url,
        query: {
          token: ENV['SNMP_API_TOKEN'],
          oids: [ENV["SNMP_API_CHANNEL_MIB_OID"], ENV["SNMP_API_POWER_MIB_OID"]]
        })
      if response.code == 200
        @body = response.body
      else
        @errors = ["Couldn't fetch ap status"]
      end
    rescue => e
      @errors = [e.message]
    end
    self
  end

end
