# frozen_string_literal: true
class Api::SnmpStatusesController < ApplicationController
    include AuthConcern

    def show
        ap = Ap.find(params[:ap_id])
        @snmp_status = SNMPFallbackClient.new.fetch(ap)
        if @snmp_status.errors.any?
          render json: {errors: @snmp_status.errors}, status: :unprocessable_entity
        else
          render json: @snmp_status.body, status: :ok
        end
    end

end
