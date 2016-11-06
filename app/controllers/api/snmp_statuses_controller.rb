class Api::SnmpStatusesController < ApplicationController
  respond_to :json

  def show
    ap = Ap.find(params[:ap_id])
    begin
      @snmp_status = SNMPStatusClient.new.get host: ap.ip
      respond_with @snmp_status.parsed_response
    rescue Exception => e
      render nothing: :true, status: 404
    end
  end

  private

  def snmp_status_params
    params.permit(:host, :community, :port, :version, :mib_modules, :fields)
  end

end
