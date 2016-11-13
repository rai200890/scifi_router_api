# frozen_string_literal: true
class Api::SnmpStatusesController < ApplicationController
    include AuthConcern

    def show
        ap = Ap.find(params[:ap_id])
        # begin
        # @snmp_status = SNMPStatusClient.new.get host: ap.ip
        mock_object = {
            syslocation: {
                name: 'SNMPv2-MIB::sysLocation.0',
                oid: '1.3.6.1.2.1.1.6.0',
                value: 'Sitting on the Dock of the Bay'
            },
            channel: {
                name: 'SNMPv2-SMI::enterprises.2021.8.1.101.30',
                oid: '1.3.6.1.4.1.2021.8.1.101.30',
                value: [1, 6, 11].sample # (1..11).to_a.sample
            },
            power: {
                name: 'SNMPv2-SMI::enterprises.2021.8.1.101.31',
                oid: '1.3.6.1.4.1.2021.8.1.101.31',
                value: [0, 4, 5, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20].sample
            }
        }
        render json: mock_object, status: :ok
        # render json: @snmp_status.parsed_response, status: ok
        # rescue Exception => e
        #   head :not_found
        # end
    end

    private

    def snmp_status_params
        params.permit(:host, :community, :port, :version, :mib_modules, :fields)
    end
end
