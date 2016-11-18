# frozen_string_literal: true
class SNMPFallbackClient
  include HTTParty

  attr_reader :errors, :body

  def initialize
    @body = nil
    @errors = []
  end

  def get_channel(ap)
    url = "#{ENV['SNMP_FALLBACK_URL']}/#{ap.snmp_fallback_channel_path}"
    self.class.get(url).body.to_i
    rescue nil
  end

  def get_power(ap)
    url = "#{ENV['SNMP_FALLBACK_URL']}/#{ap.snmp_fallback_power_path}"
    self.class.get(url).body.to_i
    rescue nil
  end

  def fetch(ap)
    channel = get_channel(ap)
    power = get_power(ap)
    if channel && power
      @body = { channel: channel, power: power }
    else
      @errors << "Couldn't fetch ap status"
    end
    self
  end
end
