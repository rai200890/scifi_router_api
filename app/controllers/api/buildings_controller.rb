class Api::BuildingsController < ApplicationController
  respond_to :json

  has_scope :building_or_campus_name
  has_scope :campus_id

  def index
    @buildings = apply_scopes(Building).all
    respond_with @buildings
  end

end
