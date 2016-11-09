# frozen_string_literal: true
class Api::LocationsController < ApplicationController
  respond_to :json

  def index
    @locations = Location.all
    respond_with @locations, each_serializer: LocationSerializer
  end

  def show
    @location = Location.find(params[:id])
    respond_with @location
  end
end
