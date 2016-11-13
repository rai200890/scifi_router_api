# frozen_string_literal: true
class Api::LocationsController < ApplicationController
  include AuthConcern

  def index
    @locations = Location.all
    render json: @locations, each_serializer: LocationSerializer, status: :ok
  end

  def show
    @location = Location.where(id: params[:id]).first
    if @location
      render json: @location, status: :ok
    else
      head :not_found
    end
  end
end
