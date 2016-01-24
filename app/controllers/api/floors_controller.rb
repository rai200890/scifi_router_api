class Api::FloorsController < ApplicationController
  respond_to :json

  has_scope :campus_id

  def index
    @floors = apply_scopes(Floor).all
    respond_with @floors
  end

  def show
    @floor = Floor.find(params[:id])
    respond_with @floor
  end

  def update
    @floor = Floor.find(params[:id])
    begin
      @floor.update_attributes(map: params[:file])
    rescue => e
      render json: {errors: e.message}, status: :unprocessable_entity
      return
    end
    respond_with @floor
  end

end
