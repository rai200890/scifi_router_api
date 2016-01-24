class Api::SnmpStatusesController < ApplicationController
  respond_to :json

  def show
    ap = Ap.find(params[:ap_id])
    #@snmp_status = SNMPStatusClient.get host: ap.ip
    #@snmp_status = SNMPStatusClient.get host: 'localhost'
    #if @snmp_status.errors.any?
    #  render json: @snmp_status.errors.full_messages, status: :not_found
    #else
    #  render json: @snmp_status.response
    #end
    mock_object = {
    syslocation: {
      name: "SNMPv2-MIB::sysLocation.0",
      oid: "1.3.6.1.2.1.1.6.0",
      value: "Sitting on the Dock of the Bay"
    },
    channel: {
      name: "SNMPv2-SMI::enterprises.2021.8.1.101.30",
      oid: "1.3.6.1.4.1.2021.8.1.101.30",
      value: [1,6,11].sample#(1..11).to_a.sample
    },
    power: {
      name: "SNMPv2-SMI::enterprises.2021.8.1.101.31",
      oid: "1.3.6.1.4.1.2021.8.1.101.31",
      value: [0,4,5,7,8,9,10,11,12,13,14,15,16,17,18,19,20].sample
    }
  }
  render json: mock_object.to_json
  end

  def search
    @snmp_status = SnmpStatusClient.get snmp_status_params
    if @snmp_status.errors.any?
      render json: @snmp_status.errors.full_messages, status: :not_found
    else
      render json: @snmp_status.response
    end
  end

  private

  def snmp_status_params
    params.permit(:host, :community, :port, :version, :mib_modules, :fields)
  end

end
