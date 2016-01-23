class Api::FloorsController < ApplicationController
  respond_to :json

  def index
    @floors = Floor.all
    render json: @floors
  end

  def show
    @floor = Floor.find(params[:id])
    render json: @floor
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
