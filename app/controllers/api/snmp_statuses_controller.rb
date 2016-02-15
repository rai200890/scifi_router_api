class Api::SnmpStatusesController < ApplicationController
  respond_to :json

  def show
    ap = Ap.find(params[:ap_id])
    #@snmp_status = SNMPStatusClient.get host: ap.ip
    @snmp_status = SNMPStatusClient.new.get host: params[:host]
    if @snmp_status.code == 200
      render json: @snmp_status.parsed_response
    else
      render status: 404
    end
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
